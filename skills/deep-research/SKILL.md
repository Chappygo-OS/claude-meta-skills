---
name: deep-research
description: Runs a token-efficient long-form research report via OpenAI's Deep Research API — use for market reports, competitor investigations, or any topic that needs more than a chat answer
---

# Deep Research

Chat answers cap out fast on any real research question. This skill wraps OpenAI's Deep Research API in a synchronous-blocking call, so the model waits once instead of polling for 10–20 minutes — roughly 95% less token use during the API run. Output is a saved markdown report with deduplicated sources.

## Usage

```
/deep-research [topic or question]
```

Examples:
```
/deep-research the AI agents market in the last 18 months
/deep-research compare LangChain, LlamaIndex, and DSPy for enterprise RAG
/deep-research investigate competitor [Brand] across positioning and pricing
```

## Instructions for Claude

When this skill is invoked:

1. **Check the API key** — confirm `OPENAI_API_KEY` is set in the environment. If missing, stop and tell the user to set it before running.

2. **Assess the prompt** — count words and check the opening stem. A prompt is under-specified if word count is below 15, or it starts with a generic stem like "what is", "how to", or "tell me about". If under-specified, run the clarifier; otherwise, skip to step 4.

3. **Clarify in three questions** — ask scope/timeframe, depth (overview / strategic brief / exhaustive), and focus angle (market sizing / competitive / regulatory / financial / custom). One question at a time. For technical topics, swap in tech scope, metrics, and use case.

4. **If a second brain or OS context is available**, pull existing notes, prior research, or the user's positioning so the report is grounded in their context, not generic.

5. **Build the enhanced prompt** — append a `Research parameters:` block with the three answers. Save it as `research_prompt_YYYYMMDD_HHMMSS.txt`.

6. **Run synchronously** — call the Deep Research API with `subprocess.run(..., check=True)`, default model `o4-mini-deep-research`, web search enabled, 1800-second timeout. The call blocks until done — no poll loop.

7. **Save and present** — write the report as `research_report_YYYYMMDD_HHMMSS.md`, print it, and append a numbered, deduplicated source list (URL-key dedupe, first-seen order preserved).

## Notes

- Requires `OPENAI_API_KEY` and an account with Deep Research API access.
- Expect a 10–20 minute wait. Don't run this for questions that fit in a chat answer — it's an expensive call.
- If the API fails or times out, the saved prompt file is enough to retry without re-running the clarifier.
- Deep Research is by OpenAI.
