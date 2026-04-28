# Decision Scenario Templates

Used by `/decision-toolkit`. Pre-built analysis templates for common decision types. Apply the relevant template when the decision matches.

---

## Pricing Change (Raise / Lower / Restructure)

**Key questions**:
- What is the current average revenue per customer?
- What is the churn rate at the current price point?
- What do competitors charge for comparable value?
- What would a 20% price increase do to churn — what's the breakeven customer loss?
- Are you price-constrained or value-constrained? (Do customers leave because of price, or because they don't see enough value?)

**Scenario analysis**:
| Scenario | Price change | Churn change | Net revenue impact |
|----------|-------------|--------------|-------------------|
| Best case | +25% | -5% churn | +18% |
| Realistic | +25% | -15% churn | +5% |
| Worst case | +25% | -30% churn | -8% |

**Key bias to watch**: Status quo bias — "our customers will leave" is usually an overestimate. Most businesses under-price.

**Decision rule**: if realistic-case revenue impact is positive AND worst-case is survivable, raise prices.

---

## Hiring Decision (FTE vs. Contractor vs. Agency vs. AI)

**Key questions**:
- Is this a core competency or a support function?
- Is the work volume steady (→ FTE) or spiky (→ contractor)?
- How fast do you need results?
- What is the fully-loaded annual cost of an FTE vs. alternatives?
- Can you manage a contractor or agency, or do you need someone embedded?

**Comparison framework**:
| Option | Speed | Cost | Control | Risk |
|--------|-------|------|---------|------|
| FTE | Slow to hire | Highest (benefits + equity) | Highest | Hard to undo |
| Contractor | Faster | Medium | Medium | Easy to end |
| Agency | Fastest | Variable | Lowest | Quality variance |
| AI/tooling | Immediate | Low | High | Capability limits |

**Decision rule**: FTE only if (1) the work is core to the business, (2) it's steady-state volume, and (3) you can afford 3–6 months of ramp. Otherwise, default to contractor first.

---

## Build vs. Buy vs. Partner

**Key questions**:
- Is this a core differentiator? (If yes → build. If no → buy or partner.)
- What is the cost to build vs. annual SaaS cost over 3 years?
- What is your team's capacity to build and maintain this?
- Does a best-in-class vendor exist? What does their churn rate say about their product quality?
- What is the switching cost if the vendor fails or raises prices?

**Decision tree**:
1. Is this a core differentiator? → If no: buy or partner
2. Does a good vendor exist? → If no: build
3. Can we afford to build it AND maintain it? → If no: buy
4. Is the vendor's lock-in acceptable? → If yes: buy
5. Default: partner for non-core, build for core

**Key bias to watch**: NIH (Not Invented Here) syndrome — the instinct to build everything. Most features are not differentiators.

---

## Product Feature Prioritization

**Key questions**:
- Which user segment does each feature serve?
- What is the estimated impact on the key metric (revenue, retention, activation)?
- What is the estimated build effort (story points or weeks)?
- Does this unblock other work, or is it standalone?
- Is this a customer request or internal hypothesis?

**Framework: RICE scoring**:
```
RICE Score = (Reach × Impact × Confidence) / Effort

Reach: number of users affected per period
Impact: 0.25 (minimal) / 0.5 / 1 / 2 / 3 (massive) on core metric
Confidence: 50% (guess) / 80% (some data) / 100% (proven)
Effort: person-months to build
```

**Key bias to watch**: Recency bias — the most recent customer request gets overweighted. Use RICE to force comparison across all candidates.

---

## Go / No-Go on a New Market or Product Line

**Key questions**:
- What is the total addressable market (TAM) — and is it growing?
- Who are the 3 strongest competitors, and what is their share?
- What is the acquisition cost to reach the first 100 customers?
- Does your existing team, brand, and distribution have an advantage in this market?
- What does success look like in 18 months, and is that achievable with current resources?

**Go criteria** (need at least 3 of 5):
- [ ] TAM is large enough to justify the investment
- [ ] You have a defensible advantage (distribution, tech, relationships)
- [ ] Customer acquisition cost is sustainable on your current margins
- [ ] 3–5 target customers have confirmed the problem exists
- [ ] The team has relevant expertise or can hire it

**No-go signals** (any one may be disqualifying):
- No evidence the problem exists beyond one loud customer
- Requires 12+ months of development before first revenue
- A well-funded competitor with 5+ years of head start
- Your core business would suffer from the distraction

---

## Fire vs. Coach an Underperformer

**Key questions**:
- Is the underperformance a skills gap (coachable) or a motivation/values gap (not coachable)?
- How long has the underperformance been visible?
- Has a clear performance improvement plan been communicated and given fair time?
- What is the cost of the current situation on the team around this person?
- What is the cost of replacing them (recruiting, onboarding, ramp time)?

**Decision framework**:
- If: skills gap + willing attitude + < 6 months → coach with clear milestones
- If: motivation gap OR values misalignment → do not coach, exit quickly
- If: skills gap + > 6 months of coaching with no improvement → exit

**Key bias to watch**: Sunk cost (we've invested so much in them). The question is forward-looking: will the next 6 months be better? If the honest answer is no, the decision is made.

---

## Accept vs. Decline a Client or Project

**Key questions**:
- Does this project advance your core focus area, or pull you away from it?
- Is the client/project fee at or above your rate threshold?
- What is the opportunity cost? (What would you do instead with this time?)
- Are there red flags in the client's communication or negotiation behavior?
- Would you be proud to put this on your portfolio?

**Green flags**: Clear brief, fair timeline, decision-maker accessible, paying above rate, referral potential.

**Red flags**: Scope keeps changing during negotiation, payment terms unprofessional, condescending tone, "we've had trouble with other vendors before."

**Rule**: one red flag is a warning. Two or more is a no. Past-you who accepted despite red flags was wrong every time.
