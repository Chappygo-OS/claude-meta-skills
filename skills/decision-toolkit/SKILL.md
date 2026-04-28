---
name: decision-toolkit
description: First-principles framework for big decisions — guides you through the right questions without deciding for you
---

# Decision Toolkit

Claude is good at generating options. It's less good at helping you think clearly about which one to choose. This skill applies a structured first-principles framework to any significant decision: pricing, hiring, product bets, partnerships, pivots, or personal choices. It produces an interactive HTML wizard + a markdown report. It guides — it doesn't decide.

## Usage

```
/decision-toolkit [the decision you're facing]
```

Examples:
```
/decision-toolkit Should I raise prices on my consulting packages?
/decision-toolkit We're choosing between building in-house or using an external API for [feature]
/decision-toolkit Should I hire a full-time employee or a contractor for [role]?
/decision-toolkit We're deciding whether to pivot our product focus from SMBs to enterprise
/decision-toolkit Should I accept this partnership offer from [company]?
/decision-toolkit Which of these three features should we build next quarter?
/decision-toolkit Should I fire this underperforming team member or give them another quarter?
/decision-toolkit Should I take on this new client even though the scope feels vague?
```

## Instructions for Claude

When this skill is invoked:

### 1. Frame the decision precisely

- Restate the decision in a single sentence.
- Check for hidden sub-decisions — "Should I raise prices?" usually contains two: "Should I raise prices at all?" and "How and when do I roll it out?"
- Name each sub-decision separately and handle the primary one first.
- Identify the decision type: strategic, operational, people, financial, or product.
- Confirm the framing with the user before proceeding.

### 2. Gather context

- If a second brain, CLAUDE.md, or memory context is available, pull relevant background (previous decisions on this topic, documented constraints, business goals).
- Ask only for what's truly missing — never repeat questions whose answers are already available.
- Essential context to gather:
  - What's forcing this decision now?
  - What's the decision-making deadline?
  - Who else has a vote or veto?
  - What's the default if no decision is made?
  - What does success look like in 6 months?
  - What's the biggest risk you're trying to avoid?

### 3. Apply the full first-principles framework

See `references/frameworks.md` for deep descriptions of each method. Apply these lenses:

**A. Start-fresh test**
- If you were starting from zero today with current knowledge, would you choose this path?
- What assumptions are you carrying from the past that may no longer hold?
- What would a new hire with fresh eyes think about this decision?

**B. Stakeholder mapping**
- Who is directly affected by each option?
- Who has a stake in the outcome but isn't in the room?
- Who has relevant expertise you haven't consulted?
- Whose buy-in is required for implementation to succeed?
- Who could block or undermine the choice after it's made?

**C. Bias audit** (see `references/biases.md`)
- **Sunk-cost reasoning**: avoiding a change because of past investment?
- **Status quo bias**: defaulting to "keep doing this" because it's comfortable?
- **Confirmation bias**: looking for validation, not information?
- **Optimism bias**: is your best-case realistic, or wishful?
- **Availability heuristic**: overweighting recent examples or vivid failures?
- **Authority bias**: deferring to someone's opinion because of their title or status?
- **Planning fallacy**: underestimating time, cost, and complications?

**D. Timing test**
- Why decide now vs. in 30 days? 90 days? What changes?
- Is this a **two-way door** (reversible) or **one-way door** (irreversible)?
  - Two-way door → move fast, optimize for learning, bias to action
  - One-way door → move slow, optimize for correctness, gather more data first
- What information would you have in 30 days that you don't have today?

**E. Opportunity cost**
- What does each option prevent you from doing?
- What is the cost of NOT deciding (default path cost)?
- What resource — time, money, attention, team capacity — is consumed by each path?
- What asymmetric upside are you potentially leaving on the table?

**F. Pre-mortem analysis**
- Imagine it's 12 months from now and Option A failed spectacularly. What happened?
- What sequence of events led to that failure?
- What would have to be true for the worst case to occur?
- Is that failure scenario more likely than your gut says?

**G. Scenario analysis**
- For each option, map: best case / realistic case / worst case
- Assign rough probabilities (not precise — even rough estimates prevent wishful thinking)
- Identify which downside scenarios are **acceptable** vs. **catastrophic**
- Calculate expected value if quantifiable
- Ask: what single event would most change your assessment?

**H. Regret minimization** (Bezos framework)
- Imagine yourself at 80 looking back. Which choice would you regret NOT making?
- Which choice, if it failed, would you regret having made?
- Which decision would make your 80-year-old self proud, regardless of outcome?

**I. Second-order effects**
- If this decision succeeds exactly as planned, what new problems does it create?
- What does this decision signal to your team, customers, or competitors?
- What precedent does it set for future decisions?

### 4. Generate outputs

Produce both:

**Markdown report** containing:
- Decision statement and type
- Options analyzed (2–5, no more)
- Framework results for each option (all 9 lenses)
- Scenario analysis table with probabilities
- Key open questions that remain
- Confidence level: Low / Medium / High — and what would move it higher
- Decision criteria ranked by importance

**Interactive HTML wizard** containing:
- Step-through interface, one framework section per screen
- Progress bar showing how far through the analysis you are
- Text inputs for each question with placeholder guidance
- All answers collected into a final summary view
- Print/export button for saving the analysis as PDF
- Optional: "What's the verdict?" synthesis button that combines all inputs

### 5. Do not give a recommendation by default

The principle is: **guide, don't decide.** The value is in the thinking process, not the answer.

Exception: if the user explicitly asks "What would you recommend?" or "What should I do?", give a clear directional recommendation with:
- One primary reason supporting it
- One key risk to watch
- One condition under which you'd change the recommendation

### 6. Close with 3 open questions

The hardest questions the user should sit with before making the call. These should be non-obvious — not questions already addressed, but the edge cases, unknown unknowns, and gut-check questions that only the decision-maker can answer.

## Decision scenario templates

See `references/scenarios.md` for pre-built analysis templates for common decision types:
- Pricing change (raise / lower / restructure)
- Hiring decision (FTE vs. contractor vs. agency vs. AI)
- Build vs. buy vs. partner
- Product feature prioritization
- Go / no-go on a new market or product line
- Partnership or acquisition evaluation
- Fire vs. coach an underperformer
- Accept vs. decline a client or project

## Skill integrations

- **`/process-interviewer`** — deeply spec out a new initiative before running the framework
- **`/fact-checker`** — verify factual claims embedded in the decision context
- **`/prompt-master`** — clarify vague decision framing before running the framework
- **`/deep-research`** — research market conditions, competitors, or precedents relevant to the decision

## Notes

- Most useful for decisions with significant downside risk, multiple stakeholders, or emotional attachment to one option.
- The more context Claude has about your business and history, the more targeted the questions become.
- Reference files: `references/frameworks.md`, `references/biases.md`, `references/scenarios.md`
