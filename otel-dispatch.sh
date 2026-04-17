#!/bin/bash
# Reads Claude Code hook JSON from stdin, enriches it, and ships to your stack

INPUT=$(cat)
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name')
SESSION=$(echo "$INPUT" | jq -r '.session_id')
TOOL=$(echo "$INPUT" | jq -r '.tool_name // "none"')
AGENT_ID=$(echo "$INPUT" | jq -r '.agent_id // "main"')
AGENT_TYPE=$(echo "$INPUT" | jq -r '.agent_type // "main"')
TIMESTAMP_NS=$(date +%s%N)

# ── 1. BUILD ENRICHED LOG ENTRY ──────────────────────────────────────────────
case "$EVENT" in
  PostToolUse)
    # tool_response is the output you were missing
    TOOL_INPUT=$(echo "$INPUT" | jq -c '.tool_input')
    TOOL_OUTPUT=$(echo "$INPUT" | jq -c '.tool_response')
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, tool: .tool_name, input: .tool_input, output: .tool_response, agent_id: (.agent_id // "main"), agent_type: (.agent_type // "main")}')
    ;;

  PostToolUseFailure)
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, tool: .tool_name, input: .tool_input, error: .tool_error, agent_id: (.agent_id // "main")}')
    ;;

  Stop)
    # last_assistant_message = Claude's final response text
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, output: .last_assistant_message, agent_id: "main"}')
    ;;

  SubagentStop)
    # last_assistant_message = subagent's final response
    # agent_transcript_path = full subagent transcript file
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, agent_id: .agent_id, agent_type: .agent_type, output: .last_assistant_message, transcript: .agent_transcript_path}')
    ;;

  SubagentStart)
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, agent_id: .agent_id, agent_type: .agent_type}')
    ;;

  UserPromptSubmit)
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, prompt: .prompt}')
    ;;

  PreToolUse)
    LOG_MSG=$(echo "$INPUT" | jq -c \
      --arg ev "$EVENT" \
      '{event: $ev, tool: .tool_name, input: .tool_input, agent_id: (.agent_id // "main")}')
    ;;

  *)
    LOG_MSG=$(echo "$INPUT" | jq -c --arg ev "$EVENT" '{event: $ev}')
    ;;
esac

# ── 2. PUSH TO LOKI ───────────────────────────────────────────────────────────
LOKI_PAYLOAD=$(jq -n \
  --argjson ts "$TIMESTAMP_NS" \
  --arg session "$SESSION" \
  --arg event "$EVENT" \
  --arg tool "$TOOL" \
  --arg agent "$AGENT_TYPE" \
  --arg msg "$LOG_MSG" \
  '{
    streams: [{
      stream: {
        job: "claude-code",
        session_id: $session,
        event: $event,
        tool_name: $tool,
        agent_type: $agent
      },
      values: [[ ($ts | tostring), $msg ]]
    }]
  }')

curl -s -o /dev/null \
  -H "Content-Type: application/json" \
  -X POST "http://localhost:3100/loki/api/v1/push" \
  -d "$LOKI_PAYLOAD" &

# ── 3. PUSH OTEL SPAN TO TEMPO (via OTEL Collector) ──────────────────────────
# Only emit spans for tool calls to keep trace tree clean
if [[ "$EVENT" == "PreToolUse" || "$EVENT" == "PostToolUse" || "$EVENT" == "PostToolUseFailure" ]]; then
  TOOL_USE_ID=$(echo "$INPUT" | jq -r '.tool_use_id // empty')
  SPAN_PAYLOAD=$(jq -n \
    --arg session "$SESSION" \
    --arg tool "$TOOL" \
    --arg event "$EVENT" \
    --arg agent_id "$AGENT_ID" \
    --arg agent_type "$AGENT_TYPE" \
    --argjson ts_ns "$TIMESTAMP_NS" \
    --arg log "$LOG_MSG" \
    '{
      resourceSpans: [{
        resource: {
          attributes: [
            {key: "service.name", value: {stringValue: "claude-code"}},
            {key: "session.id",   value: {stringValue: $session}}
          ]
        },
        scopeSpans: [{
          spans: [{
            traceId: ($session | ltrimstr("-") | ascii_downcase | .[0:32] | gsub("[^0-9a-f]"; "0") | . + "0" * (32 - length)),
            spanId:  ($agent_id | .[0:16] | gsub("[^0-9a-f]"; "0") | . + "0" * (16 - length)),
            name: $tool,
            startTimeUnixNano: ($ts_ns | tostring),
            endTimeUnixNano:   (($ts_ns + 1000000) | tostring),
            attributes: [
              {key: "tool.name",   value: {stringValue: $tool}},
              {key: "hook.event",  value: {stringValue: $event}},
              {key: "agent.id",    value: {stringValue: $agent_id}},
              {key: "agent.type",  value: {stringValue: $agent_type}},
              {key: "log",         value: {stringValue: $log}}
            ]
          }]
        }]
      }]
    }')

  curl -s -o /dev/null \
    -H "Content-Type: application/json" \
    -X POST "http://localhost:4318/v1/traces" \
    -d "$SPAN_PAYLOAD" &
fi

# ── 4. PUSH METRICS TO PROMETHEUS PUSHGATEWAY ────────────────────────────────
if [[ "$EVENT" == "PostToolUse" || "$EVENT" == "PreToolUse" ]]; then
  cat <<PROM | curl -s -o /dev/null --data-binary @- \
    "http://localhost:9091/metrics/job/claude_code/session/$SESSION"
# TYPE claude_tool_calls_total counter
claude_tool_calls_total{event="$EVENT",tool="$TOOL",agent_type="$AGENT_TYPE"} 1
PROM
fi

wait  # let background pushes finish
exit 0
