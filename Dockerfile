# Stdio bridge to the hosted Mozaika MCP server (streamable HTTP at https://mozaika.design/mcp).
# Introspection (initialize, tools/list) needs no key; tool calls take a free key from
# https://mozaika.design/connect, passed as MOZAIKA_KEY.
FROM node:22-alpine
ENV MOZAIKA_KEY=""
CMD ["sh", "-c", "if [ -n \"$MOZAIKA_KEY\" ]; then exec npx -y mcp-remote@0.14.3 https://mozaika.design/mcp --header \"Authorization: Bearer $MOZAIKA_KEY\"; else exec npx -y mcp-remote@0.14.3 https://mozaika.design/mcp; fi"]
