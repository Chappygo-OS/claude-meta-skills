---
name: deep-research
description: Multi-source, multi-pass research on any topic — produces a verified, cited report you can actually build on
---

# Deep Research

Claude's built-in web search is shallow — one pass, surface-level results. This skill runs structured multi-pass research: it starts broad, identifies the most authoritative sources, digs into them, cross-references, and delivers a report with citations you can verify. Use it when you need to actually know something, not just get a quick answer.

## Usage

```
/deep-research [topic or research question]
```

Examples:
```
/deep-research What are the best MCP servers available for productivity tools as of 2025?
/deep-research What does the research say about AI's effect on knowledge worker productivity?
/deep-research Who are the top 5 competitors in the [market], what are their pricing models and key differentiators?
/deep-research What are the current best practices for LLM prompt caching?
/deep-research What do we know about customer churn in SaaS companies under $1M ARR?
```

## Instructions for Claude

When this skill is invoked:

### 1. Clarify the research question

- Restate the research question precisely.
- Identify: is this a **current state** question (what is true now?), a **comparative** question (how do these compare?), a **historical** question (what happened and why?), or a **best practices** question (what should I do?)?
- Identify the scope: breadth (survey many sources) vs. depth (deep analysis of a few authoritative sources)?
- If the question is broad, break it into 3–5 specific sub-questions before searching.

### 2. Pass 1 — Broad scan

Search 5–8 different query variations to map the landscape:
- Primary query (the question as stated)
- Synonym and alternative phrasing queries
- "Best of" and "comparison" queries for comparative topics
- Academic or research-focused queries where relevant
- Recent news queries to capture the latest developments

**Goal of Pass 1**: identify the 5–8 most authoritative sources (primary documents, papers, official reports, leading analyses) — not to read them all yet.

### 3. Pass 2 — Deep source reading

For each of the top 5–8 sources identified:
- Read the full content (not just the excerpt)
- Extract: key claims, specific numbers/data, named experts or organizations, methodology (for research), date and recency
- Flag any claims that conflict with other sources

### 4. Pass 3 — Targeted gap filling

After reading the primary sources, identify what's still missing:
- Specific data points not yet found
- Conflicting claims that need resolution
- Recent developments (last 3–6 months) not covered by the main sources
- Counter-arguments or minority viewpoints

Run 2–3 targeted searches to fill these gaps.

### 5. Synthesize and write the report

**Report structure**:

```
# Research Report: [Topic]

**Research question**: [Precise question answered]
**Date**: [Today's date]
**Confidence level**: High / Medium / Low — [brief reason]

---

## Executive Summary
[3–5 sentences covering the most important findings]

---

## Key Findings

### [Finding 1 — the most important]
[2–3 sentences with specific data. Source: [URL] ([date])]

### [Finding 2]
[...]

### [Finding 3–5]
[...]

---

## Points of Uncertainty or Conflict

[What the sources disagree on, what could not be verified, what may be outdated]

---

## Sources

| # | Source | Type | Date | Key contribution |
|---|--------|------|------|-----------------|
| 1 | [URL] | [Primary doc / news / research] | [date] | [what it contributed] |
```

### 6. Confidence calibration

After delivering the report, state your confidence level:
- **High**: core findings confirmed by 3+ independent primary sources, recent data, no major conflicts
- **Medium**: findings confirmed by 2 sources, or sources are secondary, or some data is 12–24 months old
- **Low**: only 1 source, sources may be biased, or topic is fast-moving and data may be stale

### 7. Offer follow-on actions

After the report:
- "Want me to verify any specific claim in more depth?"
- "Want me to generate a summary version for [specific audience]?"
- "Should I run `/fact-checker` on any content you're drafting that uses this research?"

## Skill integrations

- **`/fact-checker`** — run on any content that will be published using this research
- **`/decision-toolkit`** — use the research output to inform a structured decision
- **`/prompt-master`** — use the research to enrich a prompt with specific, verified context
- **`/frontend-slides`** — turn the research report into a presentation

## Notes

- For rapidly evolving topics (AI models, startup news, regulatory changes): always note when the research was conducted and recommend re-running before publishing.
- For academic or scientific claims: prioritize peer-reviewed sources over news coverage.
- This skill takes longer than a quick search — that's intentional. Use it when accuracy matters.
