---
name: openrouter
description: Calls hundreds of LLMs from OpenAI, Anthropic, Google, and others through one OpenAI-compatible endpoint with automatic fallback and cost-tier routing — use to add multi-provider reliability or replace direct SDK calls
---

# OpenRouter

Direct SDK calls lock you to one provider's outages, rate limits, and pricing. OpenRouter exposes hundreds of models behind the OpenAI schema — same code, different `base_url`. Add a fallback array and the gateway takes over when a provider fails. Route trivial work to free models, hard work to premium ones.

## Usage

```
/openrouter [what you want to build or migrate]
```

Examples:
```
/openrouter migrate this OpenAI script to use Claude with GPT-4o as fallback
/openrouter set up cost-tier routing — Gemini Flash for tagging, Sonnet for code
/openrouter add a backup model so this stops breaking when OpenAI rate-limits us
```

## Instructions for Claude

When this skill is invoked:

1. **Restate the goal** — drop-in replacement, fallback for reliability, cost-tier routing, or auto-routing. Pick one; the code differs.

2. **Confirm the API key** — `OPENROUTER_API_KEY` must be set. If missing, stop and tell the user to grab one at openrouter.ai.

3. **Use the OpenAI SDK with a different base URL** — the migration is a two-line change. Set `base_url="https://openrouter.ai/api/v1"` and pass `api_key=os.environ["OPENROUTER_API_KEY"]`. Model names use the `provider/model-name` format (e.g., `anthropic/claude-3.5-sonnet`, `openai/gpt-4o`, `google/gemini-2.0-flash-exp:free`).

4. **For reliability, pass a fallback array** — `models=["anthropic/claude-3.5-sonnet", "openai/gpt-4o", "google/gemini-2.0-flash-exp"]`. OpenRouter falls through on failure, and pricing follows whichever model actually responded. In Python, pass it via `extra_body`; in TypeScript, top-level.

5. **For cost-tier routing**, map task kind to model:
   - Trivial (tagging, classification, short summaries) → free or near-free models
   - Standard (boilerplate, formatting) → cheap models like `openai/gpt-4o-mini`
   - Hard (architecture, complex reasoning, long-form code) → premium like `openai/o1` or `anthropic/claude-3.5-sonnet`
   - Genuinely unsure which model fits → `model="openrouter/auto"` lets NotDiamond route by prompt content.

6. **If a second brain or OS context is available**, pull the user's existing model preferences, cost ceilings, or per-task choices so the routing matches what they've already decided.

7. **Verify cost after the run** — `response.model` reveals which model actually answered. Aggregate that across a week to audit cost-per-task and reroute.

## Notes

- Requires `OPENROUTER_API_KEY`. Set it in the environment, not in code.
- The OpenAI SDK works as-is — same shape for streaming, JSON mode, tool calling, multimodal, and prompt caching.
- "Zero completion insurance" means OpenRouter does not charge for empty or failed responses. Failed fallbacks are free.
