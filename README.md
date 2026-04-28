# Claude Meta-Skills

I tested 47 Claude skills. 8 changed how I work.

Not workflow tools. These are **meta-skills** — they upgrade Claude across any task, any industry. Install them once, use them everywhere.

---

## The 8 Skills

| Skill | What it does |
|-------|-------------|
| `/process-interviewer` | Interviews you before building a skill — produces a full PRD before any implementation |
| `/prompt-master` | Converts brain dumps into structured, optimized prompts — with model routing and chain patterns |
| `/humanizer` | Removes AI writing markers from any text — based on a full severity taxonomy |
| `/fact-checker` | Verifies every factual claim against primary sources — with domain-specific guides |
| `/find-skills` | Searches 90,000+ community skills before you build from scratch — with quality gates |
| `/frontend-slides` | Builds animated HTML presentations with 5 style presets and full CSS animation library |
| `/decision-toolkit` | First-principles framework for big decisions — 9 lenses, HTML wizard, scenario templates |
| `/mcp-builder` | Builds an MCP server for any API — with TypeScript + Python templates and auth patterns |

Each skill ships with a `references/` folder — support files Claude uses during execution (frameworks, templates, examples, code snippets).

---

## Install

### Claude Code (desktop app / CLI)

Skills are invoked with slash commands (`/humanizer`, `/fact-checker`, etc.).

**One command — installs all 8:**

```bash
curl -s https://raw.githubusercontent.com/Chappygo-OS/claude-meta-skills/main/install.sh | bash
```

Restart Claude Code and invoke with `/skill-name`.

**Manual — pick what you need:**

```bash
git clone https://github.com/Chappygo-OS/claude-meta-skills.git
cp -r claude-meta-skills/skills/humanizer ~/.claude/skills/
# repeat for each skill you want
```

> **Windows**: copy to `%USERPROFILE%\.claude\skills\`

The `references/` subdirectory inside each skill folder is part of the skill — copy it along with `SKILL.md`.

---

### Claude.ai (web app)

These skills were built for Claude Code. In Claude.ai, paste the contents of a skill's `SKILL.md` directly into your project instructions or system prompt.

The `references/` files can also be attached as project knowledge — Claude will use them automatically when running the skill.

---

## Compatibility

| Skill | Claude Code | Claude.ai | Notes |
|-------|:-----------:|:---------:|-------|
| `humanizer` | ✅ | ✅ | Works as-is in both |
| `fact-checker` | ✅ | ✅ | Requires web search enabled |
| `prompt-master` | ✅ | ✅ | Auto-mode works in Claude Code; manual in Claude.ai |
| `decision-toolkit` | ✅ | ✅ | HTML wizard output renders in Claude.ai artifacts |
| `frontend-slides` | ✅ | ✅ | HTML output renders as an artifact |
| `find-skills` | ✅ | ⚠️ | Requires web search enabled |
| `mcp-builder` | ✅ | ⚠️ | Generates MCP code, but installation requires Claude Code |
| `process-interviewer` | ✅ | ✅ | Works as a structured interviewer in both |

---

## What each skill does

### `/process-interviewer`

Before building anything, Claude jumps to action too fast. This skill conducts a structured deep interview — 10–15 questions, one at a time — to reach shared understanding before any implementation starts.

Output: a full skill PRD (name, description, trigger, inputs, step-by-step instructions, output format, edge cases) ready to hand back to Claude to build from.

**Includes**: `references/interview-rules.md` (10 interview principles), `references/question-banks.md` (question sets for 7 process types: writing, research, communication, ops, data, automation, decision support).

---

### `/prompt-master`

Takes any unstructured brain dump — especially voice-transcribed inputs — and restructures it as an optimized prompt before execution. Applies: goal, role, context, format, constraints, examples, chain-of-thought.

Best used in auto-mode: add one line to your CLAUDE.md and it runs automatically on every complex prompt.

**Includes**: `references/templates.md` (8 optimized prompt templates by task type), `references/tool-routes.md` (Haiku/Sonnet/Opus routing guide), `references/chain-patterns.md` (6 multi-step prompt chain patterns).

---

### `/humanizer`

Detects and removes AI writing markers based on a documented severity taxonomy: filler openers, hype words, vague intensifiers, structural tells, hedge phrases, transition padding, passive overuse, future-tense closes.

Can extract a voice profile from sample text to preserve the author's natural style. Shows a diff of what changed and why.

**Includes**: `references/patterns.md` (full marker taxonomy with severity levels), `references/examples.md` (4 before/after transformations), `references/voice-profiles.md` (how to extract and apply a voice profile).

---

### `/fact-checker`

Extracts every verifiable claim — statistics, named facts, causal claims, technical assertions, quotes — and checks each against primary sources. Returns a structured report: ✅ true / ⚠️ mostly true / ❓ unverifiable / ❌ false / 🔄 outdated.

Especially important for AI-generated content where hallucinated statistics, phantom studies, and fabricated quotes are common.

**Includes**: `references/source-hierarchy.md` (4-tier source ranking guide), `references/anti-patterns.md` (9 AI hallucination patterns to watch for), `references/domain-guides.md` (verification guidance for AI/tech, business, science, legal, and history claims).

---

### `/find-skills`

Before building a skill from scratch, check if it already exists. Searches skills.sh (90,000+ community skills) by task description — multiple search strategies, results ranked by install count and recency.

Applies quality gates before recommending: install count, last-updated date, description clarity, scope fit, author reputation. Bridges directly to `/process-interviewer` when no good match is found.

**Includes**: `references/quality-gates.md` (5-dimension scoring rubric), `references/search-strategies.md` (search patterns by task category).

---

### `/frontend-slides`

Builds animated HTML presentations as a single self-contained file — no external dependencies. Works from scratch, from a topic, or by converting PPT/outline input. Applies your brand guide automatically.

Supports: keyboard and click navigation, fullscreen, speaker notes toggle, CSS transitions, animated counters, staggered bullet reveals.

**Includes**: `references/presets.md` (5 ready-to-use CSS style presets: minimal, neon-cyber, warm-editorial, corporate-blue, bold-impact), `references/layout-rules.md` (specs for 8 slide types), `references/animation-library.md` (CSS animation code snippets).

---

### `/decision-toolkit`

For significant decisions — pricing, hiring, product bets, partnerships, pivots. Applies 9 framework lenses: start-fresh test, stakeholder mapping, bias audit, timing test, opportunity cost, pre-mortem, scenario analysis, regret minimization, second-order effects.

Produces both a markdown report and an interactive HTML wizard. Guides — doesn't decide.

**Includes**: `references/frameworks.md` (8 decision frameworks in depth: First Principles, Second-Order Thinking, Regret Minimization, Two-Way Door, Pre-mortem, WRAP, 10-10-10, Expected Value), `references/biases.md` (11 cognitive biases with detection questions and counters), `references/scenarios.md` (6 pre-built decision templates: pricing, hiring, build-vs-buy, feature prioritization, new market, fire-vs-coach).

---

### `/mcp-builder`

If a tool you use doesn't have a native Claude integration, this builds one from its API docs. Output: working MCP server file + config JSON + complete install guide.

Supports TypeScript (default) and Python. Handles all auth types. Can offer to add the config directly to `~/.claude/settings.json`.

**Note**: native Anthropic skill available in Claude Code by default — included here because most people don't know it exists.

**Includes**: `references/templates.md` (full TypeScript and Python boilerplates), `references/auth-patterns.md` (6 auth patterns: API key, Bearer, Basic, query string, OAuth client credentials, OAuth authorization code), `references/common-apis.md` (pre-researched integration notes for Notion, HubSpot, Stripe, Airtable, Slack, Google Sheets, Linear, GitHub, Resend).

---

## Built by

[Pablo Nastar](https://www.linkedin.com/in/pablo-nastar/) — AI agency [ChappyGo](https://chappygo.com), Toulouse.

We help SMEs automate real work with AI agents — not just chatbots.

---

If these are useful → ⭐ star the repo. It helps others find it.
