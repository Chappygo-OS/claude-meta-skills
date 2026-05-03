---
name: prompt-master
description: Generates optimized prompts for any AI tool. Use when writing, fixing, improving, or adapting a prompt for LLM, Cursor, Midjourney, image AI, video AI, coding agents, or any other AI tool. Also converts brain dumps and unstructured inputs into structured, optimized prompts before execution. Applies model routing and chain patterns.
---

# Prompt Master

Takes any unstructured brain dump — especially voice-transcribed inputs — and restructures it as an optimized prompt before execution. Also generates optimized prompts for any target AI tool from scratch.

## Usage

Manual use:
```
/prompt-master [your unstructured prompt or brain dump]
/prompt-master [rough idea] — for [target tool]
```

Auto-mode (add to CLAUDE.md):
```
Every time I write a medium to long unstructured prompt for a complex task,
auto-run the prompt-master skill on the input before processing it.
```

---

## HARD RULES — NEVER VIOLATE

- **NEVER output a prompt without first confirming the target tool** — ask if ambiguous
- **NEVER embed techniques that cause fabrication in single-prompt execution:**
  - Mixture of Experts — model role-plays personas from one forward pass, no real routing
  - Tree of Thought — model generates linear text and simulates branching, no real parallelism
  - Graph of Thought — requires an external graph engine, single-prompt = fabrication
  - Universal Self-Consistency — requires independent sampling, later paths contaminate earlier ones
- **NEVER add Chain of Thought to reasoning-native models** (o3, o4-mini, DeepSeek-R1, Qwen3 thinking mode) — they think internally, CoT degrades output
- **NEVER ask more than 3 clarifying questions** before producing a prompt
- **NEVER pad output with explanations the user did not request**

---

## OUTPUT FORMAT — ALWAYS FOLLOW THIS

Your output is ALWAYS:
1. A single copyable prompt block ready to paste into the target tool
2. 🎯 Target: [tool name] · 💡 [One sentence — what was optimized and why]
3. If the prompt needs setup steps before pasting, add a short plain-English instruction note (1-2 lines max, ONLY when genuinely needed)

For copywriting and content prompts include fillable placeholders where relevant ONLY: [TONE], [AUDIENCE], [BRAND VOICE], [PRODUCT NAME].

---

## STEP 1 — IDENTIFY THE TARGET TOOL

Route to the correct template and syntax. If unclear, ask once.

### Claude (claude.ai, Claude API, Claude 4.x)
- Be explicit and specific — Claude follows instructions literally, not by inference
- XML tags help for complex multi-section prompts: `<context>`, `<task>`, `<constraints>`, `<output_format>`
- Claude Opus 4.x over-engineers by default — add "Only make changes directly requested. Do not add features or refactor beyond what was asked."
- Provide context and reasoning WHY, not just WHAT — Claude generalizes better from explanations
- Always specify output format and length explicitly

### ChatGPT / GPT-5.x / OpenAI GPT models
- Start with the smallest prompt that achieves the goal — add structure only when needed
- Be explicit about the output contract: what format, what length, what "done" looks like
- Constrain verbosity when needed: "Respond in under 150 words. No preamble. No caveats."

### o3 / o4-mini / OpenAI reasoning models
- SHORT clean instructions ONLY — these models reason across thousands of internal tokens
- NEVER add CoT, "think step by step", or reasoning scaffolding — it actively degrades output
- Keep system prompts under 200 words — longer prompts hurt performance on reasoning models

### Gemini 2.x / Gemini 3 Pro
- Strong at long-context and multimodal — leverage its large context window for document-heavy prompts
- Prone to hallucinated citations — always add "Cite only sources you are certain of. If uncertain, say [uncertain]."
- For grounded tasks add "Base your response only on the provided context. Do not extrapolate."

### Qwen 2.5 (instruct variants)
- Excellent instruction following, JSON output, structured data
- Provide a clear system prompt defining the role
- Works well with explicit output format specs including JSON schemas

### Qwen3 (thinking mode)
- Thinking mode: treat exactly like o3 — short clean instructions, no CoT
- Non-thinking mode: treat like Qwen2.5 instruct — full structure, explicit format, role assignment

### Ollama (local model deployment)
- ALWAYS ask which model is running before writing — Llama3, Mistral, Qwen2.5, CodeLlama all behave differently
- System prompt is the most impactful lever — include it in the output so user can set it in their Modelfile
- Temperature 0.1 for coding/deterministic tasks, 0.7-0.8 for creative tasks

### Llama / Mistral / open-weight LLMs
- Shorter prompts work better — these models lose coherence with deeply nested instructions
- Be more explicit than you would with Claude or GPT — instruction following is weaker
- Always include a role in the system prompt

### DeepSeek-R1
- Reasoning-native like o3 — do NOT add CoT instructions
- Outputs reasoning in `<think>` tags by default — add "Output only the final answer, no reasoning." if needed

### Claude Code (agentic)
- Starting state + target state + allowed actions + forbidden actions + stop conditions + checkpoints
- Stop conditions are MANDATORY — runaway loops are the biggest credit killer
- Claude Opus 4.x over-engineers — add "Only make changes directly requested. Do not add extra files, abstractions, or features."
- Always scope to specific files and directories — never give a global instruction without a path anchor
- Human review triggers required: "Stop and ask before deleting any file, adding any dependency, or affecting the database schema"

### Cursor / Windsurf
- File path + function name + current behavior + desired change + do-not-touch list + language and version
- "Done when:" is required — defines when the agent stops editing

### Cline (formerly Claude Dev)
- Starting state + target state + file scope + stop conditions + approval gates
- Add "Ask before running terminal commands" or "Ask before installing dependencies"

### GitHub Copilot
- Write the exact function signature, docstring, or comment immediately before invoking
- Describe input types, return type, edge cases, and what the function must NOT do

### Bolt / v0 / Lovable / Figma Make
- Always specify: stack, version, what NOT to scaffold, clear component boundaries
- Add "Do not add authentication, dark mode, or features not explicitly listed" to prevent feature bloat
- Lovable responds well to design-forward descriptions — include visual/UX intent
- v0 is Vercel-native — specify if you need non-Next.js output

### Devin / SWE-agent
- Fully autonomous — forbidden actions list is critical
- Scope the filesystem: "Only work within /src. Do not touch infrastructure, config, or CI files."

### Image AI — Generation (Midjourney, DALL-E 3, Stable Diffusion)
- **Midjourney**: Comma-separated descriptors, not prose. Subject first, then style, mood, lighting. Parameters at end: `--ar 16:9 --v 6`
- **DALL-E 3**: Prose description works. Add "do not include text in the image unless specified."
- **Stable Diffusion**: `(word:weight)` syntax. CFG 7-12. Negative prompt is MANDATORY.
- When user has an existing image to modify: read Template J in `references/templates.md`

### ComfyUI
- Node-based — ask which checkpoint model is loaded before writing
- Always output two separate blocks: Positive Prompt and Negative Prompt. Never merge them.
- Read Template K in `references/templates.md` for the full ComfyUI template.

### Video AI (Sora, Runway, Kling, LTX Video)
- Camera movement is critical — static vs dolly vs crane changes output dramatically
- Specify shot type, duration in seconds, lighting setup

### Voice AI (ElevenLabs)
- Specify emotion, pacing, emphasis markers, and speech rate directly
- Use SSML-like markers for emphasis

### Workflow AI (Zapier, Make, n8n)
- Trigger app + trigger event → action app + action + field mapping. Step by step.
- For multi-step workflows: number each step and specify what data passes between steps

### Perplexity / Research Orchestration AI
- Specify search vs analyze vs compare. Add citation requirements.
- Add "Flag any data point you are not confident about."

### Unknown tool
- Identify the closest matching category from context. If genuinely unclear, ask once.

---

## STEP 2 — EXTRACT INTENT (9 DIMENSIONS)

Before writing any prompt, silently extract these dimensions. Missing critical ones trigger clarifying questions (max 3 total).

| Dimension | What to extract | Critical? |
|-----------|----------------|-----------|
| **Task** | Specific action — convert vague verbs to precise operations | Always |
| **Target tool** | Which AI system receives this prompt | Always |
| **Output format** | Shape, length, structure, filetype of the result | Always |
| **Constraints** | What MUST and MUST NOT happen | If complex |
| **Input** | What the user is providing alongside the prompt | If applicable |
| **Context** | Domain, project state, prior decisions | If session has history |
| **Audience** | Who reads the output, their technical level | If user-facing |
| **Success criteria** | How to know the prompt worked — binary where possible | If task is complex |
| **Examples** | Desired input/output pairs for pattern lock | If format-critical |

---

## STEP 3 — DETECT TASK TYPE

Classify to apply the right optimization strategy:

- **Creative writing** — needs voice, tone, style constraints, audience definition
- **Research / analysis** — needs scope definition, output format, depth level
- **Code generation** — needs language, framework, constraints, test requirements
- **Decision support** — needs context, options framing, output format
- **Data processing** — needs input format, transformation rules, output schema
- **Communication** — needs audience, relationship context, tone, desired action
- **Ideation / brainstorming** — needs quantity target, constraints, evaluation criteria

See `references/templates.md` for optimized prompt templates per task type (Templates A–L).

---

## STEP 4 — DIAGNOSTIC CHECKLIST

Scan every user-provided prompt or rough idea for these failure patterns. Fix silently — flag only if the fix changes intent.

**Task failures**
- Vague task verb → replace with a precise operation
- Two tasks in one prompt → split, deliver as Prompt 1 and Prompt 2
- No success criteria → derive a binary pass/fail from the stated goal
- Emotional description ("it's broken") → extract the specific technical fault

**Context failures**
- Assumes prior knowledge → prepend memory block with all prior decisions
- Invites hallucination → add grounding constraint: "State only what you can verify. If uncertain, say so."

**Format failures**
- No output format specified → derive from task type and add explicit format lock
- Implicit length ("write a summary") → add word or sentence count
- No role assignment for complex tasks → add domain-specific expert identity

**Scope failures**
- No file or function boundaries for IDE AI → add explicit scope lock
- No stop conditions for agents → add checkpoint and human review triggers

**Reasoning failures**
- Logic or analysis task with no step-by-step → add "Think through this carefully before answering"
- CoT added to o3/o4-mini/R1/Qwen3-thinking → REMOVE IT

**Agentic failures**
- No starting state → add current project state description
- Silent agent → add "After each step output: ✅ [what was completed]"
- Unrestricted filesystem → add scope lock
- No human review trigger → add "Stop and ask before: [list destructive actions]"

See `references/patterns.md` for all 35 credit-killing patterns.

---

## STEP 5 — SAFE TECHNIQUES (apply only when genuinely needed)

**Role assignment** — for complex or specialized tasks only
- Weak: "You are a helpful assistant"
- Strong: "You are a senior backend engineer specializing in distributed systems who prioritizes correctness over cleverness"

**Few-shot examples** — when format is easier to show than describe. 2–5 examples max.

**Grounding anchors** — for any factual or citation task:
"Use only information you are highly confident is accurate. If uncertain, write [uncertain] next to the claim. Do not fabricate citations or statistics."

**Chain of Thought** — for logic, math, debugging on standard models ONLY (Claude, GPT, Gemini, Qwen2.5, Llama). NEVER on o3/o4-mini/R1/Qwen3-thinking.

**Memory block** — when the user's request references prior work, prepend context in the first 30% of the prompt:
```
## Context (carry forward)
- Stack and tool decisions established
- Architecture choices locked
- What was tried and failed
```

---

## STEP 6 — MULTI-PROMPT CHAINS (for complex tasks)

For tasks that require multiple steps, produce a prompt chain:

```
## Step 1: [Task description]
[Prompt 1]

---

## Step 2: [Task description — uses output from Step 1]
[Prompt 2]
```

See `references/templates.md` for common chain patterns (Templates C, H).

---

## WHEN NOT TO OPTIMIZE

Skip optimization for:
- Short, clear, one-sentence requests ("translate this to French")
- When the user has already written a well-structured prompt
- When the user asks "just show me the improved prompt" — show it, don't execute

---

## Skill integrations

- **`/process-interviewer`** — if the brain dump is about building a workflow or skill, use this instead
- **`/fact-checker`** — if the prompt involves factual claims that need verification
- **`/humanizer`** — run on the optimized prompt itself if it'll be used as a writing template

## Reference files

| File | Read When |
|------|-----------|
| `references/templates.md` | You need the full template structure for any tool category (Templates A–L) |
| `references/patterns.md` | User pastes a bad prompt to fix, or you need the complete 35-pattern reference |
| `references/tool-routes.md` | Haiku/Sonnet/Opus model routing guidance |
| `references/chain-patterns.md` | Multi-step prompt chain patterns |
