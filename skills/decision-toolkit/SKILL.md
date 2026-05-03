---
name: decision-toolkit
description: Generate structured decision-making tools — step-by-step guides, bias checkers, scenario explorers, and interactive dashboards. Use when facing significant choices requiring systematic analysis: pricing, hiring, product bets, partnerships, pivots. Supports multiple cognitive styles and output formats. Guides — doesn't decide.
---

# Decision Toolkit

Claude is good at generating options. It's less good at helping you think clearly about which one to choose. This skill applies a structured first-principles framework to any significant decision and produces interactive tools, not just analysis — empowering the decision-maker rather than deciding for them.

## Philosophy

1. **Guide, don't decide** — Tools illuminate the decision space; humans choose
2. **One thing at a time** — Reduce cognitive load through progressive disclosure
3. **Multiple lenses** — Same decision viewed through different frameworks reveals blind spots
4. **Biases visible** — Make cognitive biases explicit and checkable
5. **Actionable output** — End with concrete next steps, not abstract conclusions

## Usage

```
/decision-toolkit [the decision you're facing]
```

Examples:
```
/decision-toolkit Should I raise prices on my consulting packages?
/decision-toolkit Should I hire a full-time employee or a contractor for [role]?
/decision-toolkit We're deciding whether to pivot our product focus from SMBs to enterprise
/decision-toolkit Should I accept this partnership offer from [company]?
/decision-toolkit Which of these three features should we build next quarter?
/decision-toolkit Should I fire this underperforming team member or give them another quarter?
```

**Not for**: Trivial decisions, emergency responses, or when user just needs information.

---

## DECISION TYPES

### Type 1: Opportunity Evaluation
*Should I pursue this opportunity?*
Partnership, job offer, investment, project

### Type 2: Resource Allocation
*Where should I invest my time/money/attention?*
Prioritization, budgeting, focus areas

### Type 3: Risk Assessment
*What could go wrong and is it worth it?*
New ventures, changes, experiments

### Type 4: Trade-off Navigation
*Which option among alternatives?*
Tool selection, hire decisions, strategic choices

---

## STEP 1 — FRAME THE DECISION PRECISELY

- Restate the decision in a single sentence.
- Check for hidden sub-decisions — "Should I raise prices?" usually contains two: "Should I raise prices at all?" and "How and when do I roll it out?"
- Name each sub-decision separately and handle the primary one first.
- Identify the decision type (see above).
- Confirm the framing with the user before proceeding.

---

## STEP 2 — GATHER CONTEXT

- If a second brain, CLAUDE.md, or memory context is available, pull relevant background.
- Ask only for what's truly missing — never repeat questions whose answers are already available.
- Essential context to gather:
  - What's forcing this decision now?
  - What's the decision-making deadline?
  - Who else has a vote or veto?
  - What's the default if no decision is made?
  - What does success look like in 6 months?
  - What's the biggest risk you're trying to avoid?

---

## STEP 3 — APPLY THE FULL FRAMEWORK (9 LENSES)

See `references/framework-deep-dives.md` for extended explanations of each method.

**A. Start-fresh test (First Principles)**
- If you were starting from zero today with current knowledge, would you choose this path?
- What assumptions are you carrying from the past that may no longer hold?
- What would a new hire with fresh eyes think about this decision?

**B. Stakeholder mapping**
- Who is directly affected by each option?
- Who has a stake in the outcome but isn't in the room?
- Whose buy-in is required for implementation to succeed?
- Who could block or undermine the choice after it's made?

**C. Bias audit** (see `references/bias-encyclopedia.md` for full descriptions and counters)
- **FOMO** — Fear of missing a unique opportunity?
- **Sunk-cost** — Avoiding a change because of past investment?
- **Status quo bias** — Defaulting to "keep doing this" because it's comfortable?
- **Confirmation bias** — Looking for validation, not information?
- **Optimism bias** — Is your best-case realistic, or wishful?
- **Authority bias** — Deferring to someone because of their title or status?
- **Planning fallacy** — Underestimating time, cost, and complications?
- **Loss aversion** — Overweighting potential losses vs. potential gains?

**D. Timing test**
- Why decide now vs. in 30 days? 90 days? What changes?
- Is this a **two-way door** (reversible) or **one-way door** (irreversible)?
  - Two-way door → move fast, optimize for learning
  - One-way door → move slow, optimize for correctness
- What information would you have in 30 days that you don't have today?

**E. Opportunity cost**
```
Hours/week × Weeks × Hourly rate = Direct cost
+ What else could those hours produce?
+ What relationships/opportunities might suffer?
= True opportunity cost
```

**F. Pre-mortem analysis**
- Imagine it's 12 months from now and this decision failed spectacularly. What happened?
- What sequence of events led to that failure?
- Is that failure scenario more likely than your gut says?

**G. Scenario analysis**
| Scenario | Probability | Outcome | Expected Value |
|----------|-------------|---------|----------------|
| Worst    | X%          | ...     | ...            |
| Bad      | X%          | ...     | ...            |
| Neutral  | X%          | ...     | ...            |
| Good     | X%          | ...     | ...            |
| Best     | X%          | ...     | ...            |

Assign rough probabilities (not precise — even rough estimates prevent wishful thinking).

**H. Regret minimization** (Bezos framework)
- Imagine yourself at 80 looking back.
- Would you regret doing this?
- Would you regret NOT doing this?

**I. Second-order effects**
- If this decision succeeds exactly as planned, what new problems does it create?
- What does this decision signal to your team, customers, or competitors?
- What precedent does it set for future decisions?

---

## STEP 4 — CHOOSE OUTPUT FORMAT

Based on user preference and context:

**1. Interactive HTML Guide** (primary — complex decisions with time available)
Step-by-step wizard, one framework section per screen, progress bar, state persistence, final summary, keyboard navigation, print-friendly CSS.
Use template: `templates/decision-guide-template.html`

**2. Markdown Framework** (quick analysis or text-based use)
Structured prompts, checkbox-style bias audit, fill-in-the-blank templates.
Use template: `templates/decision-framework.md`

**3. Voice Summary** (on-the-go consumption)
5–7 paragraph executive summary. Key decision + rationale.
Use template: `templates/decision-voice-summary.md`

**4. PDF Report** (sharing with others)
Professional formatting, all frameworks applied, appendix with raw analysis.

---

## STEP 5 — COGNITIVE INCLUSIVITY

Different people process decisions differently. Adapt the output format accordingly:

| Style | Accommodation |
|-------|---------------|
| **Analytical** | Numbers, matrices, weighted scores |
| **Intuitive** | Gut-check prompts, "how does this feel?" |
| **Visual** | Diagrams, progress bars, color coding |
| **Verbal** | Written summaries, question prompts |
| **Sequential** | Step-by-step wizard flow |
| **Global** | Dashboard overview option |

---

## STEP 6 — DO NOT GIVE A RECOMMENDATION BY DEFAULT

The principle is: **guide, don't decide.** The value is in the thinking process, not the answer.

**Exception**: if the user explicitly asks "What would you recommend?" or "What should I do?", give a clear directional recommendation with:
- One primary reason supporting it
- One key risk to watch
- One condition under which you'd change the recommendation

---

## STEP 7 — CLOSE WITH 3 OPEN QUESTIONS

The hardest questions the user should sit with before making the call. These should be non-obvious — not questions already addressed, but edge cases, unknown unknowns, and gut-check questions that only the decision-maker can answer.

---

## DECISION SCENARIO TEMPLATES

See `references/scenarios.md` for pre-built analysis templates for common decision types:
- Pricing change (raise / lower / restructure)
- Hiring decision (FTE vs. contractor vs. agency vs. AI)
- Build vs. buy vs. partner
- Product feature prioritization
- Go / no-go on a new market or product line
- Partnership or acquisition evaluation
- Fire vs. coach an underperformer
- Accept vs. decline a client or project

---

## Skill integrations

- **`/process-interviewer`** — deeply spec out a new initiative before running the framework
- **`/fact-checker`** — verify factual claims embedded in the decision context
- **`/prompt-master`** — clarify vague decision framing before running the framework

## Reference files

- `references/framework-deep-dives.md` — extended explanations of each framework with examples
- `references/bias-encyclopedia.md` — full bias descriptions, counter-questions, warning signs
- `references/scenarios.md` — pre-built templates for common decision types
- `references/frameworks.md` — original frameworks reference (8 frameworks in depth)
- `references/biases.md` — original 11 cognitive biases reference
- `templates/decision-framework.md` — fillable markdown template
- `templates/decision-guide-template.html` — interactive HTML wizard template
