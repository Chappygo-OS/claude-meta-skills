# Process interviewer rules and probes

This file is loaded on demand when SKILL.md needs the operational rules and the surgical follow-up patterns for the most common vague-answer traps. Eleven interview rules govern how the conversation runs; three probe patterns turn the vague-est answers ("analyzes", "tone of voice", "nicely") into testable mechanics.

## The 11 interview rules

| # | Rule | What it means in practice |
|---|---|---|
| 1 | One question per turn. Never stack. | Two questions in one turn means the user answers the easy one and forgets the hard one. The funnel only works when each gate is held. |
| 2 | Pull answers from the workspace before asking the user. | Scan the conversation, the open files, and the prior context. If the answer is already there, use it and confirm — don't ask. |
| 3 | Always offer a recommendation with reasoning. | "I'd default to X because of Y. Sound right, or do you want a different angle?" Recommendations beat open-ended questions for users who haven't decided yet. |
| 4 | Acknowledge each answer before advancing. | A one-sentence playback ("Got it — `X`") tells the user the answer was heard. Skipping this makes the interview feel like an interrogation. |
| 5 | Reject vague answers. Ask again with a sharper frame. | "Friendly tone" is not an answer. Ask for two paragraphs labeled IS and ISN'T, or give two options to pick between. |
| 6 | Demand concrete examples. | "Show me what good looks like" is the most useful question in this skill. Link to a real example, paste a real one, or describe a specific past instance. |
| 7 | Track unresolved items in a visible scratch list. | A running scratch list keeps the user oriented and prevents loops. New questions go on the list; resolved items get crossed off. |
| 8 | Keep tone warm and conversational, not bureaucratic. | The user is helping the skill help them. Sound like a thoughtful colleague, not a compliance officer. |
| 9 | Stop when the spec is implementable, not when it is "complete." | Perfection is the enemy. The interview ends when a competent third party could execute the next step. |
| 10 | Scale question count to complexity. | Simple flow: 8–10 questions. Branching workflow: 15–20 questions. Don't pad short interviews; don't truncate complex ones. |
| 11 | Defuse impatience with cost-of-rewrite framing. | "Ten minutes here saves a week of rebuilding." Most impatience comes from not seeing the downstream cost of vague answers. Surface it. |

## How the rules combine

Rules 1, 4, and 7 keep the conversation legible. Rules 5, 6, and 11 keep it rigorous. Rule 9 keeps it bounded. The rest are guardrails. When the interview drifts, almost every drift is a violation of rules 1, 5, or 9.

## Common drift patterns

- **Rule 1 violation** — asking three questions to "save time". The user picks one and the other two never get answered. Always one.
- **Rule 5 violation** — accepting "make it sound good" as an answer to a tone question. Always force a concrete frame.
- **Rule 9 violation** — adding "nice to have" questions after the spec is implementable. Stop. Build a v1. Iterate.

## The 3 probe patterns

These are the three most common vague-answer traps and the surgical follow-ups that resolve them.

### Probe 1 — "It analyzes the input"

Vague verbs (analyzes, processes, handles, manages) hide the actual operation. Force the operation to surface.

**Forced follow-up**

> Name the operations. Is it extraction? Classification? Scoring? Comparison? Which fields are involved? What thresholds determine the output?

**Example sequence**

- *User*: "The skill analyzes the customer feedback and gives me insights."
- *Skill*: "What does it pull out — sentiment scores, topic clusters, complaint categories, or specific phrases?"
- *User*: "Topic clusters and sentiment."
- *Skill*: "Topic clusters at what granularity — five categories, twenty, or open-ended? And sentiment at what scale — binary, 1–5, or labeled (frustrated, neutral, delighted)?"

The vague verb is now two named operations with defined output shapes.

### Probe 2 — "Match my tone of voice"

Tone is the most common request that gets accepted vaguely and then fails on first delivery. Force the user to show the tone, not describe it.

**Forced follow-up**

> Write two short paragraphs: one labeled IS — what your tone sounds like — and one labeled ISN'T — what it specifically isn't. Then list five word-level do's and five word-level don'ts.

**Example sequence**

- *User*: "I want it to sound like me — friendly but direct."
- *Skill*: "Two paragraphs would help. Write one labeled IS — what your tone sounds like at its best — and one labeled ISN'T — what it gets confused with that you reject. Then five do words and five don't words."
- *User*: "IS — direct, slightly self-deprecating, willing to disagree. Not in a mean way, but I'd rather be wrong out loud than vague. ISN'T — corporate. No 'thrilled to announce'. No 'I hope this finds you well.' Do: actually, honestly, here's the deal, I think, the thing is. Don't: leverage, foster, robust, journey, ecosystem."

The skill now has anchors that can be turned into a voice profile.

### Probe 3 — "Format it nicely"

"Nicely" is not a format. Force named sections with explicit ordering, required vs optional flags, and length bounds.

**Forced follow-up**

> Define the named sections. For each section: required or optional, the ordering, and the length bound (rough word count or line count).

**Example sequence**

- *User*: "Just format the output nicely with sections."
- *Skill*: "Let me pin the sections down. What goes first? What's always there vs only when relevant? And rough length per section?"
- *User*: "Always: a one-sentence summary at top, then a numbered list of action items, each ≤15 words, with an owner. Optional: a 'risks' section if any came up. Always: a 'decisions' line at the bottom with the chosen action."

"Nicely" is now a four-section template with required, optional, and bounded fields.

## When a probe still fails

If the user can't produce a concrete answer even after the probe, two paths:

1. **Find an example in the workspace.** Real artifacts beat hypothetical descriptions. "Show me a recent email you wished sounded better" turns abstract tone preferences into edit-able material.
2. **Defer the question with a recommendation.** "I'll default to a 5-bullet structure with bold action verbs — we can change it on first delivery." Defaulting and iterating is faster than abstract discussion.

## Phase gates referenced from SKILL.md

Each interview phase has a gate that must close before the next phase begins:

- **Phase 1 gate** — one-line problem statement, named audience, concrete input source, concrete output destination, explicit deliverable type
- **Phase 2 gate** — every step passes the Stranger Test (a competent third party could execute it from the description alone), no unresolved branches
- **Phase 3 gate** — every failure mode has a defined behavior
- **Phase 4 gate** — the user signs off explicitly on the structured summary
- **Phase 5** — the artifact (SKILL.md, plan doc, or stress-test critique) is emitted

The gates are the rigor. Skipping one means the artifact downstream gets built on a vague answer.
