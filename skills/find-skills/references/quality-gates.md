# Find-skills quality gates

This file is loaded on demand when SKILL.md needs the full quality verification rules. Three gates run on every candidate before it is presented to the user: install count, source reputation, and stars. Plus a fallback path for the zero-match case so the skill never just shrugs.

## Three quality signals

A candidate skill must be checked on all three signals. Any single red flips the recommendation to "use with caution" and the warning is surfaced explicitly in the comparison output.

| Signal | Green | Yellow | Red |
|---|---|---|---|
| Install count | ≥ 1,000 | 100 to 999 | < 100 |
| Source reputation | Trusted maintainer (see list below) | Known but small | Unknown / single-commit account |
| GitHub stars | ≥ 500 | 50 to 499 | < 50 (skepticism by default) |

## Why install count leads

Install count is the strongest signal because it's the only one that comes from real users running the skill, not just bookmarking it. A skill at 14,000 installs has been pulled, configured, and run by tens of thousands of people — and it still exists, which means it didn't break enough of them to be unpublished. Stars are weaker (cheap to give), and source reputation can be gamed (forks of trusted maintainers' work).

## How to read each signal

### Install count

- **Green (≥ 1K)** — recommend without caveats if the other two signals are also green.
- **Yellow (100–999)** — usable, but include "smaller user base" in the row caveat. Suggest the user check the GitHub issues for active maintenance.
- **Red (< 100)** — never recommend without an explicit warning. Suggest it only if no green or yellow alternative exists for the user's specific need.

### Source reputation

- **Green** — vercel-labs, anthropics, microsoft, ComposioHQ, well-known individual maintainers with multiple shipped skills.
- **Yellow** — known small maintainers, indie devs with a track record in adjacent projects.
- **Red** — unknown account, single-commit history, or accounts created within the last 30 days.

### GitHub stars

- Stars correlate weakly with quality but strongly with discoverability. A green-star skill has been seen by enough developers that obvious bugs have been reported.
- A skill with high installs but low stars is fine — it just means people found it through skills.sh, not GitHub.
- A skill with high stars but low installs is *suspicious* — it suggests the project got attention but didn't survive contact with users.

## Trusted source list

These maintainers have published multiple skills and have a track record. A skill from any of them clears the source reputation gate as Green.

- `anthropics/<official>` — official Anthropic skills
- `microsoft/<official>` — Microsoft official
- `vercel-labs/agent-skills` — Vercel's agent skill collection
- `ComposioHQ/awesome-claude-skills` — Composio's curated set
- Any well-known maintainer with 5+ shipped skills and no published security issues

This list is not exhaustive. New trusted maintainers can be added when they hit the criteria — multiple shipped skills, active maintenance, no major incidents.

## CLI surface (for reference)

| Command | Purpose |
|---|---|
| `npx skills find <query>` | Search the registry by keyword |
| `npx skills add <owner/repo@skill>` | Install a skill (project scope) |
| `npx skills add <owner/repo@skill> -g` | Install globally |
| `npx skills add <owner/repo@skill> -y` | Skip confirmation |
| `npx skills check` | List installed skills and their versions |
| `npx skills update` | Update installed skills to latest |
| `npx skills init` | Scaffold a new local skill |

The `-g` flag is for global install. The `-y` flag is non-interactive. The dry-run path is `npx skills add <repo> --dry-run` (drop both `-g` and `-y`).

## Zero-match fallback path

If `npx skills find <query>` returns nothing relevant on multiple keyword variations and the leaderboard at https://skills.sh has no obvious match, follow this path:

1. **Acknowledge the gap explicitly.** Don't pretend a yellow or red candidate is a real match. The user is better served by a clear "no match" than by a recommendation that won't survive contact.
2. **Offer Claude's general capability as a fallback.** Many "I need a skill for X" requests are actually one-off tasks where the model can do the work directly with a well-formed prompt.
3. **Suggest scaffolding a custom skill via `npx skills init`.** The CLI generates the directory structure, the SKILL.md skeleton, and the metadata block in under a minute. For repeated use, this is the right path even if the first run feels slower.

Sample zero-match output:

```
No exact match on skills.sh today. Closest neighbors are general
[Category] tools without [Specific feature]. Two paths:

1. Use Claude directly with the prompt-master skill to scaffold the
   converter inline.
2. Run `npx skills init <slug>` to scaffold a custom skill — the
   structure is ready in under a minute.
```

## Comparison table format

When candidates pass the gates, the user sees a comparison table. The columns are fixed:

```
| Skill | Description | Installs | Source | Install command |
|-------|-------------|---------:|--------|-----------------|
```

Always include:

- The skills.sh permalink for each row (so the user can verify before installing)
- A one-line caveat below the table if any candidate triggered yellow or red on any signal
- The recommended pick, named explicitly ("Recommended: X — highest install count, official source")

The table should hold no more than three rows. Beyond three, the user is being asked to do triage instead of being given a recommendation.

## Refusal cases

There are two cases where the skill should refuse to recommend even a yellow candidate:

- **Security-sensitive domains** (auth, secrets, payments) — never recommend a yellow or red candidate. Demand a green source.
- **System-modifying skills** (file system access, shell execution, network calls) — same rule.

In these cases, escalate to the zero-match fallback even if a yellow candidate technically matched.
