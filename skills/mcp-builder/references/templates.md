# MCP Server Templates

Used by `/mcp-builder`. Boilerplate templates for TypeScript and Python MCP servers.

---

## TypeScript Template (full)

Save as `mcp-[service].ts`. Run with `npx tsx mcp-[service].ts` or compile with `tsc`.

```typescript
#!/usr/bin/env node
/**
 * MCP Server: [ServiceName]
 * Tools: [tool1, tool2, tool3]
 * Auth: [Bearer token / API Key / OAuth]
 * Rate limit: [X requests per minute]
 * API docs: [url]
 */

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
  CallToolResult,
} from "@modelcontextprotocol/sdk/types.js";

// ─── Config ──────────────────────────────────────────────────────────────────

const API_KEY = process.env.[SERVICE]_API_KEY;
const BASE_URL = "[https://api.service.com/v1]";

if (!API_KEY) {
  console.error("Error: [SERVICE]_API_KEY environment variable is not set.");
  process.exit(1);
}

// ─── HTTP helper ─────────────────────────────────────────────────────────────

async function apiRequest(
  method: string,
  path: string,
  body?: unknown
): Promise<unknown> {
  const response = await fetch(`${BASE_URL}${path}`, {
    method,
    headers: {
      Authorization: `Bearer ${API_KEY}`,
      "Content-Type": "application/json",
    },
    body: body ? JSON.stringify(body) : undefined,
  });

  if (!response.ok) {
    const errorText = await response.text();
    throw new Error(
      `[ServiceName] API error ${response.status}: ${errorText}`
    );
  }

  return response.json();
}

// ─── Server setup ─────────────────────────────────────────────────────────────

const server = new Server(
  { name: "mcp-[service]", version: "1.0.0" },
  { capabilities: { tools: {} } }
);

// ─── Tool definitions ────────────────────────────────────────────────────────

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [
    {
      name: "[tool_name]",
      description:
        "[Plain English description of what this tool does and when to use it.]",
      inputSchema: {
        type: "object",
        properties: {
          [param_name]: {
            type: "string",
            description: "[What this parameter is for]",
          },
          [optional_param]: {
            type: "number",
            description: "[What this optional parameter does]",
          },
        },
        required: ["[param_name]"],
      },
    },
    // Add more tools here following the same pattern
  ],
}));

// ─── Tool handlers ───────────────────────────────────────────────────────────

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;

  if (!args) throw new Error("No arguments provided");

  if (name === "[tool_name]") {
    const data = await apiRequest("GET", `/[endpoint]/${args[param_name]}`);
    return {
      content: [{ type: "text", text: JSON.stringify(data, null, 2) }],
    } as CallToolResult;
  }

  throw new Error(`Unknown tool: ${name}`);
});

// ─── Start ───────────────────────────────────────────────────────────────────

const transport = new StdioServerTransport();
await server.connect(transport);
```

**Dependencies** (`package.json`):
```json
{
  "dependencies": {
    "@modelcontextprotocol/sdk": "^1.0.0"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "tsx": "^4.0.0",
    "typescript": "^5.0.0"
  }
}
```

---

## Python Template (full)

Save as `mcp_[service].py`. Run with `python mcp_[service].py`.

```python
#!/usr/bin/env python3
"""
MCP Server: [ServiceName]
Tools: [tool1, tool2, tool3]
Auth: [Bearer token / API Key / OAuth]
API docs: [url]
"""

import asyncio
import os
import json
import httpx
from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import Tool, TextContent, CallToolResult

# ─── Config ──────────────────────────────────────────────────────────────────

API_KEY = os.environ.get("[SERVICE]_API_KEY")
BASE_URL = "[https://api.service.com/v1]"

if not API_KEY:
    raise EnvironmentError("[SERVICE]_API_KEY environment variable is not set.")

# ─── HTTP helper ─────────────────────────────────────────────────────────────

async def api_request(method: str, path: str, body: dict | None = None) -> dict:
    async with httpx.AsyncClient() as client:
        response = await client.request(
            method=method,
            url=f"{BASE_URL}{path}",
            headers={
                "Authorization": f"Bearer {API_KEY}",
                "Content-Type": "application/json",
            },
            json=body,
        )
        response.raise_for_status()
        return response.json()

# ─── Server ───────────────────────────────────────────────────────────────────

app = Server("mcp-[service]")

@app.list_tools()
async def list_tools() -> list[Tool]:
    return [
        Tool(
            name="[tool_name]",
            description="[Plain English description of what this tool does.]",
            inputSchema={
                "type": "object",
                "properties": {
                    "[param_name]": {
                        "type": "string",
                        "description": "[What this parameter is for]",
                    },
                },
                "required": ["[param_name]"],
            },
        ),
    ]

@app.call_tool()
async def call_tool(name: str, arguments: dict) -> CallToolResult:
    if name == "[tool_name]":
        data = await api_request("GET", f"/[endpoint]/{arguments['[param_name]']}")
        return CallToolResult(
            content=[TextContent(type="text", text=json.dumps(data, indent=2))]
        )
    raise ValueError(f"Unknown tool: {name}")

# ─── Start ───────────────────────────────────────────────────────────────────

async def main():
    async with stdio_server() as (read_stream, write_stream):
        await app.run(read_stream, write_stream, app.create_initialization_options())

if __name__ == "__main__":
    asyncio.run(main())
```

**Dependencies**:
```
pip install mcp httpx
```

---

## Minimal TypeScript Template (quick start)

For simple single-tool servers:

```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { CallToolRequestSchema, ListToolsRequestSchema } from "@modelcontextprotocol/sdk/types.js";

const server = new Server({ name: "mcp-[service]", version: "1.0.0" }, { capabilities: { tools: {} } });

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [{ name: "[tool]", description: "[desc]", inputSchema: { type: "object", properties: {}, required: [] } }],
}));

server.setRequestHandler(CallToolRequestSchema, async ({ params }) => {
  // implement tool logic here
  return { content: [{ type: "text", text: "result" }] };
});

new StdioServerTransport().then(t => server.connect(t));
```
