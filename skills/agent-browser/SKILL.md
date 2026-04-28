---
name: agent-browser
description: Autonomous browser agent — navigates web pages, extracts data, fills forms, and completes multi-step web tasks without you doing it manually
---

# Agent Browser

Most web tasks are repetitive: check a page, extract some data, fill a form, compare pricing across sites, collect leads from a directory. This skill turns Claude into an autonomous browser agent that handles those tasks end-to-end. You describe what you want — it navigates, extracts, and reports back.

**Requires**: a browser MCP tool (Playwright MCP, Puppeteer MCP, or similar) to be configured in your Claude setup.

## Usage

```
/agent-browser [what you want to do on the web]
```

Examples:
```
/agent-browser Go to [URL] and extract the pricing table into a structured JSON
/agent-browser Find the LinkedIn profiles of the 10 speakers at [conference name] and collect their names, titles, and LinkedIn URLs
/agent-browser Go to [competitor URL] and extract all their product features from the pricing page
/agent-browser Check if [URL] returns a 200 status and summarize what's on the page
/agent-browser Compare the homepage messaging of these 5 competitors: [URLs]
```

## Instructions for Claude

When this skill is invoked:

### 1. Clarify the task

Before navigating, confirm:
- **Target URL(s)**: specific pages, or search for them first?
- **Output format**: raw data, structured JSON, table, summary, or report?
- **Scope**: one page / multiple pages / a full crawl?
- **Login required?**: if yes, ask the user to provide credentials or configure auth first

### 2. Plan the navigation

Before clicking anything, state the plan:
- Pages to visit (in order)
- What to extract or do on each page
- How to handle pagination, "load more" buttons, or lazy-loaded content
- What to do if a page doesn't load or blocks the request

### 3. Navigate and execute

For each step:
- Take a screenshot before acting (to confirm you're on the right page)
- Extract content as structured data (not raw HTML)
- Handle pop-ups, cookie banners, and overlays before extracting — don't let them corrupt the data
- If a page blocks automated access, note it and try an alternative path (Google cache, archive.org, etc.)
- For forms: fill them exactly as specified, do not submit without user confirmation

### 4. Handle failures gracefully

If a page can't be reached or content isn't where expected:
- Report the failure clearly with the URL and HTTP status
- Suggest an alternative: different URL, cached version, manual extraction
- Continue with other pages if this was one of several

### 5. Deliver the output

Format the output as requested:
- **JSON**: structured object with named fields per item
- **Table**: Markdown table with clean headers
- **Summary**: bullet list of key findings per page
- **Report**: full structured analysis

Always include:
- Source URL for each data point
- Date/time of extraction
- Any data that was missing or couldn't be extracted

### 6. Rate limiting and ethics

- Add a 1–2 second pause between page loads to avoid rate limiting
- Do not bypass authentication gates that the user doesn't have access to
- Do not extract personal data (names + emails + phone numbers combined) from pages that don't explicitly make this data public
- If a site's `robots.txt` blocks automated access, note this and ask the user how to proceed

## Common task patterns

**Competitor analysis**:
1. Navigate to each competitor's pricing page
2. Extract: plan names, prices, features per plan, CTA text
3. Output: comparison table

**Lead list building from a public directory**:
1. Navigate to the directory
2. Extract entries matching the criteria
3. Paginate through all results
4. Output: structured list with name, title, company, URL

**Content monitoring**:
1. Navigate to target page(s)
2. Extract the content (text, prices, availability)
3. Compare to a previously saved version if available
4. Output: what changed (if anything)

**Form filling**:
1. Navigate to the form
2. Review all fields with the user before filling
3. Fill the form with the provided data
4. Screenshot the completed form before submitting
5. Submit only with explicit user confirmation

## Skill integrations

- **`/deep-research`** — use browser for data collection, then synthesize with deep-research
- **`/fact-checker`** — verify specific claims found during browsing
- **`/frontend-slides`** — turn competitor or market data into a comparison deck

## Notes

- This skill requires a browser MCP tool. If you don't have one configured, run `/mcp-builder Build a Playwright MCP for browser automation`.
- For JavaScript-heavy sites (SPAs): wait for content to fully load before extracting.
- Screenshots are useful for debugging — keep them for any task where the result needs verification.
