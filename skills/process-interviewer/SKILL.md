---
name: process-interviewer
description: Interviews you deeply before building a skill or automating a process — avoids bad specs and endless optimization loops
---

# Process Interviewer

Before building a skill or automating any complex process, Claude jumps to action too fast. This skill fixes that by conducting a structured deep interview (10–15 questions) to reach shared understanding before any implementation begins. Output: a full skill PRD you can hand back to Claude to build from.

**Rule**: if you're about to build something that will be used more than once, run this first.

## Usage

```
/process-interviewer [what you want to build or automate]
```

Examples:
```
/process-interviewer A skill that writes my weekly newsletter from bullet points
/process-interviewer Automate my lead qualification process from inbound form submissions
/process-interviewer Build a skill for writing client proposals from a brief
/process-interviewer Automate how I process and respond to support emails
/process-interviewer A skill that generates my social media content calendar for the week
```

## Instructions for Claude

When this skill is invoked:

### 1. Acknowledge and frame the goal

- Restate what the user wants to build or automate in one sentence.
- Ask: "Is that the right way to describe it, or would you frame it differently?"
- Wait for confirmation before proceeding.

### 2. Check for existing coverage

- If a second brain, CLAUDE.md, or OS context is available, scan it first.
- Do not ask questions the user has already answered elsewhere.
- If a similar skill or process is already documented, surface it and ask if they want to extend it or build something new.

### 3. Conduct the interview

Ask questions **one at a time** — never a list. Wait for the answer, then ask the next. If an answer is vague, ask one follow-up before moving on. The goal is to surface what the user knows but hasn't articulated yet.

See `references/question-banks.md` for question banks organized by process type (writing, research, communication, ops, etc.).

**Core questions for all processes** (adapt wording to context):
1. Walk me through what you currently do today, step by step — from the starting trigger to the final output.
2. Where does this process break down, slow down, or feel frustrating?
3. What does "done well" look like? Describe the ideal output in concrete terms.
4. Who else is involved or affected by this process?
5. What are the inputs this process starts from? (files, forms, voice notes, emails, etc.)
6. What have you already tried — tools, automations, or previous attempts — that didn't work? Why?
7. What constraints exist? (Tools you must use, integrations required, formats, compliance requirements)
8. How often does this process run? (daily, weekly, per client, per project)
9. What would you stop using this skill for — what edge case or failure mode would make you abandon it?
10. What are the exceptions or special cases I should know about?

**Additional questions based on type** — ask 3–5 from the relevant category in `references/question-banks.md` (writing, research, communication, ops, etc.).

**Do not ask all questions if the user's answers make some obvious** — adapt as you go.

### 4. Do not rush

If an answer is vague, ask a follow-up:
- "Can you give me a concrete example of what that looks like?"
- "What would a good output look like vs. a bad one? Can you show me a sample?"
- "When you said [X], did you mean [interpretation A] or [interpretation B]?"

The interview quality determines the PRD quality, which determines the skill quality. Patience here saves 3 rounds of revision later.

### 5. Write the understanding summary

After all questions are answered, write:
- A plain-English summary of the process as understood (2–3 paragraphs)
- The success criteria (what "done" looks like)
- The known constraints
- The known edge cases

Then ask: "Does this match what you have in mind? Anything missing or wrong?"

Do not proceed to the PRD until the user confirms.

### 6. Generate the skill PRD

After confirmation, produce a structured PRD:

```markdown
# Skill PRD: [Skill Name]

## One-line description
[What this skill does in one sentence — optimized for the skill's frontmatter]

## Trigger
`/[skill-name] [required inputs]`

## Inputs
- [Input 1]: [description, format, required/optional]
- [Input 2]: ...

## Step-by-step instructions for Claude
1. [First step]
2. [Second step]
...

## Output format
[Exact description of what the output looks like — format, length, structure]

## Edge cases and constraints
- [Edge case 1]: [how to handle it]
- [Edge case 2]: ...

## What NOT to do
- [Anti-pattern 1]
- [Anti-pattern 2]

## Skill integrations
- [Skill name]: [when to call it and why]

## Quality check
Before delivering output, verify:
- [ ] [Check 1]
- [ ] [Check 2]
```

### 7. Offer next steps

After delivering the PRD:
- Option A: "Want me to build this skill from the PRD right now in this chat?"
- Option B: "Want to copy this PRD and start a fresh session to build it?"
- Option C: "Want to refine any part of the spec before building?"

If building now: use the PRD as the sole source of truth. Do not add features or scope creep beyond what the PRD specifies.

## Notes

- Most useful for fuzzy processes the user does intuitively but has never written down.
- The PRD output can be used standalone: "Build this skill: [paste PRD]"
- Adapted from the Grill Me framework by Matt Pico, extended for skill building.
- Reference files: `references/interview-rules.md`, `references/question-banks.md`
