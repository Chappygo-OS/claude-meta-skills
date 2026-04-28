---
name: agent-browser
description: Drives a real browser end-to-end via the accessibility tree — use for authenticated scraping, multi-page form fills, staging-vs-prod diffs, or any agentic flow that needs more than a single fetch
---

# Agent Browser

Raw DOM dumps burn 3,000–5,000 tokens per page and break the moment a class name changes. This skill drives the browser through the accessibility tree instead — short `@e1`, `@e2` refs that compress a page to a few hundred tokens and stay readable. Use it for stateful, multi-step browser work.

## Usage

```
/agent-browser [goal in plain English]
```

Examples:
```
/agent-browser log into app.acme.com and export this week's report
/agent-browser scrape pricing tiers across all 12 competitor pages
/agent-browser visual diff staging vs prod checkout at 1440x900
```

## Instructions for Claude

When this skill is invoked:

1. **Restate the goal** in one sentence and confirm what counts as "done" — a screenshot, an extracted field, a successful form submission.

2. **Pick the auth shortcut** — for personal automation on a dev machine, reuse the user's existing Chrome profile via `--profile <name>`. Zero setup, real cookies, no secret handling. Reach for vaults or session files only when the profile reuse won't work (CI, shared machines).

3. **Run the 4-step interaction loop** for every page:
   - **Open** — `agent-browser open <url>`
   - **Snapshot** — `agent-browser snapshot -i` returns the interactive accessibility tree with refs like `@e7 [button aria-label="Sign in"] "Sign in"`
   - **Act** — drive elements by ref: `click @e7`, `fill @e3 "alice@example.com"`, `select @e9 "Option 2"`, `press @e3 Enter`
   - **Re-snapshot** any time the DOM mutates. Old refs are invalid after a click, route change, or AJAX load.

4. **Batch when steps don't depend on each other** — chain open / fill / fill / click / wait into a single `agent-browser batch` call with `--bail` to stop on first failure. Use single calls only when the next step needs the prior output (e.g., reading a token from a snapshot).

5. **For multi-page workflows**, snapshot the listing once, capture every URL, then visit each with separate `open` calls. Never click-and-back through a list — 4 tool calls beats 14.

6. **If a second brain or OS context is available**, pull saved selectors, login URLs, or prior session names so the run can reuse what's already been figured out.

7. **Verify and clean up** — produce the screenshot, extracted data, or diff that proves the goal was met. Tear down sessions or profiles if they were created just for this run.

## Notes

- Requires the `agent-browser` CLI installed separately. This skill orchestrates it; it does not bundle it.
- Never use `wait --load networkidle` on ad-heavy or analytics-laden pages — telemetry beacons never quiet down. Prefer `wait <selector>`, `wait --url <pattern>`, or `wait --text "<string>"`.
- Refs are stable only inside one snapshot. If the page changes, re-snapshot before the next action.
