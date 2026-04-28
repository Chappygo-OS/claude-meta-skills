# Claude Meta-Skills

I tested 47 Claude skills. 8 changed how I work.

Not workflow tools. These are **meta-skills** — they upgrade Claude across any task, any industry. Install them once, use them everywhere.

---

## The 8 Skills

| Skill | What it does |
|-------|-------------|
| `/process-interviewer` | Interviews you before building a skill — avoids bad specs and endless optimization loops |
| `/prompt-master` | Converts brain dumps into structured, optimized prompts |
| `/humanizer` | Removes AI writing markers from any text before it reaches a human reader |
| `/fact-checker` | Verifies every factual claim against external sources |
| `/find-skills` | Searches 90,000+ community skills before you build from scratch |
| `/frontend-slides` | Builds animated HTML presentations with your brand guide |
| `/decision-toolkit` | First-principles framework for big decisions — guides without deciding |
| `/mcp-builder` | Builds an MCP server for any software with an API |

---

## Install

### Claude.ai (web app)

Skills load from your account — no terminal needed.

1. Download the `.zip` for each skill you want from the [`dist/`](./dist) folder
2. Go to **Settings → Capabilities → Skills → Upload skill**
3. Upload each `.zip` one by one and toggle it on

Once active, Claude applies them automatically when it detects the skill matches what you're asking. No slash commands — it just works.

**Download individual skills:**

| Skill | Download |
|-------|----------|
| humanizer | [humanizer.zip](./dist/humanizer.zip) |
| fact-checker | [fact-checker.zip](./dist/fact-checker.zip) |
| prompt-master | [prompt-master.zip](./dist/prompt-master.zip) |
| decision-toolkit | [decision-toolkit.zip](./dist/decision-toolkit.zip) |
| frontend-slides | [frontend-slides.zip](./dist/frontend-slides.zip) |
| process-interviewer | [process-interviewer.zip](./dist/process-interviewer.zip) |
| find-skills | [find-skills.zip](./dist/find-skills.zip) |
| mcp-builder | [mcp-builder.zip](./dist/mcp-builder.zip) |
| audio-transcriber | [audio-transcriber.zip](./dist/audio-transcriber.zip) |
| deep-research | [deep-research.zip](./dist/deep-research.zip) |
| file-organizer | [file-organizer.zip](./dist/file-organizer.zip) |
| agent-browser | [agent-browser.zip](./dist/agent-browser.zip) |
| openrouter | [openrouter.zip](./dist/openrouter.zip) |

---

### Claude Code (desktop app / CLI)

Skills are invoked with slash commands (`/humanizer`, `/fact-checker`, etc.).

**One command — installs all 13:**

```bash
curl -s https://raw.githubusercontent.com/Chappygo-OS/claude-meta-skills/main/install.sh | bash
```

Restart Claude Code and invoke with `/skill-name`.

**Manual — pick what you need:**

```bash
git clone https://github.com/Chappygo-OS/claude-meta-skills.git
cp -r claude-meta-skills/skills/humanizer ~/.claude/skills/
# repeat for any skill you want
```

> **Windows**: copy to `%USERPROFILE%\.claude\skills\`

---

## Claude.ai vs Claude Code — compatibility

The skills were built for Claude Code. They work in Claude.ai too, with some nuances.

**Work great in Claude.ai**

| Skill | Notes |
|-------|-------|
| `humanizer` | Auto-activated when Claude detects AI-generated text |
| `fact-checker` | Needs web search enabled to verify sources |
| `prompt-master` | Useful when you paste long brain dumps |
| `decision-toolkit` | Works as a strategic interviewer |
| `frontend-slides` | Generates HTML artifacts directly |

**Work with limitations**

| Skill | Limitation |
|-------|------------|
| `find-skills` | Searches skills.sh — requires web search enabled |
| `mcp-builder` | Generates MCP code, but output is a downloadable file, not a direct install |
| `process-interviewer` | Designed to guide skill creation in Claude Code — still useful as a structured interviewer |

---

## What each skill does

### `/process-interviewer`

Before building anything, Claude jumps to action too fast. This skill interviews you with 10–15 deep questions to reach shared understanding first. Output: a full skill PRD you hand back to Claude to build from.

Use it for: any skill or automation you're struggling to spec clearly.

---

### `/prompt-master`

Takes any unstructured brain dump (especially voice-transcribed) and rewrites it as a clean, optimized prompt before Claude executes it. Best used in auto-mode — add one line to your Claude instructions and it runs automatically on every complex prompt.

---

### `/humanizer`

Detects and removes AI writing tells: "unlock", "game-changer", filler openers, symmetrical bullet lists, vague intensifiers. Based on documented AI writing patterns. Run it on anything AI-generated before it reaches a human. Embed it as the last step in any writing skill.

---

### `/fact-checker`

Extracts every verifiable claim in a text, searches for primary sources, and returns a structured report: ✅ true / ⚠️ mostly true / ❓ unverifiable / ❌ false. Use it on AI output, your own drafts, or anyone else's content. Especially useful for video scripts and LinkedIn posts.

---

### `/find-skills`

Before building a skill, check if it already exists. Searches skills.sh by task description, returns results ranked by install count, and can install the best match directly.

---

### `/frontend-slides`

Builds animated HTML presentations from scratch or converts PPT files. Embed your brand guide once and every deck comes out in your colors, fonts, and layout — no design tool needed.

---

### `/decision-toolkit`

For big decisions (pricing, hiring, product bets). Applies a first-principles framework: start-fresh test, stakeholder mapping, bias check, timing, opportunity cost, scenario analysis. Produces both a markdown report and an interactive HTML wizard. Guides — doesn't decide.

---

### `/mcp-builder`

If a software you use doesn't have a native Claude integration, this builds one from its API docs. Output: working MCP server file + config JSON + step-by-step install guide. Native Anthropic skill — included here because most people don't know it exists.

---

## Extras

Five additional skills that extend the core 8. They're separated because most need extra setup (API keys or local installs).

| Skill | What it does | Setup |
|-------|--------------|-------|
| `/audio-transcriber` | Transcribes audio to markdown with optional meeting minutes | `faster-whisper` + `ffmpeg` |
| `/deep-research` | Token-efficient deep research via OpenAI's Deep Research API | `OPENAI_API_KEY` |
| `/file-organizer` | Reversible directory cleanup — proposes before it moves, logs every move for undo | None |
| `/agent-browser` | Browser automation via accessibility-tree refs (`@e1`, `@e2`, ...) instead of brittle CSS selectors | `agent-browser` CLI |
| `/openrouter` | Universal LLM gateway — fall back across providers, route by cost | `OPENROUTER_API_KEY` |

The `install.sh` one-liner installs all 13. For Claude.ai, the zips for these are also in [`dist/`](./dist).

---

## Recipes — chaining skills

Some chains are worth more than the parts. The canonical one is `process-interviewer → prompt-master → agent-browser`: interview to extract a clean spec, compile it into a hardened prompt, execute against live web. Other useful chains (publish-ready content, meeting → decision, cost-optimized execution) are documented in [RECIPES.md](./RECIPES.md).

Several skills also ship a `references/` subfolder with deeper material (full pattern catalogs, framework templates, bias dictionaries) that Claude can pull on demand without bloating the SKILL.md.

---

## Built by

[Pablo Nastar](https://www.linkedin.com/in/pablo-nastar/) — AI agency [ChappyGo](https://chappygo.com), Toulouse.

We help SMEs automate real work with AI agents — not just chatbots.

---

If these are useful → ⭐ star the repo. It helps others find it.
