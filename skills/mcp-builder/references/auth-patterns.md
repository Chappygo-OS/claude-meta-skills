# Authentication Patterns

Used by `/mcp-builder`. Implementation patterns for each authentication type.

---

## API Key in Header (most common)

**When**: API provides a static key, passed as a header.

```typescript
// TypeScript
const headers = {
  "X-API-Key": process.env.SERVICE_API_KEY!,
  "Content-Type": "application/json",
};
```

```python
# Python
headers = {
    "X-API-Key": os.environ["SERVICE_API_KEY"],
    "Content-Type": "application/json",
}
```

**Common header names** (check the API docs):
- `X-API-Key`
- `x-api-key` (lowercase)
- `API-Key`

---

## Bearer Token

**When**: API uses JWT or OAuth access tokens passed as `Authorization: Bearer`.

```typescript
// TypeScript
const headers = {
  Authorization: `Bearer ${process.env.SERVICE_TOKEN}`,
  "Content-Type": "application/json",
};
```

```python
# Python
headers = {
    "Authorization": f"Bearer {os.environ['SERVICE_TOKEN']}",
    "Content-Type": "application/json",
}
```

---

## Basic Auth

**When**: API uses username/password authentication.

```typescript
// TypeScript
const credentials = Buffer.from(
  `${process.env.SERVICE_USERNAME}:${process.env.SERVICE_PASSWORD}`
).toString("base64");

const headers = {
  Authorization: `Basic ${credentials}`,
};
```

```python
# Python
import base64
credentials = base64.b64encode(
    f"{os.environ['SERVICE_USERNAME']}:{os.environ['SERVICE_PASSWORD']}".encode()
).decode()

headers = {"Authorization": f"Basic {credentials}"}
```

---

## API Key in Query String

**When**: API expects the key as a query parameter (less secure, but some older APIs require it).

```typescript
// TypeScript
const url = `${BASE_URL}/endpoint?api_key=${process.env.SERVICE_API_KEY}`;
```

```python
# Python
params = {"api_key": os.environ["SERVICE_API_KEY"]}
response = httpx.get(f"{BASE_URL}/endpoint", params=params)
```

---

## OAuth 2.0 Client Credentials Flow

**When**: Server-to-server authentication (no user login required). Common for Salesforce, HubSpot, enterprise APIs.

```typescript
// TypeScript — get access token first, then use it
async function getAccessToken(): Promise<string> {
  const response = await fetch("https://api.service.com/oauth/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "client_credentials",
      client_id: process.env.SERVICE_CLIENT_ID!,
      client_secret: process.env.SERVICE_CLIENT_SECRET!,
    }),
  });

  if (!response.ok) throw new Error("Failed to get access token");
  const data = await response.json() as { access_token: string };
  return data.access_token;
}

// Cache the token and refresh when needed
let cachedToken: { token: string; expires: number } | null = null;

async function getToken(): Promise<string> {
  if (cachedToken && Date.now() < cachedToken.expires) return cachedToken.token;
  const token = await getAccessToken();
  cachedToken = { token, expires: Date.now() + 3500 * 1000 }; // 58-min cache
  return token;
}
```

**Required env vars**:
```
SERVICE_CLIENT_ID=your_client_id
SERVICE_CLIENT_SECRET=your_client_secret
```

---

## OAuth 2.0 Authorization Code Flow

**When**: User-facing APIs that require the user to log in and grant permission (Google, GitHub, Slack, etc.).

This flow requires a callback URL and cannot be fully automated within an MCP server. Steps:

1. **Generate the auth URL** with `client_id`, `redirect_uri`, `scope`, and `state`
2. **User opens the URL** and approves access in the browser
3. **Receive the callback** with an authorization `code`
4. **Exchange the code** for an `access_token` and `refresh_token`
5. **Store the refresh_token** in env variables; use it to get new access tokens when they expire

```typescript
// TypeScript — token refresh (after initial setup)
async function refreshAccessToken(): Promise<string> {
  const response = await fetch("https://api.service.com/oauth/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "refresh_token",
      refresh_token: process.env.SERVICE_REFRESH_TOKEN!,
      client_id: process.env.SERVICE_CLIENT_ID!,
      client_secret: process.env.SERVICE_CLIENT_SECRET!,
    }),
  });

  const data = await response.json() as { access_token: string };
  return data.access_token;
}
```

**Note**: For OAuth APIs, tell the user to complete the initial authorization flow manually (browser login) before running the MCP server. The MCP server only handles token refresh.

---

## Environment Variable Setup by Platform

### macOS / Linux (add to `.zshrc` or `.bashrc`)
```bash
export SERVICE_API_KEY="your_key_here"
```

### Windows (permanent)
```cmd
setx SERVICE_API_KEY "your_key_here"
```

### Claude Code settings.json (per-server env)
```json
{
  "mcpServers": {
    "service-name": {
      "command": "node",
      "args": ["/path/to/server.js"],
      "env": {
        "SERVICE_API_KEY": "your_key_here"
      }
    }
  }
}
```

The `env` block in settings.json injects variables only for that MCP server process, without exposing them globally.

---

## Security Rules

- Never hardcode credentials in the source file
- Never log credentials (even in debug mode)
- Use `process.env.VAR!` in TypeScript (non-null assertion) + validate at startup
- For OAuth refresh tokens: store in the MCP server's env config, not in code
- For shared servers: use environment-level secret managers (AWS Secrets Manager, HashiCorp Vault) instead of plain env vars
