# Prompt Templates by Task Type

Used by `/prompt-master`. Optimized prompt structures for common task types.

---

## Template 1: Creative Writing

```
You are a [role: copywriter / ghostwriter / content strategist] writing for [audience].

Task: Write [format: a LinkedIn post / a newsletter section / a 500-word article] about [topic].

Context:
- [Relevant background: company, product, situation]
- [Tone: casual and direct / formal / conversational]
- [What the reader should feel or do after reading]

Constraints:
- Length: [word count or range]
- Avoid: [specific words, phrases, or approaches to exclude]
- Always include: [non-negotiable elements: CTA, hashtags, disclaimer, etc.]

Example of good output:
[1-3 sentences showing the style and quality level you're aiming for]
```

---

## Template 2: Research & Analysis

```
You are a [role: research analyst / subject matter expert / strategist].

Task: Research [topic] and produce a [format: report / bullet summary / comparison table].

Scope:
- Focus on: [specific sub-topics or questions to answer]
- Time frame: [last X months / year / no limit]
- Depth: [brief overview / deep dive / executive summary]

Output format:
[Exact structure: sections, headers, table format, bullet points, length]

Sources to prioritize:
[Official docs / news / academic / industry reports / specific sites]

Flag the following:
- Any claims that could not be verified
- Any data that may be outdated (older than [timeframe])
```

---

## Template 3: Code Generation

```
You are an expert [language] developer working on a [TypeScript / Python / React] project.

Task: [Specific function / component / module] that does [exactly what it should do].

Context:
- Framework/version: [Next.js 14 / Python 3.11 / etc.]
- Existing code (if relevant): [paste or describe]
- Constraints: [must use X library / must not use Y approach / must work with Z]

Requirements:
- [Specific behavior 1]
- [Specific behavior 2]
- Handle these edge cases: [list]

Output:
- Code only, no explanations unless behavior is non-obvious
- Include types/signatures
- Include a brief test showing the function works
```

---

## Template 4: Decision Support

```
I need to make a decision about [topic]. Help me think through it — do not decide for me.

Decision: [One sentence statement of what needs to be decided]

Context:
- [Current situation]
- [Constraints or non-negotiables]
- [Deadline or timeline]

Options I'm considering:
1. [Option A]
2. [Option B]
[3. Option C if applicable]

Apply these lenses to each option:
1. What are the second-order effects?
2. Which biases might be distorting my view?
3. What would I regret at age 80?

Output: structured analysis per option. Do not give a recommendation unless I ask.
Close with 3 open questions I should sit with before deciding.
```

---

## Template 5: Data Processing / Transformation

```
Task: Transform the following [data type: CSV / JSON / table / list] according to these rules.

Input:
[paste data or describe format]

Transformation rules:
1. [Rule 1: filter / aggregate / rename / normalize]
2. [Rule 2]
3. [Rule 3]

Output format:
[Exact format: Markdown table / JSON / CSV / bullet list]

Handle missing or invalid values by: [skip / flag with "N/A" / use default X]

Show your output without explanation unless a transformation was ambiguous.
```

---

## Template 6: Communication Draft

```
You are writing [an email / a Slack message / a response] on behalf of [me / a company].

Situation:
- Recipient: [who they are, what their relationship is]
- Context: [what happened or what this is responding to]
- Desired outcome: [what I want them to do or feel after reading]

Tone: [formal / casual / warm but professional / direct]
Length: [very short / 1-2 paragraphs / medium]
Sign-off: [name, title, or signature to use]

Do not include:
- Filler openers ("I hope this finds you well")
- Hype language
- Passive voice

Deliver the draft only — no preamble.
```

---

## Template 7: Summarization

```
Task: Summarize the following [document / transcript / article] for [audience].

Target audience: [who will read this and what they'll do with it]
Purpose: [what decision or action the summary informs]

Output format:
- [Executive summary: 3 sentences]
- [Key points: max 5 bullets]
- [Action items or decisions required: if any]

Constraints:
- Max length: [word count]
- Preserve all numbers, names, and specific claims exactly
- Flag any sections that were unclear or contradictory in the source

Input:
[paste content]
```

---

## Template 8: Feedback & Review

```
You are a [role: senior editor / code reviewer / product critic] reviewing the following.

Task: Review [what] and provide structured feedback.

Evaluation criteria:
1. [Criterion 1: e.g., clarity / correctness / completeness]
2. [Criterion 2]
3. [Criterion 3]

Format your feedback as:
- **Strengths** (what works well and should be preserved)
- **Critical issues** (must fix before publishing/shipping)
- **Suggestions** (optional improvements)
- **Verdict**: [ready / needs revisions / major rework]

Be direct. Do not soften critical feedback.

Content to review:
[paste content]
```
