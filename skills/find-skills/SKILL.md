---
name: find-skills
description: Searches the skills.sh ecosystem for existing Claude skills — use before building anything new
---

# Find Skills

Before building a skill from scratch, check if someone has already built it. The skills.sh ecosystem has 90,000+ skills. This skill searches it by task description, returns the most relevant results ranked by install count, and can install the best match directly.

## Usage

```
/find-skills [what you're trying to do]
```

Examples:
```
/find-skills help me write better LinkedIn ads
/find-skills automate my email follow-ups
/find-skills analyze a PDF and extract key data
```

## Instructions for Claude

When this skill is invoked:

1. **Understand the task** — restate what the user is trying to accomplish in one sentence. If ambiguous, ask one clarifying question before searching.

2. **Search skills.sh** — query the skills.sh ecosystem for skills matching the task description. Use multiple search terms if needed (synonyms, related concepts).

3. **Return the top results** in a ranked table:
   ```
   | Skill | Description | Installs | Install command |
   |-------|-------------|----------|-----------------|
   | [name] | [what it does] | [count] | [command] |
   ```
   Show at least 3 results. Sort by install count descending.

4. **Highlight the recommended pick** — mark the best option and explain briefly why (most installs, best fit for the stated task, actively maintained).

5. **Offer to install** — ask if the user wants to install the recommended skill. If yes:
   - For Claude Code: provide the terminal command to install via CLI
   - For Claude.ai/co-work: provide the direct import URL or step-by-step instructions

6. **If no good match is found** — tell the user clearly, and suggest using `/process-interviewer` to spec out a custom skill instead.

## Notes

- Always run this before `/process-interviewer`. No point building what already exists.
- Install count is a useful proxy for quality, but not perfect — check the skill description before recommending high-install skills that might be outdated.
- skills.sh URL: https://www.skills.sh

## References

Load on demand when assessing a skill's trustworthiness:
- `references/quality-gates.md` — install-count thresholds (≥1K green / 100–1K yellow / <100 suspicious), trusted-source list, and the fallback path when no good match is found
