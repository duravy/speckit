const https = require('http'); // use 'https' if your stack uses TLS

// ── Read stdin ────────────────────────────────────────────────────────────────
let raw = '';
process.stdin.on('data', chunk => raw += chunk);
process.stdin.on('end', async () => {
  let event;
  try { event = JSON.parse(raw); }
  catch { process.exit(0); }

  const {
    hook_event_name: eventName,
    session_id: sessionId,
    tool_name: toolName = 'none',
    tool_input: toolInput,
    tool_response: toolOutput,    // ← PostToolUse output (was missing before)
    tool_error: toolError,
    last_assistant_message: agentOutput,  // ← Stop / SubagentStop output
    agent_id: agentId = 'main',
    agent_type: agentType = 'main',
    agent_transcript_path: agentTranscript,
    prompt: userPrompt,
  } = event;

  const timestampNs = BigInt(Date.now()) * 1_000_000n;

  // ── Build log line ──────────────────────────────────────────────────────────
  const logEntry = JSON.stringify({
    event: eventName,
    session_id: sessionId,
    tool: toolName,
    agent_id: agentId,
    agent_type: agentType,
    // inputs
    tool_input: toolInput,
    user_prompt: userPrompt,
    // outputs — these are what were missing
    tool_output: toolOutput,
    tool_error: toolError,
    agent_output: agentOutput,
    agent_transcript: agentTranscript,
  });

  // ── Push to Loki ────────────────────────────────────────────────────────────
  const lokiPayload = JSON.stringify({
    streams: [{
      stream: {
        job: 'claude-code',
        session_id: sessionId,
        event: eventName,
        tool_name: toolName,
        agent_type: agentType,
      },
      values: [[timestampNs.toString(), logEntry]]
    }]
  });

  await httpPost('localhost', 3100, '/loki/api/v1/push', lokiPayload);

  // ── Push span to OTEL Collector → Tempo ─────────────────────────────────────
  const TOOL_EVENTS = ['PreToolUse', 'PostToolUse', 'PostToolUseFailure'];
  if (TOOL_EVENTS.includes(eventName)) {
    const traceId = sessionId.replace(/-/g, '').padEnd(32, '0').slice(0, 32);
    const spanId  = agentId.replace(/-/g, '').padEnd(16, '0').slice(0, 16);

    const otelPayload = JSON.stringify({
      resourceSpans: [{
        resource: {
          attributes: [
            { key: 'service.name', value: { stringValue: 'claude-code' } },
            { key: 'session.id',   value: { stringValue: sessionId } },
          ]
        },
        scopeSpans: [{
          spans: [{
            traceId,
            spanId,
            name: `${agentType}/${toolName}`,
            startTimeUnixNano: timestampNs.toString(),
            endTimeUnixNano:  (timestampNs + 1_000_000n).toString(),
            attributes: [
              { key: 'tool.name',    value: { stringValue: toolName } },
              { key: 'hook.event',   value: { stringValue: eventName } },
              { key: 'agent.id',     value: { stringValue: agentId } },
              { key: 'agent.type',   value: { stringValue: agentType } },
              { key: 'tool.input',   value: { stringValue: JSON.stringify(toolInput) } },
              { key: 'tool.output',  value: { stringValue: JSON.stringify(toolOutput) } },
            ]
          }]
        }]
      }]
    });

    await httpPost('localhost', 4318, '/v1/traces', otelPayload);
  }

  // ── Push metric to Prometheus Pushgateway ───────────────────────────────────
  if (['PreToolUse', 'PostToolUse', 'PostToolUseFailure'].includes(eventName)) {
    const metric = `# TYPE claude_tool_calls_total counter\n` +
      `claude_tool_calls_total{event="${eventName}",tool="${toolName}",agent_type="${agentType}"} 1\n`;
    await httpPost('localhost', 9091,
      `/metrics/job/claude_code/session/${sessionId}`, metric,
      'text/plain');
  }

  process.exit(0);
});

// ── Helper ────────────────────────────────────────────────────────────────────
function httpPost(host, port, path, body, contentType = 'application/json') {
  return new Promise(resolve => {
    const req = https.request(
      { host, port, path, method: 'POST',
        headers: { 'Content-Type': contentType, 'Content-Length': Buffer.byteLength(body) } },
      res => { res.resume(); res.on('end', resolve); }
    );
    req.on('error', resolve); // never crash Claude on telemetry failure
    req.write(body);
    req.end();
  });
}
