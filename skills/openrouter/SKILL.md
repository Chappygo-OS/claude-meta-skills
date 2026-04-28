---
name: openrouter
description: Routes prompts to the best available AI model via OpenRouter — use when a task needs a non-Claude model, cost optimization, or model comparison
---

# OpenRouter

Claude is the best default. But sometimes you need a different model: GPT-4o for a client who requires OpenAI, Gemini for Google Workspace integration, Mistral for a cost-sensitive pipeline, or Llama for fully local/private use. This skill routes prompts through OpenRouter — a unified API that gives access to 100+ models — and helps you pick the right one.

**Requires**: `OPENROUTER_API_KEY` environment variable set.

## Usage

```
/openrouter [prompt or task]
```

With explicit model:
```
/openrouter [prompt] — use gpt-4o
/openrouter [prompt] — use mistral-large
/openrouter [prompt] — cheapest model that can do this well
```

Compare models:
```
/openrouter compare: [prompt] — run on gpt-4o, claude-3-5-sonnet, gemini-1.5-pro
```

## Instructions for Claude

When this skill is invoked:

### 1. Identify the task and model requirement

Determine why the user is routing to OpenRouter:
- **Specific model required** (e.g., client requires GPT-4o output)
- **Cost optimization** (find the cheapest model that can handle this task well)
- **Model comparison** (run the same prompt on multiple models, compare outputs)
- **Non-Claude capability** (a specific feature available in another model)
- **Privacy/local** (route to a self-hosted or private model)

### 2. Model selection (if not specified)

Apply this routing logic:

| Task type | Recommended model | Reason |
|-----------|------------------|--------|
| General writing/analysis | claude-sonnet-4-6 (default) | Best overall |
| Code generation | gpt-4o or claude-sonnet-4-6 | Both excel |
| Long context (>200k) | claude-3-5-sonnet (200k) or gemini-1.5-pro (1M) | Context length |
| Cost-sensitive pipelines | mistral-nemo, llama-3.1-8b | 10–50x cheaper |
| Image understanding | gpt-4o, claude-3-5-sonnet, gemini-1.5-pro | All strong |
| Function calling / JSON | gpt-4o-mini, claude-haiku | Fast and reliable |
| Client requires OpenAI | gpt-4o or gpt-4o-mini | Per requirement |
| Max reasoning | o1, claude-opus-4-7 | Deepest reasoning |

See OpenRouter model list at: https://openrouter.ai/models

### 3. Make the API call

```typescript
// OpenRouter API call
const response = await fetch("https://openrouter.ai/api/v1/chat/completions", {
  method: "POST",
  headers: {
    Authorization: `Bearer ${process.env.OPENROUTER_API_KEY}`,
    "Content-Type": "application/json",
    "HTTP-Referer": "[your app URL or name]",
    "X-Title": "[your app name]",
  },
  body: JSON.stringify({
    model: "[model-id]",  // e.g., "openai/gpt-4o", "anthropic/claude-3-5-sonnet", "mistralai/mistral-large"
    messages: [
      { role: "user", content: "[prompt]" }
    ],
    max_tokens: 2000,
    temperature: 0.7,
  }),
});

const data = await response.json();
console.log(data.choices[0].message.content);
```

**Model ID format on OpenRouter**: `[provider]/[model-name]`
- `openai/gpt-4o`
- `anthropic/claude-3-5-sonnet`
- `google/gemini-1.5-pro`
- `mistralai/mistral-large`
- `meta-llama/llama-3.1-70b-instruct`

### 4. Model comparison mode

When the user asks to compare models, run the same prompt on each requested model and present results side by side:

```
## Model Comparison: [task description]
**Prompt used**: [prompt]

---

### GPT-4o
[output]
**Cost**: ~$0.00X | **Latency**: Xs

---

### Claude 3.5 Sonnet
[output]
**Cost**: ~$0.00X | **Latency**: Xs

---

### Gemini 1.5 Pro
[output]
**Cost**: ~$0.00X | **Latency**: Xs

---

## Comparison Notes
- [Which model handled X better]
- [Which model was faster]
- [Cost comparison]
- [Recommendation for this task type]
```

### 5. Cost reporting

After any OpenRouter call, report:
- Model used
- Input tokens / output tokens
- Estimated cost
- Cost per 1,000 calls at this volume

This helps the user build a mental model of cost vs. quality trade-offs.

### 6. Setup instructions

If `OPENROUTER_API_KEY` is not set:

1. Go to https://openrouter.ai
2. Create an account and add credits
3. Generate an API key at https://openrouter.ai/keys
4. Set the key:
   - macOS/Linux: `export OPENROUTER_API_KEY=your_key`
   - Windows: `setx OPENROUTER_API_KEY your_key`
   - Claude Code settings: add to the relevant MCP server's `env` block

## Common model IDs reference

```
openai/gpt-4o                          — GPT-4o (latest)
openai/gpt-4o-mini                     — GPT-4o Mini (fast, cheap)
openai/o1                              — O1 reasoning model
anthropic/claude-3-5-sonnet            — Claude 3.5 Sonnet
anthropic/claude-3-haiku               — Claude 3 Haiku (fast)
google/gemini-1.5-pro                  — Gemini 1.5 Pro (1M context)
google/gemini-1.5-flash                — Gemini 1.5 Flash (fast)
mistralai/mistral-large                — Mistral Large
mistralai/mistral-nemo                 — Mistral Nemo (cheap)
meta-llama/llama-3.1-70b-instruct      — Llama 3.1 70B
meta-llama/llama-3.1-8b-instruct       — Llama 3.1 8B (cheapest usable)
```

Full list with pricing: https://openrouter.ai/models

## Skill integrations

- **`/mcp-builder`** — build a persistent OpenRouter MCP so Claude can call any model as a tool
- **`/prompt-master`** — optimize the prompt before routing to a potentially less capable model

## Notes

- OpenRouter bills per token. For cost-sensitive use: batch requests, optimize prompts, and use smaller models for simpler tasks.
- Model availability can change — check OpenRouter's model list for the latest.
- For production use: build an MCP server using `/mcp-builder` that wraps OpenRouter, so you can call it as a native tool.
