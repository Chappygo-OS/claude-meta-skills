---
name: find-skills
description: Searches the skills ecosystem for existing Claude skills — use before building anything new. Helps discover and install agent skills when the user asks "how do I do X", "find a skill for X", "is there a skill that can...", or expresses interest in extending capabilities.
---

# Find Skills

Before building a skill from scratch, check if someone has already built it. This skill searches the open agent skills ecosystem by task description, returns the most relevant results ranked by install count, evaluates them against quality gates, and can install the best match directly.

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
/find-skills transcribe and summarize meetings
```

---

## STEP 1 — UNDERSTAND THE TASK

- Restate what the user is trying to accomplish in one sentence.
- Identify the task category: writing, research, automation, analysis, communication, development, media, etc.
- If ambiguous, ask one clarifying question before searching.
- Extract 3–5 search keywords that cover the task from different angles, including synonyms.

---

## STEP 2 — CHECK THE LEADERBOARD FIRST

Before running a CLI search, check [skills.sh](https://skills.sh/) to see if a well-known skill already exists for the domain. The leaderboard ranks skills by total installs, surfacing the most popular and battle-tested options.

Top skill sources for common domains:
- `vercel-labs/agent-skills` — React, Next.js, web design (100K+ installs each)
- `anthropics/skills` — Frontend design, document processing

---

## STEP 3 — SEARCH

Run searches using the Skills CLI:

```bash
npx skills find [query]
```

Examples:
```bash
npx skills find react performance
npx skills find pr review
npx skills find changelog
```

Run 2–3 searches with different keyword combinations to maximize coverage (e.g., "email follow-up" AND "outreach automation").

---

## STEP 4 — RETURN RESULTS IN A RANKED TABLE

```
| # | Skill | Description | Installs | Last updated | Install command |
|---|-------|-------------|----------|--------------|-----------------|
| 1 | [name] | [what it does] | [count] | [date] | [command] |
```

Show at least 5 results. Sort by install count descending.

---

## STEP 5 — APPLY QUALITY GATES

See `references/quality-gates.md` for the full evaluation rubric. Key checks:

1. **Install count** — Prefer skills with 1K+ installs. Be cautious with anything under 100.
2. **Source reputation** — Official sources (`vercel-labs`, `anthropics`, `microsoft`) are more trustworthy than unknown authors.
3. **Last updated** — < 12 months signals active maintenance. Downgrade a recommendation if install count is high but last update is 2+ years ago.
4. **Description clarity** — Does it clearly state what it does and doesn't do?
5. **Scope fit** — Does it match the user's task closely, or is it a loose match?
6. **Conflict check** — Does it overlap with skills the user already has installed?

---

## STEP 6 — HIGHLIGHT THE RECOMMENDED PICK

Mark the best option with "⭐ Recommended" and provide:
- Why it's the best match (specific reasons, not generic)
- What it does well
- What it doesn't cover
- Whether a second skill would complement it

Example response:
```
I found a skill that might help! The "react-best-practices" skill provides
React and Next.js performance optimization guidelines from Vercel Engineering.
(185K installs)

To install it:
npx skills add vercel-labs/agent-skills@react-best-practices

Learn more: https://skills.sh/vercel-labs/agent-skills/react-best-practices
```

---

## STEP 7 — OFFER TO INSTALL

If the user wants to proceed, install the skill:

```bash
npx skills add <owner/repo@skill> -g -y
```

The `-g` flag installs globally (user-level) and `-y` skips confirmation prompts.

**For Claude Code (terminal)**:
```bash
claude skill install [skill-name]
```

**For Claude.ai / Projects**:
- Go to the skill page at skills.sh/[skill-name]
- Click "Install" and follow the import instructions

**Check for updates later:**
```bash
npx skills check   # check for updates
npx skills update  # update all installed skills
```

---

## STEP 8 — SUGGEST A QUICK TEST

After installing, suggest a quick test to verify it works:
```
Try it: /[skill-name] [simple test case]
```

---

## STEP 9 — IF NO GOOD MATCH IS FOUND

Tell the user clearly and directly. Do not recommend a poor match just to have an answer.

Instead:
1. Explain why no match was found (too niche, too new, combination of things, etc.)
2. Offer to bridge to `/process-interviewer` to spec out a custom skill
3. Alternatively, suggest `npx skills init my-skill-name` to scaffold a new skill

```
No existing skill covers this well. Want me to run /process-interviewer to spec out
a custom one? I'll interview you first so the resulting skill actually fits your workflow.
```

---

## COMMON SKILL CATEGORIES

| Category | Example Queries |
|----------|-----------------|
| Web Development | react, nextjs, typescript, css, tailwind |
| Testing | testing, jest, playwright, e2e |
| DevOps | deploy, docker, kubernetes, ci-cd |
| Documentation | docs, readme, changelog, api-docs |
| Code Quality | review, lint, refactor, best-practices |
| Design | ui, ux, design-system, accessibility |
| Productivity | workflow, automation, git |
| Writing | copywriting, email, linkedin, newsletter |
| Research | competitor, market, fact-check |
| Media | transcribe, summarize, video |

---

## WHEN NOT TO USE

- When the user has a highly custom, internal, or proprietary process — no public skill will match
- When the user already knows exactly which skill they want — just install it directly
- When the task is a one-off that doesn't warrant a reusable skill — just do it conversationally

---

## Skill integrations

- **`/process-interviewer`** — spec out a custom skill when no match is found
- **`/prompt-master`** — optimize a vague task description into better search terms before searching

## Reference files

- `references/quality-gates.md` — 5-dimension scoring rubric for evaluating skills before recommending
- `references/search-strategies.md` — search patterns by task category
