---
name: fact-checker
description: Verifies every factual claim in a text against external sources — use on AI output, your own drafts, or anyone else's content
---

# Fact Checker

AI generates confident-sounding falsehoods. This skill extracts every verifiable claim in a text, checks each one against external sources, and returns a structured report with verdicts, sources, and corrected phrasings. Three use cases: checking AI-generated content before publishing, checking your own drafts and outlines, or fact-checking someone else's article or post.

## Usage

```
/fact-checker [text, article, outline, or URL to check]
```

With a source document:
```
/fact-checker Check this video outline against [attached transcript]
```

With a URL:
```
/fact-checker https://[article-url]
```

## Embed in writing skills (recommended)

```
Update my [linkedin-post / newsletter / article] skill to run the fact-checker
on the draft before giving me the final output.
```

## Instructions for Claude

When this skill is invoked:

### 1. Read and parse the full content

- Read the entire content before extracting anything.
- If a URL is provided, fetch the full page content first.
- If a source document is attached (transcript, notes, outline), keep it open alongside the content being checked.

### 2. Extract all verifiable claims

List every statement that is:
- A **statistic or number** ("47% of companies...", "founded in 2019", "raised $50M")
- A **named fact** ("Claude was released in...", "the company is headquartered in...")
- A **causal claim** ("X causes Y", "because of Z, W happened")
- A **technical assertion** ("MCP uses JSON-RPC", "React hooks require version 16.8+")
- A **quote** attributed to a person or organization
- A **historical claim** ("in 2020, the policy changed...")
- A **comparative claim** ("faster than X", "the largest provider of Y")

Ignore: opinions, predictions, subjective assessments, and acknowledged estimates.

### 3. Categorize claims by verifiability and risk

Before checking, assign each claim:
- **Priority: High** — quantitative claims, quotes, causal claims with implications
- **Priority: Medium** — named facts, historical claims, technical assertions
- **Priority: Low** — widely known facts that are unlikely to be wrong

Check High priority first. If time is limited, stop at Medium.

### 4. Verify each claim

For each claim:
- Search for **primary sources** first: official docs, research papers, press releases, SEC filings, official statistics
- Cross-reference at least **2 independent sources** for High priority claims
- For fast-moving topics (AI tools, APIs, startup funding), check the **most recent source** — information from 12+ months ago may be outdated
- Note the source URL and publication date for each verdict

See `references/source-hierarchy.md` for how to rank and evaluate sources.
See `references/domain-guides.md` for domain-specific verification guidance (AI/tech, business, science, etc.).

### 5. Classify each claim

- ✅ **True** — confirmed by primary sources
- ⚠️ **Mostly true** — correct but missing important nuance, context, or qualifiers
- ❓ **Unverifiable** — cannot be confirmed or denied with available sources; may be an internal claim, estimate, or opinion presented as fact
- ❌ **False** — contradicted by primary sources
- 🔄 **Outdated** — was true but is no longer accurate (note the current state)

### 6. For each non-true claim, provide

- What the text says (exact quote)
- What the evidence actually shows
- Why the discrepancy exists (outdated, misattributed, simplified, fabricated)
- A suggested correction or safer rephrasing
- The source URL and date

### 7. Output the structured report

```
## Fact Check Report

**Content checked**: [title or first line of content]
**Date checked**: [today's date]
**Summary**: X true, Y mostly true, Z unverifiable, W outdated, V false.
**Overall verdict**: [Clean / Needs minor fixes / Significant issues / Do not publish]

---

### Claim 1: "[exact quote from text]"
**Verdict**: ✅ True
**Source**: [URL] ([publication date])

### Claim 2: "[exact quote from text]"
**Verdict**: ⚠️ Mostly true
**Issue**: The number cited is from a 2021 study; the 2024 figure is [X].
**Suggested fix**: "According to a 2021 study, [X]..." or update to the current figure.
**Source**: [URL]

### Claim 3: "[exact quote from text]"
**Verdict**: ❌ False
**What the text says**: [quote]
**What the evidence shows**: [corrected information]
**Suggested fix**: [corrected version]
**Source**: [URL]
```

### 8. Context-aware consistency check

If the content was generated from a source document (transcript, outline, notes), also check:
- Are the claims consistent with what the source document actually says?
- Did any claims get distorted, exaggerated, or invented during generation?
- Are any quotes accurately attributed and correctly paraphrased?

### 9. Flag AI-hallucination patterns

Watch specifically for these common AI fabrication patterns (see `references/anti-patterns.md`):
- Statistics with suspiciously round numbers (30%, 50%, 3x) with no source
- Named studies that may not exist
- Confident attribution of quotes to real people
- "Recent studies show..." with no citation
- Specific years, amounts, or figures that feel invented
- Claims about living people's current positions or statements

## Output confidence levels

After the full report, add:
```
## Confidence Assessment

**High confidence checks**: [n claims verified against primary sources]
**Lower confidence checks**: [n claims where only secondary sources were available]
**Could not verify**: [n claims — recommend manual verification before publishing]
```

## Skill integrations

- **`/humanizer`** — run after fact-checking to clean AI markers from the corrected draft
- **`/deep-research`** — when a claim requires deep investigation beyond quick search
- **`/prompt-master`** — when the text to check is itself a prompt that needs structural improvement

## Notes

- Most useful on content that will be read by many people: articles, LinkedIn posts, video scripts, onboarding docs, sales decks.
- For technical claims about fast-moving topics (AI tools, API specs, startup news), always verify — training data goes stale fast.
- Reference files: `references/source-hierarchy.md`, `references/anti-patterns.md`, `references/domain-guides.md`
