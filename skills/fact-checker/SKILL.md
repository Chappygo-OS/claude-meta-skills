---
name: fact-checker
description: Verifies every factual claim in a text against external sources — use on AI output, your own drafts, or anyone else's content
---

# Fact Checker

AI generates confident-sounding falsehoods. This skill extracts every verifiable claim in a text, checks each one against external sources, and returns a structured report. Three use cases: checking AI-generated content before publishing, checking your own drafts and outlines, or fact-checking someone else's article or post.

## Usage

```
/fact-checker [text, article, outline, or URL to check]
```

With context from a second brain:
```
/fact-checker Check the video outline in [Notion/file] on [topic]
```

## Embed in writing skills (recommended)

```
Update my [linkedin-post / newsletter / article] skill to run the fact-checker
on the draft before giving me the final output.
```

## Instructions for Claude

When this skill is invoked:

1. **Read and understand the full content** before extracting claims.

2. **Extract all verifiable claims** — list every statement that is:
   - A statistic or number ("47% of companies...")
   - A named fact ("Claude was released in...")
   - A causal claim ("X causes Y")
   - A technical assertion ("MCP uses the JSON-RPC protocol")
   - A quote attributed to someone
   Ignore opinions, predictions, and subjective statements.

3. **Verify each claim** using web search:
   - Search for primary sources (official docs, research papers, announcements)
   - Cross-reference at least 2 independent sources for each claim
   - Note the source URL for each verdict

4. **Classify each claim**:
   - ✅ **True** — confirmed by primary sources
   - ⚠️ **Mostly true** — correct but missing nuance or context
   - ❓ **Unverifiable** — cannot be confirmed or denied with available sources
   - ❌ **False** — contradicted by primary sources

5. **For each non-true claim**, provide:
   - What the text says
   - What the evidence actually shows
   - A suggested correction or rephrasing

6. **Output a structured report**:
   ```
   ## Fact Check Report

   **Summary**: X true, Y mostly true, Z unverifiable, W false.
   **Overall verdict**: [Clean / Needs minor fixes / Significant issues]

   ---

   ### Claim 1: [quote from text]
   **Verdict**: ✅ True
   **Source**: [URL]

   ### Claim 2: [quote from text]
   **Verdict**: ⚠️ Mostly true
   **Issue**: [explanation]
   **Suggested fix**: [rewrite]
   **Source**: [URL]
   ```

7. **Context-aware checking** — if the content was generated from a source document (transcript, outline, notes), check consistency against that source too, not just external facts.

## Notes

- Most useful on content that will be read by many people: articles, LinkedIn posts, video scripts, onboarding docs.
- For technical claims about fast-moving topics (AI tools, API specs), always verify — these change often and AI training data may be outdated.

## References

Load on demand when weighing source credibility or spotting manipulation:
- `references/source-hierarchy.md` — 6-tier source quality hierarchy (peer-reviewed → official stats → fact-checked news → in-domain experts → general news → social media) with when each tier counts and when to be skeptical
- `references/anti-patterns.md` — 4 categories of manipulation (statistical, context removal, false equivalences, logical fallacies) with how to spot each
