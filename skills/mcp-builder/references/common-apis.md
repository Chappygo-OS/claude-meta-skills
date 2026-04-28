# Common API Integration Notes

Used by `/mcp-builder`. Pre-researched patterns for popular APIs frequently requested for MCP integration.

---

## Notion

**Auth**: Bearer token (`NOTION_API_KEY`)
**Base URL**: `https://api.notion.com/v1`
**Required header**: `Notion-Version: 2022-06-28`

**Common tools to build**:
- `notion_search` — search pages and databases by title
- `notion_get_page` — get page content by ID
- `notion_create_page` — create a new page in a specified database
- `notion_append_block` — append content to a page

**Key note**: Notion page IDs are 32-character strings, often formatted as UUIDs. Strip hyphens when passing as a path parameter.

**Pagination**: uses `start_cursor` and `has_more` pattern for list endpoints.

---

## HubSpot

**Auth**: Bearer token (private app access token) or API key (legacy)
**Base URL**: `https://api.hubapi.com`

**Common tools to build**:
- `hubspot_get_contact` — get contact by email or ID
- `hubspot_create_contact` — create a new contact
- `hubspot_update_contact` — update contact properties
- `hubspot_search_contacts` — search by property value
- `hubspot_create_deal` — create a deal linked to a contact

**Key note**: HubSpot uses its own property names for fields (e.g., `email`, `firstname`, `hs_lead_status`). Use the Properties API to discover available fields.

---

## Stripe

**Auth**: API key in `Authorization: Bearer sk_...`
**Base URL**: `https://api.stripe.com/v1`
**Content-Type**: `application/x-www-form-urlencoded` (not JSON)

**Common tools to build**:
- `stripe_get_customer` — get customer by ID or email
- `stripe_list_subscriptions` — list subscriptions for a customer
- `stripe_get_invoice` — get invoice details
- `stripe_create_payment_link` — create a payment link

**Key note**: Stripe uses form-encoded bodies, not JSON. Use `URLSearchParams` in TypeScript, not `JSON.stringify`.

---

## Airtable

**Auth**: Bearer token (`AIRTABLE_API_KEY` or personal access token)
**Base URL**: `https://api.airtable.com/v0`
**Path pattern**: `/v0/{baseId}/{tableIdOrName}`

**Common tools to build**:
- `airtable_list_records` — list records in a table with optional filter
- `airtable_get_record` — get a single record by ID
- `airtable_create_record` — create a new record
- `airtable_update_record` — update fields on a record

**Key note**: Fields are nested under `fields` in the response object. Base IDs start with `app`, record IDs start with `rec`.

---

## Slack

**Auth**: Bot token (`SLACK_BOT_TOKEN`) from a Slack app
**Base URL**: `https://slack.com/api`
**Auth method**: `Authorization: Bearer xoxb-...`

**Common tools to build**:
- `slack_post_message` — post a message to a channel
- `slack_get_channel_history` — get recent messages from a channel
- `slack_search_messages` — search messages across the workspace
- `slack_get_user` — get user info by ID or email

**Key note**: All Slack API endpoints return `{ ok: true/false, error?: string }`. Always check `ok` before processing the response.

---

## Google Sheets

**Auth**: OAuth 2.0 (requires user authorization) or Service Account (server-to-server)
**Base URL**: `https://sheets.googleapis.com/v4`

**Recommended auth**: Service Account for server-side MCP servers.
1. Create a Service Account in Google Cloud Console
2. Download the JSON key file
3. Share the target spreadsheet with the service account email
4. Use the JSON key to get a JWT token

**Common tools to build**:
- `sheets_read_range` — read a range (e.g., `Sheet1!A1:D100`)
- `sheets_write_range` — write values to a range
- `sheets_append_rows` — append rows to the end of a sheet

---

## Linear

**Auth**: API key in `Authorization` header
**Protocol**: GraphQL (`https://api.linear.app/graphql`)

**Key note**: Linear uses GraphQL, not REST. All requests are POST to the same endpoint with a `query` body.

```typescript
async function linearQuery(query: string, variables?: object) {
  const response = await fetch("https://api.linear.app/graphql", {
    method: "POST",
    headers: {
      Authorization: process.env.LINEAR_API_KEY!,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ query, variables }),
  });
  const { data, errors } = await response.json();
  if (errors) throw new Error(errors[0].message);
  return data;
}
```

**Common tools to build**:
- `linear_get_issues` — list issues by team or status
- `linear_create_issue` — create a new issue
- `linear_update_issue` — change status, assignee, or priority

---

## GitHub

**Auth**: Personal access token (classic or fine-grained)
**Base URL**: `https://api.github.com`
**Required header**: `Accept: application/vnd.github.v3+json`

**Common tools to build**:
- `github_search_repos` — search repositories
- `github_get_issue` — get issue details by number
- `github_create_issue` — create a new issue
- `github_list_prs` — list open pull requests

**Rate limit**: 5,000 requests/hour with auth; check `X-RateLimit-Remaining` response header.

---

## Resend (email sending)

**Auth**: Bearer token (`RESEND_API_KEY`)
**Base URL**: `https://api.resend.com`

**Common tools to build**:
- `resend_send_email` — send a transactional email

```typescript
// TypeScript
const response = await fetch("https://api.resend.com/emails", {
  method: "POST",
  headers: {
    Authorization: `Bearer ${process.env.RESEND_API_KEY}`,
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    from: "sender@yourdomain.com",
    to: ["recipient@example.com"],
    subject: "Subject",
    html: "<p>Body</p>",
  }),
});
```
