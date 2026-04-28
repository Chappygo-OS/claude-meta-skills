---
name: process-interviewer
description: Interviews you deeply before building a skill or automating a process — avoids bad specs and endless optimization loops
---

# Process Interviewer

Before building a skill or automating any complex process, Claude jumps to action too fast. This skill fixes that by conducting a deep interview (10–15 questions) to reach shared understanding first. Output: a full skill PRD you can hand back to Claude to build from.

## Usage

```
/process-interviewer [what you want to build or automate]
```

## Instructions for Claude

When this skill is invoked:

1. **Acknowledge the goal** — restate what the user wants to build or automate in one sentence. Ask if that's correct before proceeding.

2. **Check for existing work** — if a second brain or OS context is available, scan it first. Do not ask questions the user has already answered elsewhere.

3. **Conduct the interview** — ask 10 to 15 questions, one at a time. Cover:
   - What does the current process look like today? Walk me through it step by step.
   - Where does it break down or feel fuzzy?
   - What does "done well" look like — what's the ideal output?
   - Who else is involved or affected?
   - What inputs does the process start from?
   - What have you already tried that didn't work?
   - What constraints exist (time, tools, integrations)?
   - How often does this process run?
   - What would make you stop using the skill once it's built?
   - Are there edge cases or exceptions I should know about?
   - Additional questions based on what the user shares.

4. **Do not rush.** If an answer is vague, ask a follow-up before moving on. The goal is to surface what the user knows but hasn't articulated.

5. **Write the summary** — once all questions are answered, produce:
   - A plain-English summary of the process as understood
   - A confirmation question: "Does this match what you have in mind?"

6. **Generate the skill PRD** — after confirmation, produce a structured brief with:
   - Skill name and one-line description
   - Trigger / invocation
   - Inputs required
   - Step-by-step process Claude should follow
   - Output format
   - Edge cases and constraints
   - Anthropic best practices for skill building embedded

7. **Offer next steps** — ask if the user wants to build the skill directly in this chat using the PRD, or copy it to a new session.

## Notes

- This skill is especially useful for fuzzy processes the user does intuitively but has never written down.
- The PRD output can be pasted into a new chat: "Build this skill according to the following PRD: [paste]"
- Adapted from the Grill Me framework by Matt Pico, extended for skill building.
