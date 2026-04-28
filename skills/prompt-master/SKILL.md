---
name: prompt-master
description: Converts unstructured brain dumps into optimized prompts — apply once manually or embed in Claude's instructions to run automatically
---

# Prompt Master

Claude is ready to act on whatever you give it. That's a problem when your input is a messy voice-transcribed brain dump, an underspecified request, or a complex task described in one vague sentence. This skill restructures any prompt according to best practices — clear goal, context, format, constraints, examples — before Claude executes it. Works manually or embedded as an automatic step.

## Usage

Manual use:
```
/prompt-master [your unstructured prompt or brain dump]
```

At the end of a long prompt:
```
...Please optimize this using the prompt-master skill before running it.
```

Specifying a target task type:
```
/prompt-master [brain dump] — this is for a writing task
/prompt-master [brain dump] — the output should be JSON
```

## Auto-mode (recommended)

Add this to your CLAUDE.md or Claude Code general instructions:

```
Every time I write a medium to long unstructured prompt for a complex task,
auto-run the prompt-master skill on the input before processing it.
```

Claude will then automatically optimize every complex prompt without being asked.

## Instructions for Claude

When this skill is invoked with a prompt:

### 1. Read the input fully

Read the entire input before doing anything. Do not start restructuring after the first sentence — the key information is often buried at the end of a brain dump.

### 2. Identify the core intent

State in one sentence what the user is actually trying to accomplish. This is not a restatement of what they wrote — it's what they *mean*. If unclear, make an assumption and state it.

### 3. Detect the task type

Classify the prompt to apply the right optimization strategy:

- **Creative writing** — needs voice, tone, style constraints, audience definition
- **Research / analysis** — needs scope definition, output format, depth level
- **Code generation** — needs language, framework, constraints, test requirements
- **Decision support** — needs context, options framing, output format (recommendation vs. analysis)
- **Data processing** — needs input format, transformation rules, output schema
- **Communication** — needs audience, relationship context, tone, desired action
- **Ideation / brainstorming** — needs quantity target, constraints, evaluation criteria

See `references/templates.md` for optimized prompt templates per task type.

### 4. Diagnose the issues

Internally note what's unclear, missing, or unstructured. Common issues:
- **No goal**: what should the output actually be?
- **No context**: what does Claude need to know to produce a good result?
- **No format**: what should the output look like? (list, paragraph, JSON, table, etc.)
- **No constraints**: word count, tone, things to avoid?
- **No examples**: for ambiguous tasks, what does good look like?
- **Overloaded**: multiple tasks in one prompt — separate them?
- **Underspecified audience**: who is this for? Claude's defaults may not match.

Don't show this diagnosis to the user unless they ask.

### 5. Rewrite the prompt

Apply these best practices:

**Goal** — one clear sentence stating the desired outcome:
```
Write a 400-word LinkedIn post announcing [X] targeting [audience].
```

**Role** — assign Claude a role when it improves output quality:
```
You are a [role] with expertise in [domain].
```
Use roles for: technical writing, legal/medical drafts, specific industry contexts. Skip for: simple tasks, factual lookups.

**Context** — background the model needs:
- Relevant facts, constraints, past decisions
- What the user has already tried
- What makes this situation unusual or specific

**Format** — specify the output structure:
- Format type: paragraph / bullet list / numbered list / table / JSON / code
- Length: exact word count or range
- Structure: headings, sections, examples, tone

**Constraints** — what to include and exclude:
- What to avoid (specific words, phrases, approaches)
- What to always include
- Tone: formal / casual / technical / conversational

**Examples** — show what good looks like:
```
Example of ideal output: [paste 1-2 sentences]
```
Use when: the task is ambiguous or has a specific style requirement.

**Chain of thought** — for reasoning-heavy tasks:
```
Think step by step before giving your final answer.
```

### 6. Model routing (optional)

See `references/tool-routes.md` for guidance on which model and approach to use per task type:
- Simple formatting / rewrites → Haiku (fast, cheap)
- Complex analysis or writing → Sonnet (default)
- Deep reasoning, architecture decisions → Opus (when accuracy > speed)

If the task clearly warrants a different model, note it at the top of the optimized prompt:
```
// Recommended: claude-opus-4-7 (complex multi-step reasoning)
```

### 7. Output the optimized prompt

Deliver the optimized prompt in a code block so it's easy to copy:

````
```
[Optimized prompt here]
```
````

### 8. Run the optimized prompt immediately

Unless the user asked only for the optimization ("just show me the improved prompt"), execute it right after displaying it.

### 9. Multi-prompt chains

For complex tasks that require multiple steps, produce a prompt chain:

```
## Step 1: [Task description]
[Prompt 1]

---

## Step 2: [Task description — uses output from Step 1]
[Prompt 2]
```

See `references/chain-patterns.md` for common multi-step patterns.

## When NOT to optimize

Skip optimization for:
- Short, clear, one-sentence requests ("translate this to French")
- Tasks where the user wants the raw natural language experience
- When the user has already written a well-structured prompt

## Skill integrations

- **`/process-interviewer`** — if the brain dump is about building a workflow or skill, use this instead
- **`/fact-checker`** — if the prompt involves factual claims that need verification
- **`/humanizer`** — run on the optimized prompt itself if it'll be used as a writing template

## Notes

- Works best on prompts over 3 sentences or voice-transcribed inputs.
- Auto-mode is the highest-leverage setup — configure it once and every future prompt improves automatically.
- Reference files: `references/templates.md`, `references/tool-routes.md`, `references/chain-patterns.md`
