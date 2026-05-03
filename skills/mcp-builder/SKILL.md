---
name: mcp-builder
description: Builds a working MCP server for any software with an API — gets Claude connected to tools that don't have a native integration yet. Use when building MCP servers to integrate external APIs or services, whether in Python (FastMCP) or Node/TypeScript (MCP SDK). Guides the full workflow: research, implementation, testing, and evaluation.
---

# MCP Builder

MCP (Model Context Protocol) is how Claude connects to external software to read data and take actions. Most tools don't have a native MCP integration yet. This skill builds one from scratch using the software's API documentation.

Output: a working MCP server file + config JSON + step-by-step install guide + evaluation questions.

**Note**: this is a native Anthropic skill available in Claude Code by default. It's included here for visibility — many users don't know it exists.

---

## RECOMMENDED STACK

- **Language**: TypeScript (high-quality SDK support, good compatibility, widely documented, strong static typing)
- **Transport**: Streamable HTTP for remote servers (stateless JSON, simpler to scale). stdio for local servers.
- Python is fully supported — specify preference, TypeScript is the default.

---

## PHASE 1 — RESEARCH AND PLANNING

### 1.1 Clarify scope

Ask:
- What software do you want to connect?
- What specific actions do you need Claude to perform? (read data, create records, trigger actions, search, etc.)
- Do you have API docs, an API key, or an OpenAPI spec?
- Language preference: TypeScript (default) or Python?

Don't over-specify — 3–5 tools per MCP server is ideal.

### 1.2 Study the MCP protocol

Start with the sitemap to find relevant pages: `https://modelcontextprotocol.io/sitemap.xml`

Fetch specific pages with `.md` suffix for markdown format (e.g., `https://modelcontextprotocol.io/specification/draft.md`).

### 1.3 Load framework documentation

- [📋 MCP Best Practices](./references/mcp_best_practices.md) — universal naming, response formats, pagination, transport, security

**For TypeScript**: fetch `https://raw.githubusercontent.com/modelcontextprotocol/typescript-sdk/main/README.md`

**For Python**: fetch `https://raw.githubusercontent.com/modelcontextprotocol/python-sdk/main/README.md`

### 1.4 Read and analyze the target API

Fetch and analyze the API docs for the requested endpoints. Identify:
- **Authentication method**: API key in header / query param, Bearer token, OAuth 2.0, Basic Auth
- **Base URL** and versioning pattern
- **Relevant endpoints**: the specific operations the user needs
- **Request/response schemas**: required fields, data types
- **Rate limits**: add to comments in the server
- **Pagination**: cursor-based or offset-based

See `references/auth-patterns.md` for implementation patterns per auth type.
See `references/common-apis.md` for pre-mapped patterns for popular APIs (Notion, HubSpot, Stripe, Airtable, Slack, etc.).

---

## PHASE 2 — IMPLEMENTATION

### 2.1 Tool naming conventions

- Use snake_case with service prefix
- Format: `{service}_{action}_{resource}`
- Example: `slack_send_message`, `github_create_issue`

### 2.2 Generate the MCP server

Produce a single file (`mcp-[service-name].ts` or `mcp-[service-name].py`).

**TypeScript structure** (default):
```typescript
#!/usr/bin/env node
/**
 * MCP Server for [ServiceName]
 * Capabilities: [list the tools]
 * Auth: [auth method]
 * Rate limits: [limits from API docs]
 */

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";

const API_KEY = process.env.[SERVICE]_API_KEY;
const BASE_URL = "[api base url]";

const server = new Server(
  { name: "mcp-[service]", version: "1.0.0" },
  { capabilities: { tools: {} } }
);

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [
    {
      name: "[tool_name]",
      description: "[what this tool does, in plain English]",
      inputSchema: {
        type: "object",
        properties: {
          [param]: { type: "string", description: "[what this param is]" },
        },
        required: ["[required_params]"],
      },
    },
  ],
}));

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;
  if (name === "[tool_name]") {
    const response = await fetch(`${BASE_URL}/[endpoint]`, {
      headers: { Authorization: `Bearer ${API_KEY}` },
    });
    if (!response.ok) {
      throw new Error(`API error: ${response.status} ${await response.text()}`);
    }
    const data = await response.json();
    return { content: [{ type: "text", text: JSON.stringify(data, null, 2) }] };
  }
  throw new Error(`Unknown tool: ${name}`);
});

const transport = new StdioServerTransport();
await server.connect(transport);
```

See `references/templates.md` for the full Python boilerplate.

### 2.3 Tool annotations

Add to every tool:
```typescript
annotations: {
  readOnlyHint: true,    // does not modify its environment
  destructiveHint: false, // may perform destructive updates
  idempotentHint: false,  // repeated calls have no additional effect
  openWorldHint: true     // interacts with external entities
}
```

### 2.4 Rules for every server

- Read credentials from environment variables only — never hardcode
- Wrap all API calls in try/catch with clear error messages including status code and API response
- Add JSDoc/docstring for each tool explaining what it does and when to use it
- Handle pagination automatically for list operations (default limit: 20–50 items)
- Return `has_more`, `next_offset`, `total_count` in paginated responses

---

## PHASE 3 — CONFIG AND INSTALLATION

### 3.1 Generate config JSON

```json
{
  "mcpServers": {
    "[service-name]": {
      "command": "node",
      "args": ["/absolute/path/to/mcp-[service].js"],
      "env": {
        "[SERVICE]_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

For Python servers: replace `"command": "node"` with `"command": "python"`.

### 3.2 Installation instructions

1. **Save the server file** — suggest `~/.claude/mcp-servers/`
2. **Install dependencies**:
   - TypeScript: `npm install @modelcontextprotocol/sdk`
   - Python: `pip install mcp`
3. **Set the environment variable**:
   - macOS/Linux: `export [SERVICE]_API_KEY=your_key` (add to `~/.zshrc`)
   - Windows: `setx [SERVICE]_API_KEY your_key`
4. **Add config to Claude**:
   - Claude Code: open `~/.claude/settings.json`, add to `mcpServers` object
   - Claude.ai: Settings → Developer → Edit Config → paste the JSON block
5. **Restart Claude** and verify the service appears in your integrations
6. **Test with MCP Inspector**: `npx @modelcontextprotocol/inspector`

### 3.3 Offer to add the config directly

If the user has Claude Code and the config file is accessible, offer to add the JSON block automatically to `~/.claude/settings.json`.

---

## PHASE 4 — EVALUATION

After implementing the MCP server, create comprehensive evaluations to test its effectiveness.

### 4.1 Create 10 evaluation questions

Questions must be:
- **Independent**: not dependent on other questions
- **Read-only**: only non-destructive operations required
- **Complex**: requiring multiple tool calls and deep exploration
- **Realistic**: based on real use cases
- **Verifiable**: single, clear answer that can be verified by string comparison
- **Stable**: answer won't change over time

### 4.2 Output format

```xml
<evaluation>
  <qa_pair>
    <question>Find discussions about AI model launches with animal codenames. One model needed a specific safety designation that uses the format ASL-X. What number X was being determined for the model named after a spotted wild cat?</question>
    <answer>3</answer>
  </qa_pair>
  <!-- More qa_pairs... -->
</evaluation>
```

---

## Claude config file locations

- **Claude Code**: `~/.claude/settings.json`
- **Claude.ai**: Settings → Developer → Edit Config
- **Claude Desktop**: `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS)

---

## Skill integrations

- **`/process-interviewer`** — interview the user before building to clarify exactly which API operations they need
- **`/fact-checker`** — verify API endpoint details if the docs seem outdated

## Reference files

- `references/mcp_best_practices.md` — naming conventions, response formats, transport, security, error handling
- `references/templates.md` — full TypeScript and Python boilerplates
- `references/auth-patterns.md` — 6 auth patterns (API key, Bearer, Basic, query string, OAuth)
- `references/common-apis.md` — pre-researched integration notes for Notion, HubSpot, Stripe, Airtable, Slack, etc.
