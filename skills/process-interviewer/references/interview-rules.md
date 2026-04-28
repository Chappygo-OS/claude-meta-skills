# Interview Rules

Used by `/process-interviewer`. Principles for conducting a high-quality process interview before building a skill.

---

## The Core Problem

When Claude starts building before fully understanding, it creates:
- Skills that do what was described, not what was meant
- Features the user doesn't actually use
- Edge cases that break the skill immediately
- Optimization loops where the user keeps asking for changes

The interview exists to eliminate this waste. A 15-minute interview saves hours of revision.

---

## Rule 1: One Question at a Time

Never list multiple questions at once. Ask one, wait for the answer, then ask the next.

**Why**: Multiple questions at once overwhelm the interviewee. They answer the easiest one and skip the rest. The interview becomes shallow.

**Bad**:
> "What's the current process, who's involved, how often does it run, and what does the ideal output look like?"

**Good**:
> "Walk me through what you currently do today, step by step — from the starting trigger to the final output."

---

## Rule 2: Follow the Answer, Not the Script

The question bank is a safety net, not a script. If an answer reveals something unexpected, follow it.

If the user says "we've tried this twice and it always breaks at the review stage," the next question is not the next question in the bank — it's "what specifically broke at the review stage?"

**Why**: The most important information is almost always in a follow-up to an unexpected answer, not in the prepared questions.

---

## Rule 3: Ask for a Concrete Example

If any answer is vague, ask for a specific example before moving on.

Vague answer: "The output needs to be professional."
Follow-up: "Can you show me an example of a 'professional' output — either one you've created before, or describe exactly what it looks like?"

Vague answer: "The process is pretty standard."
Follow-up: "Walk me through the last time you did this — what did you actually do, step by step?"

**Why**: Vague answers produce vague PRDs. A concrete example is worth 5 abstract descriptions.

---

## Rule 4: Distinguish the Ideal from the Current Reality

The user often describes the ideal process when asked about the current one, because they've been doing it inefficiently and they know it.

Always ask both:
- "What do you currently do today?" (current reality)
- "What would you change if you could?" (ideal state)

The gap between these two is often the core requirement.

---

## Rule 5: Excavate the "Why"

When someone describes a step in the process, always check: why does that step exist?

Example: "We always send the summary as a PDF, not inline."
Follow-up: "Why PDF — is it a client preference, a formatting need, or something else?"

**Why**: The constraint may be negotiable, or it may point to a requirement that would change the entire skill design.

---

## Rule 6: Find the Failure Mode

The most informative question in the entire interview is: "What would make you stop using this skill?"

It reveals:
- The real quality bar
- The non-negotiable requirements
- The edge cases the user is already worried about

If the user says "I'd stop using it if it got the tone wrong on client emails," you now know that tone control is the highest-priority feature.

---

## Rule 7: Don't Suggest Solutions During the Interview

The interview phase is for understanding, not building. Do not offer solutions, designs, or alternatives while interviewing.

**Bad** (during interview):
> "That sounds like it could work well with a template-based approach where..."

**Good**:
> "Got it — what does the starting input usually look like when this kicks off?"

**Why**: Suggesting solutions prematurely closes down the exploration. The user stops thinking about their real needs and starts reacting to your proposal.

---

## Rule 8: Confirm Before Generating the PRD

After the interview is complete, write a plain-English summary of everything understood and ask: "Does this match what you have in mind?"

Do not generate the PRD until the user confirms. A misunderstood summary means a wrong PRD.

---

## Rule 9: The PRD Is the Contract

The PRD is not a suggestion — it's the specification. When building from the PRD, implement exactly what is specified:
- No added features that weren't discussed
- No assumptions about what the user "probably" also wants
- No scope creep "while I'm at it"

If something important seems missing from the PRD, ask before implementing it.

---

## Rule 10: Mark Assumptions Explicitly

If there's something you assumed during the PRD that wasn't explicitly confirmed, mark it:

```
**Assumption**: The output will be formatted as Markdown.
If you need a different format, say so before I build.
```

This prevents the user from receiving something wrong and wondering why.
