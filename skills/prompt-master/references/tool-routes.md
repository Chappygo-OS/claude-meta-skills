# Tool and Model Routing Guide

Used by `/prompt-master`. Guidance on which model, approach, and tools to route to for different task types.

---

## Model Selection

### Claude Haiku 4.5
**Best for**: Speed and cost efficiency on well-defined, low-stakes tasks.

Use when:
- Formatting, reformatting, or translating structured content
- Simple summarization (< 500 words input)
- Keyword extraction or classification
- Template filling from clear inputs
- Quick rewrites with explicit rules (e.g., "convert this to bullet points")

Do not use when:
- The task requires nuanced judgment or interpretation
- Multi-step reasoning is required
- The output will go directly to a client or executive

### Claude Sonnet 4.6
**Best for**: The default choice — excellent capability with good speed.

Use when:
- Writing, editing, or creating content with quality requirements
- Analyzing or processing medium-complexity documents
- Coding tasks (code generation, debugging, code review)
- Research and synthesis from multiple sources
- Multi-step prompts with dependencies between steps

### Claude Opus 4.7
**Best for**: Maximum reasoning quality on complex, high-stakes tasks.

Use when:
- Deep strategic analysis (architectural decisions, complex trade-offs)
- Long-form synthesis across many sources
- Tasks where missing a nuance could cause significant downstream errors
- Generating PRDs, technical specs, or documents that will be built from
- Complex code requiring correctness over speed

---

## Tool Selection

### Web search
**Use when**: The task requires current information (< 12 months old), verification of facts, or research that isn't in the model's training data.

**Do not use when**: The task can be completed from the provided context alone. Unnecessary searches slow down the response.

### File reading
**Use when**: The task explicitly involves a file the user has provided or referenced.

### Code execution
**Use when**:
- Verifying that generated code runs correctly
- Processing data that needs actual computation (not just description)
- Math or calculations that need to be precise

### MCP tools
**Use when**: The task requires reading from or writing to a connected external system (Notion, HubSpot, GitHub, etc.).

---

## Task-to-Route Mapping

| Task type | Model | Tools needed | Notes |
|-----------|-------|-------------|-------|
| Quick reformat | Haiku | None | Fast, low cost |
| Email draft | Sonnet | None | Good quality/speed balance |
| Research report | Sonnet | Web search | Enable search |
| Code generation | Sonnet | Code execution (optional) | Run to verify |
| Architectural decision | Opus | Web search (optional) | Quality matters most |
| Fact-checking | Sonnet | Web search | Search is required |
| Complex PRD | Opus | None | Reasoning quality critical |
| Data transformation | Haiku or Sonnet | Code execution | Haiku if simple rules |
| Long document analysis | Sonnet | File reading | Use context window |
| CRM update from notes | Sonnet | MCP tool | Needs tool access |

---

## Multi-Agent Routing

For tasks that benefit from multiple passes or perspectives:

### Draft → Review pattern
1. Agent 1 (Sonnet): generate the draft
2. Agent 2 (Sonnet): review the draft against criteria
3. Agent 1: revise based on review feedback

### Research → Synthesize pattern
1. Agent 1 (Sonnet + web search): gather information
2. Agent 2 (Opus): synthesize and analyze
3. Agent 1 (Sonnet): format for output

### Parallel analysis pattern (for decisions)
1. Agent 1: argue for Option A
2. Agent 2: argue for Option B
3. Orchestrator: synthesize both arguments and surface tensions

---

## Routing Signals in Prompts

Add these signals at the top of a prompt to guide model selection:

```
// Model: haiku (simple transformation, speed > quality)
// Model: sonnet (standard — default)
// Model: opus (complex reasoning, quality > speed)
// Tools: web-search
// Tools: code-execution
// Tools: [mcp-tool-name]
```

These are conventions for the `/prompt-master` skill to add when the task type clearly warrants a non-default choice.
