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

### One command (installs all 8)

```bash
curl -s https://raw.githubusercontent.com/pablo-nastar/claude-meta-skills/main/install.sh | bash
```

### Manual (pick what you need)

```bash
git clone https://github.com/pablo-nastar/claude-meta-skills.git
cp -r claude-meta-skills/skills/humanizer ~/.claude/skills/
cp -r claude-meta-skills/skills/fact-checker ~/.claude/skills/
# repeat for any skill you want
```

Invoke in Claude Code: `/humanizer`, `/fact-checker`, etc.

> **Windows**: copy the folder to `%USERPROFILE%\.claude\skills\`

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

## Built by

[Pablo Nastar](https://www.linkedin.com/in/pablo-nastar/) — AI agency [ChappyGo](https://chappygo.com), Toulouse.

We help SMEs automate real work with AI agents — not just chatbots.

---

If these are useful → ⭐ star the repo. It helps others find it.
