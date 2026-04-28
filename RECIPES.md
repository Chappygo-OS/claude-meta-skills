# Recipes — chaining skills together

Each skill auto-fires when Claude detects its intent. A chain forms when the output of one skill is shaped to be the input of the next — no orchestrator required, just skills that agree on shape.

## The canonical chain

**process-interviewer → prompt-master → agent-browser**

`process-interviewer` refuses the vague version of your request. It funnels you through scope, deliverable, decision-context, and constraints until you have a structured spec instead of an idea.

`prompt-master` takes that spec and compiles it into a hardened, tool-targeted prompt — explicit success criteria, stop conditions, output path, and the pages or selectors the next skill needs.

`agent-browser` runs the prompt against the live web using the accessibility tree, writes the artifact to disk, and surfaces failures cleanly instead of hallucinating around them.

Worked example — competitor pricing tracker: interview locks scope to three named competitors, deliverable to a side-by-side table, decision to a pricing-model bet. Prompt-master produces a per-target browse plan with stop conditions. Agent-browser returns one markdown file at the requested path.

## Other useful chains

### Publish-ready content
**[any writing skill] → humanizer → fact-checker** — generate, strip AI tells, verify claims.

### Meeting → decision
**audio-transcriber → decision-toolkit** — recording becomes structured framework on a real choice.

### Don't build what exists
**find-skills → process-interviewer** — search the registry first, scope only if nothing fits.

### Pitch deck from scratch
**process-interviewer → frontend-slides** — interview produces the spec, slides skill applies your brand.

### Cost-optimized execution
**openrouter ⊃ any skill that calls an LLM** — sits underneath, routes cheap models for trivial work, premium for hard.

## Pre-processors and post-processors

| Position | Skill | Why |
|---|---|---|
| Pre-processor for any agent prompt | `prompt-master` | Hardens raw input into a tool-targeted prompt |
| Post-processor for any content skill | `humanizer` | Strips AI tells before publish |
| Post-processor for any research skill | `fact-checker` | Stamps verdicts on synthesized claims |
| Underneath any LLM call | `openrouter` | Routes by cost and capability |

## Anti-chains

- `humanizer` before content generation — nothing to humanize yet.
- `fact-checker` on opinion pieces — categorical mismatch, verdicts are noise.
- `agent-browser` without `prompt-master` — weak instructions burn tokens and truncate runs.
- `process-interviewer` on a fully-specced task — skip the interview, go straight to prompt-master.

## Build your own

Identify the destination intent in one sentence, list two or three candidate skills that could plausibly contribute, then confirm each skill's output shape is recognizable as the next skill's input. If the shapes don't match, insert `prompt-master` to bridge them.
