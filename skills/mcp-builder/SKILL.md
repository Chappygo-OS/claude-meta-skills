---
name: mcp-builder
description: Builds a working MCP server for any software with an API — gets Claude connected to tools that don't have a native integration yet
---

# MCP Builder

MCP (Model Context Protocol) is how Claude Code connects to external software to read data and take actions. Most tools don't have a native MCP yet. This skill builds one from scratch using the software's API documentation. Output: a working MCP server file + step-by-step install guide.

**Note**: this is a native Anthropic skill available in Claude Code by default. It's included here for visibility — many people don't know it exists.

## Usage

```
/mcp-builder [software you want to connect]
```

Examples:
```
/mcp-builder Build an MCP server for Circle.so
/mcp-builder I need Claude to connect to our internal CRM at [API docs URL]
/mcp-builder Build an MCP for Reddit so I can read and post programmatically
```

## Instructions for Claude

When this skill is invoked:

1. **Identify the software and scope** — ask:
   - What software do you want to connect?
   - What do you need Claude to be able to do? (read data, create records, trigger actions, etc.)
   - Do you have API docs, an API key, or an OpenAPI spec?

2. **Read the API documentation** — fetch and analyze the API docs for the endpoints needed. Identify:
   - Authentication method (API key, OAuth, Bearer token)
   - Relevant endpoints for the requested capabilities
   - Request/response schemas
   - Rate limits and constraints

3. **Generate the MCP server** as a single file (TypeScript or Python depending on user preference, default TypeScript):
   - Implement `ListTools` — declare each capability as a named tool with input schema
   - Implement `CallTool` — handle each tool invocation with proper API calls
   - Handle authentication securely (read credentials from environment variables, never hardcode)
   - Add basic error handling with clear error messages
   - Include a usage comment at the top

4. **Generate the config JSON** — produce the JSON block to add to the Claude config file:
   ```json
   {
     "mcpServers": {
       "[software-name]": {
         "command": "node",
         "args": ["path/to/mcp-server.js"],
         "env": {
           "API_KEY": "your_api_key_here"
         }
       }
     }
   }
   ```

5. **Provide installation instructions**:
   - Where to find the Claude config file (`Settings → Developer → Edit Config`)
   - How to add the JSON block without breaking existing config
   - How to set the environment variable for the API key
   - How to verify the connection is working

6. **Offer to add the connector to Claude's config directly** if the user has the necessary file access.

## How to find your Claude config file

- **Claude Code**: `~/.claude/settings.json` or `Settings → Developer → Edit Config`
- **Claude.ai / co-work**: `Settings → Developer → Edit Config` in the app

Add the generated JSON to the `mcpServers` object and restart the session.

## Notes

- Works best when the target software has public API documentation.
- For OAuth-based APIs (Google, Salesforce, etc.), the auth flow requires additional setup — Claude will guide you through it.
- Once installed, the new connector appears in your integrations list and Claude can use it like any native tool.
