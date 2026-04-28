# Prompt Master tool routing profiles

This file is loaded on demand when SKILL.md needs the per-tool quirks and constraints for the confirmed target. Profiles are organized by category: reasoning models, general chat models, coding agents, image generation, video and audio generation, browser agents, 3D and game tools, and automation runtimes. Each row gives the load-bearing constraint that changes how the prompt should be shaped.

## Reasoning models

These models do their own reasoning. Forced chain-of-thought hurts them. System prompts must stay short.

| Tool | Constraint |
|---|---|
| OpenAI o3 / o4-mini | System prompt ≤ 200 words. NO chain-of-thought. No role-play padding. State the goal and the success criterion, nothing else. |
| DeepSeek-R1 | Suppress emitted `<think>` blocks in the user-facing output. No manual CoT. |
| Qwen3 (thinking mode) | No manual CoT. Branch the prompt by mode: thinking-mode prompts differ from non-thinking prompts. |
| Qwen2.5 / non-thinking | Plain instructions, light tags, can take CoT if the task warrants it. |
| Gemini 2.5 Pro Thinking / Gemini 3 Pro | Heavy context up front, structured headers. CoT is redundant; the model already reasons. |

## General chat models

| Tool | Constraint |
|---|---|
| Claude Sonnet / Opus 4.x | XML tags are first-class. Anti-overengineer ceiling — set explicit reasoning budget. Use `<thinking>` only when the task warrants it. |
| Claude 4.7 (1M context) | Same as Sonnet/Opus 4.x. The 1M window invites context dumps; resist — only relevant context should land in the prompt. |
| ChatGPT / GPT-5.x | Markdown structure (## headers). Role + task + format split is the cleanest shape. Avoid XML — Claude-native, not GPT-native. |
| Gemini 2.x / 3 Pro | Heavy context up front, structured headers, explicit length bound. |
| Llama 3 / Mistral | Plain instructions, light tags. No exotic structures. |
| MiniMax | Long-form friendly, structured headers, can handle dense briefs. |
| Ollama (any local model) | Ask which local model first. Never assume — Llama, Mistral, Phi, and Qwen each have different strengths. |

## Coding agents

The unifying rule: file scope, do-not-touch list, and Done When. Agents that take action without these over-run.

| Tool | Constraint |
|---|---|
| Claude Code | Mandatory stop conditions. Sequential prompt splits — never one mega-prompt. Hooks beat instructions for repeatable enforcement. |
| Antigravity | Goal + workspace map + Done When. The workspace map is non-optional. |
| Cursor | File path + function + do-not-touch + Done When. Cursor obeys file scope; use it. |
| Windsurf | Same as Cursor. Cascade mode benefits from explicit Done When. |
| Cline | File scope + acceptance criteria. Cline runs the tests when told to — make the criteria runnable. |
| Continue | Inline-comment style. Short prompts win. |
| GitHub Copilot | Inline-comment style at the call site. The model uses surrounding code as the actual prompt. |
| Devin | Full ticket: goal, repro, acceptance, environment. Treat as a junior engineer. |
| SWE-agent | Same as Devin — full ticket including failure mode and definition of done. |
| Aider | Conventional-commit style change descriptions. Aider edits diffs, not files. |

## UI and design generators

| Tool | Constraint |
|---|---|
| Bolt | UI brief + reference + scope guardrails. |
| v0 | Component-level brief. Specify the component name, the props, the states. |
| Lovable | Full feature spec — Lovable spans frontend and backend. Include the data model. |
| Figma Make | UI brief + reference (paste the Figma frame). |
| Google Stitch | UI brief + reference image. Stitch is reference-driven; without one, output drifts. |

## Research and browsing

| Tool | Constraint |
|---|---|
| Perplexity | Research framing, citation requirements, recency window. State the depth: quick / standard / deep. |
| Manus | Research framing with action authority — Manus can execute. State the budget (time, tokens). |
| ChatGPT with browsing | Specify the recency requirement and the citation format. |
| Claude with web search | Same — specify recency and the citation format. |

## Browser agents

| Tool | Constraint |
|---|---|
| Comet | URL + actions + stop. The stop condition is non-optional. |
| ChatGPT Atlas | Same — URL, actions, stop. |
| Claude in Chrome | URL + actions + stop. Add explicit forbidden actions (no form submit, no payment). |
| OpenClaw | URL + actions + stop. |
| Browserbase / Playwright agents | Add the trace-on-failure flag — debugging without traces is brutal. |

## Image generation

| Tool | Constraint |
|---|---|
| Midjourney v6 / v7 | Subject + setting + style + parameters. Use `--ar`, `--style raw`, `--no` for negatives. |
| DALL-E 3 | Natural language scene description. No comma-weighted tokens. |
| Stable Diffusion (any UI) | Comma-weighted tokens. Always include a negative prompt. |
| SeeDream | Scene + style reference. Reference-driven. |
| ComfyUI | Always two blocks: POSITIVE and NEGATIVE. Ask the checkpoint first (SD 1.5 / SDXL / Flux). |
| Flux (any frontend) | Natural language; less reliant on tokens than SD. Negative prompts still help. |
| Ideogram | Strong with text-in-image. State the exact text in quotes. |
| Adobe Firefly | Style reference IDs are first-class — use them. |

## Video generation

| Tool | Constraint |
|---|---|
| Sora | Shot list + camera + duration. Sora rewards structured beats. |
| Runway Gen-3 | Shot list + camera + duration. Add motion intensity. |
| Kling | Shot list + camera + duration. Strong on physics; specify the motion. |
| LTX Video | Short prompts win. State the action, not the cinematography theory. |
| Dream Machine (Luma) | Camera moves are first-class — name them (dolly in, orbit, push). |
| Hailuo / MiniMax video | Shot list + camera + duration. |

## Audio generation

| Tool | Constraint |
|---|---|
| ElevenLabs | Voice id + emotional direction + pacing. Inline tags for emotion (`<excited>`, `<whisper>`). |
| Orpheus | Inline tags: `<sigh>`, `<chuckle>`, `<whisper>`, `<excited>`, `<pause length="..."/>`, `<emphasis>`, `<slow>`. |
| Suno | Style + structure block (verse / chorus / bridge). State the BPM if it matters. |

## 3D and game tools

| Tool | Constraint |
|---|---|
| Meshy | Object + style + topology. State quad vs tri requirement. |
| Tripo | Object + style + topology. |
| Rodin | Object + style + topology. PBR materials are first-class. |
| Unity AI / BlenderGPT | Scene state + target state + tool list. The agent needs to know what's in the scene before it can change it. |

## Automation runtimes

| Tool | Constraint |
|---|---|
| Zapier | Trigger → step list → output schema. State the data shape at every step. |
| Make (Integromat) | Trigger → step list → output schema. Same as Zapier. |
| n8n | Trigger → step list → output schema. n8n accepts code nodes — say which steps are code. |

## Cross-cutting rules

- **Memory blocks live in the primacy zone.** If the prompt has prior decisions (style guide, voice profile, do-not-touch list), inject them in the first 30% of the prompt. Recency-zone memory loses to mid-prompt instructions.
- **Signal words by cost of failure.** Use **MUST** over should. Use **NEVER** over avoid. Use **EXACTLY** over roughly. Calibrate strength to the cost of getting it wrong.
- **Framework names never appear in user-facing output.** "CO-STAR", "RISEN", "CRISPE" are engine-internal labels. The emitted prompt is plain text.
- **Never combine more than two frameworks.** Layered structures (RTF inside CO-STAR inside RISEN) degrade quality. Pick the dominant frame and stop.

## Hard bans inside any single-prompt output

- Mixture of Experts patterns
- Tree of Thought
- Graph of Thought
- Universal Self-Consistency
- Layered Prompt Chaining inside one prompt
- Chain of Thought on reasoning-native models (o3, o4-mini, DeepSeek-R1, Qwen3 thinking)

When the user genuinely needs one of these, the answer is multiple prompts run in sequence — not a single mega-prompt.
