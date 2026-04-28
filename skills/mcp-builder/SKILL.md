---
name: mcp-builder
description: Builds a working MCP server for any software with an API — gets Claude connected to tools that don't have a native integration yet
---

# MCP Builder

MCP (Model Context Protocol) is how Claude Code connects to external software to read data and take actions. Most tools don't have a native MCP integration yet. This skill builds one from scratch using the software's API documentation. Output: a working MCP server file + config JSON + step-by-step install guide.

**Note**: this is a native Anthropic skill available in Claude Code by default. It's included here for visibility — many users don't know it exists.

## Usage

```
/mcp-builder [software you want to connect]
```

Examples:
```
/mcp-builder Build an MCP server for Circle.so
/mcp-builder I need Claude to connect to our internal CRM at [API docs URL]
/mcp-builder Build an MCP for Reddit so I can read and post programmatically
/mcp-builder Connect Claude to our Postgres database so I can query it in plain English
/mcp-builder Build an MCP for Stripe so Claude can check subscription status and invoices
```

## Instructions for Claude

When this skill is invoked:

### 1. Clarify scope

Ask:
- What software do you want to connect?
- What specific actions do you need Claude to perform? (read data, create records, trigger actions, search, etc.)
- Do you have API docs, an API key, or an OpenAPI spec? If yes, share the URL or paste the key endpoints.
- Language preference for the server: TypeScript (default) or Python?

Don't over-specify — 3–5 tools per MCP server is ideal. A focused server is easier to maintain and debug than a sprawling one.

### 2. Read and analyze the API documentation

Fetch and analyze the API docs for the requested endpoints. Identify:
- **Authentication method**: API key in header / query param, Bearer token, OAuth 2.0, Basic Auth
- **Base URL** and versioning pattern
- **Relevant endpoints**: the specific operations the user needs
- **Request schemas**: required fields, optional fields, data types
- **Response schemas**: what the API returns, including error responses
- **Rate limits**: requests per second/minute/day — add to comments in the server
- **Pagination**: cursor-based or offset-based — handle in list operations

See `references/auth-patterns.md` for implementation patterns per auth type.
See `references/common-apis.md` for pre-mapped patterns for popular APIs.

### 3. Generate the MCP server

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
    // more tools
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

**Python structure** (when requested):

See `references/templates.md` for the full Python boilerplate.

**Rules for every server**:
- Read credentials from environment variables only — never hardcode
- Wrap all API calls in try/catch with clear error messages that include the status code and API response
- Add JSDoc/docstring for each tool explaining what it does and when to use it
- Handle pagination automatically for list operations (fetch all pages, return combined results)
- Include the API rate limit as a comment on the fetch call

### 4. Generate the config JSON

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

For Python servers:
```json
{
  "mcpServers": {
    "[service-name]": {
      "command": "python",
      "args": ["/absolute/path/to/mcp-[service].py"],
      "env": {
        "[SERVICE]_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

### 5. Provide complete installation instructions

Step by step:

1. **Save the server file** — where to save it (suggest `~/.claude/mcp-servers/`)
2. **Install dependencies**:
   - TypeScript: `npm install @modelcontextprotocol/sdk` (in the server directory)
   - Python: `pip install mcp`
3. **Set the environment variable**:
   - macOS/Linux: `export [SERVICE]_API_KEY=your_key` (add to `~/.zshrc` or `~/.bashrc`)
   - Windows: `setx [SERVICE]_API_KEY your_key`
4. **Add config to Claude**:
   - Claude Code: open `~/.claude/settings.json`, add to the `mcpServers` object
   - Claude.ai: Settings → Developer → Edit Config → paste the JSON block
5. **Restart Claude** and verify: the service should appear in your integrations list
6. **Test the connection**: paste a test command the user can run immediately

### 6. Offer to add the config directly

If the user has Claude Code and the config file is accessible, offer to add the JSON block automatically to `~/.claude/settings.json`.

## How to find your Claude config file

- **Claude Code**: `~/.claude/settings.json`
- **Claude.ai**: Settings → Developer → Edit Config
- **Claude Desktop**: `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS)

## Skill integrations

- **`/process-interviewer`** — interview the user before building to clarify exactly which API operations they need
- **`/fact-checker`** — verify API endpoint details if the docs seem outdated

## Notes

- Works best when the target software has public, well-documented API docs.
- For OAuth-based APIs (Google, Salesforce, HubSpot), the auth flow requires additional setup — Claude will walk through the OAuth dance step by step.
- Once installed, the new connector appears in your integrations list and Claude can use it like any native tool.
- Reference files: `references/templates.md`, `references/auth-patterns.md`, `references/common-apis.md`
