# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A collection of 8 Claude meta-skills — reusable slash commands that install into `~/.claude/skills/` and invoke with `/skill-name`. Each skill lives in `skills/<name>/` and consists of a `SKILL.md` (the skill definition Claude reads at invocation) plus a `references/` folder (support files the skill instructions point to).

## Install

```bash
bash install.sh
```

This copies all 8 skill folders to `~/.claude/skills/`. Restart Claude Code, then invoke with `/skill-name`. On Windows, copy manually to `%USERPROFILE%\.claude\skills\`.

To install a single skill:
```bash
cp -r skills/humanizer ~/.claude/skills/
```

## Repository structure

```
skills/
  <skill-name>/
    SKILL.md          # Frontmatter (name, description) + instructions Claude reads at invocation
    references/       # Support files referenced in SKILL.md (frameworks, templates, examples)
dist/                 # Pre-packaged .zip files per skill (for distribution)
install.sh            # Copies all skills to ~/.claude/skills/
```

## Skill authoring conventions

Each `SKILL.md` follows this structure:
1. **Frontmatter** — `name` and `description` fields (used by Claude Code to populate the slash command list)
2. **Usage section** — how to invoke the skill with example inputs
3. **Instructions for Claude** — numbered steps Claude follows when the skill is triggered
4. **Reference file pointers** — explicit `references/<file>.md` mentions so Claude loads them

Reference files are named semantically (e.g. `frameworks.md`, `templates.md`, `patterns.md`) and contain the dense reference material (taxonomies, code templates, rubrics) that would bloat the main `SKILL.md` if inlined.

## Skills in this repo

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `process-interviewer` | `/process-interviewer` | Structured interview → full PRD before building |
| `prompt-master` | `/prompt-master` | Brain dump → optimized prompt with model routing |
| `humanizer` | `/humanizer` | Remove AI writing markers; optional voice profile matching |
| `fact-checker` | `/fact-checker` | Verify every claim against primary sources |
| `find-skills` | `/find-skills` | Search skills.sh before building from scratch |
| `frontend-slides` | `/frontend-slides` | Self-contained animated HTML presentation |
| `decision-toolkit` | `/decision-toolkit` | 9-lens first-principles decision framework |
| `mcp-builder` | `/mcp-builder` | Generate MCP server (TypeScript/Python) from API docs |

## Skill integration chains

Skills reference each other — common pipelines:
- `/fact-checker` → `/humanizer` (verify accuracy, then de-AI the text)
- `/process-interviewer` → `/prompt-master` (spec a workflow, then clean up the resulting prompt)
- `/find-skills` → `/process-interviewer` (no match found → interview to build a new one)
- `/prompt-master` → any skill (pre-optimize complex input before passing to another skill)
