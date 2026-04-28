---
name: decision-toolkit
description: First-principles framework for big decisions — guides you through the right questions without deciding for you
---

# Decision Toolkit

Claude is good at generating options. It's less good at helping you think clearly about which one to choose. This skill applies a structured first-principles framework to any significant decision: pricing, hiring, product bets, partnerships. It produces an interactive HTML wizard + a markdown report. It guides — it doesn't decide.

## Usage

```
/decision-toolkit [the decision you're facing]
```

Examples:
```
/decision-toolkit Should I raise prices on my consulting packages?
/decision-toolkit We're choosing between building in-house or using an external API for [feature]
/decision-toolkit Should I hire a full-time employee or a contractor for [role]?
```

## Instructions for Claude

When this skill is invoked:

1. **Frame the decision clearly** — restate what needs to be decided. Often there are actually 2 decisions hidden inside 1 (e.g., "raise prices?" is really "raise prices?" AND "how do I roll it out?"). Identify and name them separately.

2. **Check for context** — if a second brain or OS is available, pull relevant background (past decisions on this topic, business context, constraints already documented). Do not ask for information that's already available.

3. **Apply the first-principles framework** across these dimensions:

   **Start fresh test**
   - If you were launching this from scratch today, would you make the same choice?
   - What would you do differently with current knowledge?

   **Stakeholder mapping**
   - Who is affected by each option?
   - Who has a stake in the outcome but isn't in the room?

   **Bias check**
   - Are you anchored to the current state because it's familiar?
   - Are you avoiding a good option because it's uncomfortable?
   - Is there sunk-cost reasoning influencing the framing?

   **Timing test**
   - Why now? What changes if you wait 30 days? 90 days?
   - Is this decision reversible or irreversible?

   **Opportunity cost**
   - What does choosing option A prevent you from doing?
   - What's the cost of not deciding?

   **Scenario analysis**
   - Best case, realistic case, worst case for each option
   - What would have to be true for the worst case to happen?

4. **Generate outputs** — produce both:

   **Markdown report** — structured summary with the framework above filled in, conclusions and open questions

   **Interactive HTML wizard** — a step-through interface where the user can answer each question, see their reasoning collected, and optionally get a verdict summary based on their inputs

5. **Do not give a recommendation** unless the user explicitly asks for one. The principle is: guide, don't decide. The value is in the thinking process, not the answer.

6. **Close with 3 open questions** — the hardest questions the user should sit with before making the call.

## Notes

- Most useful for decisions with significant downside risk, multiple stakeholders, or where you're emotionally attached to one option.
- Pair with a second brain setup: the more context Claude has about your business, the more targeted the questions become.

## References

Load on demand when bias-checking or applying a specific framework:
- `references/biases.md` — 10 core biases (FOMO, Sunk Cost, Authority, Social Proof, Commitment-Consistency, Optimism, Recency, Confirmation, Shiny Object, Loss Aversion) and 10 secondary, each with counter-questions
- `references/frameworks.md` — 7 decision frameworks (First Principles, Opportunity Cost, Scenario Matrix, Pre-Mortem, 10-10-10, Regret Minimization, Weighted Decision Matrix) with templates and examples
