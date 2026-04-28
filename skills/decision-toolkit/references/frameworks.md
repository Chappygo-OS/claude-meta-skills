# Decision toolkit framework library

This file is loaded on demand when SKILL.md needs the full template for any of the seven analytic frameworks. Each entry covers when to use the framework, the structural template (in markdown so it can be filled directly), and one worked example. The frameworks are deliberately heterogeneous — pick the one that fits the decision shape, not the one that fits the user's mood.

## Framework selection cheat sheet

| Decision shape | Framework |
|---|---|
| "I'm making assumptions I haven't questioned" | First Principles |
| "I'm not seeing what I'd give up by doing this" | Opportunity Cost Calculator |
| "What does the full distribution of outcomes look like?" | Scenario Matrix |
| "Why would this fail in 12 months?" | Pre-Mortem |
| "Am I overweighting the short term?" | 10-10-10 |
| "Will I regret saying no, or regret saying yes?" | Regret Minimization |
| "Two options, multiple comparable criteria" | Weighted Decision Matrix |

## 1. First Principles

**Use when** the user is inheriting assumptions from convention, mentors, or industry norms — and those assumptions might not apply to their specific situation.

**Template**

```
1. What problem am I actually solving? (one sentence, in plain language)
2. Why now? (what changed that this is on the table today)
3. What is the irreducible core? (strip every nice-to-have until you can't)
4. What assumptions am I inheriting? (list them)
5. What would I do if no one had ever told me anything about this domain?
```

**Example — quitting a corporate job to consult**

1. *What problem am I actually solving?* I want to control my schedule and pick my projects.
2. *Why now?* My manager is leaving and the new structure looks worse.
3. *What is the irreducible core?* Work on better problems with people I respect, on my schedule.
4. *Assumptions inherited?* That consulting requires a website, an LLC, and a 6-month runway. That I need a niche before I start.
5. *Fresh-start answer?* Tell three former clients I'm available, take whichever first project lands, refine the niche from real engagements rather than guessing it in advance.

## 2. Opportunity Cost Calculator

**Use when** the decision feels free in isolation but the user hasn't priced what they're giving up.

**Template**

```
Direct cost
- Money: $___
- Hours: ___ over ___ weeks → ___ total hours
- Hourly equivalent at user's rate: $___

Alternative cost
- Highest-value foregone option: ___
- What that option would have produced (concrete): ___

Relational cost
- Key relationships affected: ___
- How: ___
```

**Example — taking a 6-month consulting engagement**

- *Direct:* $0 cash out, but 25 hours/week × 26 weeks = 650 hours; at the user's rate of $200/hr, opportunity value = $130,000.
- *Alternative:* The 650 hours could go into the productized version of the same skill; v1 would ship in month 4 and start generating recurring revenue.
- *Relational:* Two existing clients would feel deprioritized; one might churn.

The "free engagement" actually costs $130K and a probable v1 launch. The user can still take it — but with a clear price tag.

## 3. Scenario Matrix

**Use when** the user needs to see the full distribution of outcomes, not just the modal one. Five rows from worst to best, each with a probability and an expected-value contribution.

**Template**

```
| Scenario | Probability | Outcome (concrete) | EV contribution |
|----------|-------------|--------------------|-----------------|
| Worst    | %           | description        | prob × outcome  |
| Bad      | %           | description        | prob × outcome  |
| Neutral  | %           | description        | prob × outcome  |
| Good     | %           | description        | prob × outcome  |
| Best     | %           | description        | prob × outcome  |
| TOTAL    | 100%        |                    | sum             |
```

**Example — launching a paid newsletter**

| Scenario | Probability | Outcome | EV |
|---|---|---|---|
| Worst | 10% | Zero subs, 6 months wasted | -$15,000 (time cost) |
| Bad | 25% | 50 subs, $5K/yr, abandoned | -$5,000 |
| Neutral | 35% | 200 subs, $20K/yr, sustainable | $20,000 |
| Good | 20% | 800 subs, $80K/yr | $80,000 |
| Best | 10% | 3,000 subs, $300K/yr | $300,000 |
| TOTAL | 100% | | $50,000 EV |

Positive EV, but the worst-and-bad cases together hold 35% probability. The user should ask whether they can afford the left tail.

## 4. Pre-Mortem

**Use when** the plan is already half-formed and momentum is building. Pre-mortem forces the failure modes to the surface before they bite.

**Template**

```
It is 12 months from today and this decision has clearly failed.
What happened?

Causes (list 5–10):
- 

Split causes:
- Controllable: 
- Uncontrollable: 

Early signals (what would tell us this is happening before month 12?):
- 

Trigger thresholds (the specific number that says: course-correct now):
- 
```

**Example — opening a second restaurant location**

- *Causes:* slower foot traffic than projected, kitchen staff couldn't be hired, original location's quality dropped due to founder split attention, lease was wrong neighborhood, costs ran over.
- *Controllable:* hiring, attention split, cost discipline.
- *Uncontrollable:* foot traffic, neighborhood demographics post-pandemic.
- *Early signals:* monthly revenue in months 2–3 below 70% of projection, original location's NPS drops 5+ points.
- *Triggers:* if month 3 revenue is below 60% of projection, freeze further hiring; if original location's NPS drops 8+, pause expansion entirely.

## 5. 10-10-10

**Use when** the user is overweighting the short term — and the question is what their future self will care about.

**Template**

```
How will I feel about this in 10 minutes?
How will I feel about this in 10 months?
How will I feel about this in 10 years?
```

**Example — accepting a $50K consulting project that conflicts with a vacation**

- *10 minutes:* relief at the cash; mild guilt about the family.
- *10 months:* the $50K is in the bank, the vacation got rescheduled, family disappointment lingers.
- *10 years:* will not remember the project; will remember whether the family trust was honored or strained.

The 10-year answer reframes the decision.

## 6. Regret Minimization

**Use when** the decision has long-term identity weight — career, relationships, big bets — and short-term cost is dominating the analysis.

**Template**

```
Project forward to age 80, sitting in a comfortable chair, looking back at this moment.

Choice A — proceed:
  In 50 years, will I regret having tried? What will I regret?

Choice B — decline:
  In 50 years, will I regret not having tried? What will I regret?

Which regret is bigger?
```

**Example — applying to an MFA program at 38 with two young kids**

- *Proceed:* might regret the financial strain on the family; will not regret having attempted the work.
- *Decline:* might regret never attempting; the financial strain will be forgotten.
- *Verdict:* the regret of not trying is the larger one. Proceed, with a financial plan that protects the family.

## 7. Weighted Decision Matrix

**Use when** the choice is between two or three concrete options and there are 4–7 comparable criteria. This is the most analytical of the frameworks; use it last, not first.

**Template**

```
| Criterion | Weight | Option A score | Option A weighted | Option B score | Option B weighted |
|-----------|-------:|---------------:|------------------:|---------------:|------------------:|
| ...       | 0.XX   | 1–10           | weight × score    | 1–10           | weight × score    |
| ...       |        |                |                   |                |                   |
| TOTAL     | 1.00   |                | sum A             |                | sum B             |
```

Weights must sum to 1.0. Scores 1–10. The total is the comparable number.

**Example — choosing between two job offers**

| Criterion | Weight | Offer A | A weighted | Offer B | B weighted |
|---|---:|---:|---:|---:|---:|
| Compensation | 0.30 | 8 | 2.4 | 9 | 2.7 |
| Growth | 0.25 | 9 | 2.25 | 6 | 1.5 |
| Team quality | 0.20 | 7 | 1.4 | 8 | 1.6 |
| Mission fit | 0.15 | 9 | 1.35 | 5 | 0.75 |
| Commute | 0.10 | 6 | 0.6 | 9 | 0.9 |
| TOTAL | 1.00 | | **8.00** | | **7.45** |

Offer A wins by 0.55. Cross-check with 10-10-10 and Regret Minimization to confirm the numerical answer matches the gut answer. If the two diverge, the criteria or weights are wrong.

## When to combine frameworks

- **First Principles + Opportunity Cost** — the user is inheriting assumptions AND not pricing what they give up. Run them in that order.
- **Scenario Matrix + Pre-Mortem** — the matrix surfaces probabilities; the pre-mortem populates the worst-case row with named causes.
- **Weighted Decision Matrix + 10-10-10** — the matrix gives the numerical answer, the 10-10-10 confirms the future-self answer matches.
- **Regret Minimization alone** — for identity-defining bets where every other framework underweights the long term.

## When NOT to use a framework

- The user is venting, not deciding. Confirm there's a real decision before investing in the analysis.
- The decision is small (under $1K, under one workday, fully reversible). Frameworks add overhead that isn't earned.
- The decision is a values question (faith, parenting, ethics). Frameworks make these worse, not better.
