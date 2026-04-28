---
name: find-skills
description: Searches the skills.sh ecosystem for existing Claude skills — use before building anything new
---

# Find Skills

Before building a skill from scratch, check if someone has already built it. The skills.sh ecosystem has 90,000+ skills. This skill searches it by task description, returns the most relevant results ranked by install count, evaluates them against quality gates, and can install the best match directly.

**Rule**: always run `/find-skills` before `/process-interviewer`. No point building what already exists.

## Usage

```
/find-skills [what you're trying to do]
```

Examples:
```
/find-skills help me write better LinkedIn ads
/find-skills automate my email follow-ups
/find-skills analyze a PDF and extract key data
/find-skills research competitors for a new market
/find-skills generate and post to social media automatically
/find-skills transcribe and summarize meetings
```

## Instructions for Claude

When this skill is invoked:

### 1. Understand the task

- Restate what the user is trying to accomplish in one sentence.
- Identify the task category: writing, research, automation, analysis, communication, development, media, etc.
- If ambiguous, ask one clarifying question before searching (e.g., "Do you need this to integrate with a specific tool?").
- Extract 3–5 search keywords that cover the task from different angles.

### 2. Search skills.sh

- Search the skills.sh ecosystem using the primary task description.
- Run 2–3 searches with different keyword combinations to maximize coverage.
- Include synonyms and related concepts (e.g., "email follow-up" AND "outreach automation").
- skills.sh URL: https://www.skills.sh

### 3. Return top results in a ranked table

```
| # | Skill | Description | Installs | Last updated | Install command |
|---|-------|-------------|----------|--------------|-----------------|
| 1 | [name] | [what it does] | [count] | [date] | [command] |
```

Show at least 5 results. Sort by install count descending. Include last-updated date where available.

### 4. Apply quality gates before recommending

See `references/quality-gates.md` for the full evaluation rubric. Quick checks:
- **Install count** > 100 signals community validation
- **Last updated** < 12 months signals active maintenance
- **Description clarity**: does it clearly state what it does and doesn't do?
- **Scope fit**: does it match the user's task closely, or is it a loose match?
- **Conflict check**: does it overlap with skills the user already has installed?

Downgrade a recommendation if: install count is high but last update is 2+ years ago, or description is vague about what the skill actually does.

### 5. Highlight the recommended pick

Mark the best option with "⭐ Recommended" and provide:
- Why it's the best match (specific reasons, not generic)
- What it does well
- What it doesn't cover (so the user isn't surprised)
- Whether a second skill would complement it

### 6. Offer to install

Ask if the user wants to install the recommended skill. If yes:

**For Claude Code (terminal)**:
```bash
# Install via CLI
claude skill install [skill-name]
```

**For Claude.ai / Projects**:
- Go to the skill page at skills.sh/[skill-name]
- Click "Install" and follow the import instructions
- Or provide the direct import URL

### 7. Test the skill after installing

Suggest a quick test to verify it works as expected:
```
Try it: /[skill-name] [simple test case]
```

### 8. If no good match is found

Tell the user clearly and directly. Do not recommend a poor match just to have an answer.

Instead:
1. Explain why no match was found (too niche, too new, combination of things, etc.)
2. Suggest using `/process-interviewer` to spec out a custom skill
3. Offer to start the process-interviewer interview right now if they want

### 9. If the user wants to build after searching

After finding no suitable match, bridge naturally:
```
No existing skill covers this well. Want me to run /process-interviewer to spec out
a custom one? I'll interview you first so the resulting skill actually fits your workflow.
```

## When NOT to use find-skills

- When the user has a highly custom, internal, or proprietary process — no public skill will match
- When the user already knows exactly which skill they want — just install it directly
- When the task is a one-off that doesn't warrant a reusable skill — just do it conversationally

## Skill integrations

- **`/process-interviewer`** — spec out a custom skill when no match is found
- **`/prompt-master`** — optimize a vague task description into better search terms before searching

## Notes

- Install count is a useful proxy for quality, but not perfect — check the description and update date before recommending.
- Skills from the same author often work well together — check if the recommended skill has companion skills.
- Reference files: `references/quality-gates.md`, `references/search-strategies.md`
