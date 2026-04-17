## Loki
{job="claude-code", event="PostToolUse"}
| json
| line_format "🔧 {{.tool}} | IN: {{.input}} | OUT: {{.output}}"

## Full agent conversation
{job="claude-code", session_id="<your-session>"}
| json
| line_format "[{{.event}}] agent={{.agent_type}} {{.output}}{{.input}}"

## subagent output
{job="claude-code", session_id="<your-session>"}
| json
| line_format "[{{.event}}] agent={{.agent_type}} {{.output}}{{.input}}"

##
