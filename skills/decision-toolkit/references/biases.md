# Decision toolkit bias catalog

This file is loaded on demand when SKILL.md needs the full bias audit content. Twenty cognitive biases are catalogued: ten core (the ones that move the most weight in real decisions) and ten secondary (still common, surface as a second pass). Each entry has a one-line definition, a decision-impact note, and one or two counter-questions to ask yourself before committing to the decision.

## How to run the audit

1. Read the user's restated decision out loud.
2. Walk the ten core biases first. Mark each as Likely / Possibly / Not Present.
3. For every Likely, write the counter-question's answer in plain language.
4. Run the ten secondary biases as a faster second pass.
5. If three or more core biases are Likely, the decision is hot — defer or run a Pre-Mortem before proceeding.

The point is not to eliminate bias — it is to surface it so the user can decide with biases visible rather than buried.

## Ten core biases

| # | Bias | Definition | Decision-impact | Counter-questions |
|---|---|---|---|---|
| 1 | FOMO | Fear of missing out distorts urgency | Forces premature commitment to a decision that wasn't actually time-sensitive | Is the deadline real or self-imposed? Would I still want this in 90 days? |
| 2 | Sunk Cost | Past investment falsely justifies continuation | Keeps the user funding a losing path because they've already spent | If I were starting fresh today with no history here, would I make this same investment? |
| 3 | Authority | Over-weighting credentialed-but-irrelevant opinions | The user defers to a senior name whose expertise doesn't actually apply | Is the expert's authority in *this exact* domain, or adjacent? What would a domain-specific expert say? |
| 4 | Social Proof | Copying the herd | The user picks the popular option without checking whether it fits their situation | What evidence do I have that this works for someone in my exact spot, not just in general? |
| 5 | Commitment-Consistency | Defending past public statements | Once the user has said something out loud, they keep doing it to stay consistent | If I had said the opposite three months ago, would I still believe what I'm saying now? |
| 6 | Optimism | Underweighting downside | The plan assumes everything works; the failure case is unmodeled | What is the realistic worst case, and what's the probability? Would I still proceed at that probability? |
| 7 | Recency | The last data point dominates | A single recent event (a friend's success, a viral post) outweighs years of base-rate data | What does the long-run data say? Has anything actually changed, or am I just remembering the most recent example? |
| 8 | Confirmation | Seeking only supporting evidence | The user has already decided; the analysis is theater | What would I look for if I were trying to disprove this? Have I actually looked? |
| 9 | Shiny Object | Distraction by novelty | A new idea pulls attention away from the unfinished work that would compound | Will this still feel exciting in 30 days, or am I escaping the boring middle of the previous bet? |
| 10 | Loss Aversion | Losses sting ~2x more than equivalent gains feel good | Causes the user to refuse positive-EV bets because the downside feels disproportionately scary | If the framing were flipped (gain X vs not-gaining X), would my answer change? |

## Ten secondary biases

| # | Bias | Definition | Decision-impact | Counter-questions |
|---|---|---|---|---|
| 11 | Anchoring | The first number heard becomes the reference point | Negotiations and pricing decisions get tethered to whatever was said first | What would I think the right number was if the conversation had never started? |
| 12 | Availability Heuristic | Vivid examples feel more probable than they are | Plane crash fear, lottery hope — both stem from this | What does the actual base rate say, not the vivid story? |
| 13 | Bandwagon | Adopting a belief because it's gaining popularity | Distinct from social proof: this is about the *trend* of adoption, not the current size | Was this a good idea before it was popular? Will it be a good idea after it stops being popular? |
| 14 | Dunning-Kruger | Low competence in a domain pairs with high confidence in that domain | New entrants over-promise; experts hedge | If I asked someone with 10x my experience here, would they share my confidence? |
| 15 | Endowment | We value what we already own more than equivalent things we don't | Causes people to refuse trades that would obviously make them better off | If I didn't already have this, would I pay the asking price to acquire it? |
| 16 | Halo | A positive trait in one area colors judgment of unrelated areas | A successful founder's opinion on parenting carries unearned weight | What is this person's track record in *this specific* domain? |
| 17 | Hindsight | Past events feel inevitable in retrospect, biasing future predictions | The user assumes they can predict outcomes they couldn't have | Could I have actually predicted this *before* it happened, or am I rewriting history? |
| 18 | Planning Fallacy | Underestimating time, cost, and effort for known tasks | Almost every project ships late by some multiple | What's my honest base rate for projects this size? What multiplier should I apply? |
| 19 | Status Quo | Defaulting to the current state because change feels risky | Inertia masquerades as strategy | If I were starting fresh and could pick any state, would I pick the current one? |
| 20 | Survivorship | Focusing on the winners and ignoring the losers | "Look at all these successful dropouts" ignores the dropouts who failed | Where is the data on the people who did this and didn't make it? Have I weighted them equally? |

## Reading the audit

Three patterns recur:

- **Heat cluster (3+ core biases Likely)** — defer the decision and re-audit in 7 days. The user is in a hot state.
- **One dominant bias** — name it explicitly in the synthesis. "FOMO is the only bias I see firing here, and it's firing hard."
- **No biases firing** — rare. If a decision audit lands on zero, double-check by asking what evidence would change the user's mind. If the answer is "nothing", confirmation bias is hiding.

## Anchors and counter-anchors

Two of the most useful counter-questions across the whole catalog:

- **The mirror test** — "If I were giving advice to a friend in this exact situation, what would I tell them?" This question pulls the user out of first-person ownership and exposes biases 2, 5, 8, 15, 19 in one sweep.
- **The reset test** — "If I were starting today with no history, no commitments, and no audience, would I pick this?" This exposes biases 2, 5, 9, 15, 19 by stripping path dependence.

Use both before declaring an audit complete.
