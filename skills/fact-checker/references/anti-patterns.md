# Fact-checker anti-pattern catalog

This file is loaded on demand when SKILL.md needs the full inventory of misleading-claim techniques. Four families are catalogued: Statistical Manipulation, Context Removal, False Equivalences, and Logical Fallacies. Every claim runs through this screen before a final rating is assigned. Each entry has a how-to-spot-it cue and a what-to-do-about-it action.

## Family 1 — Statistical Manipulation

Numbers used to mislead. The data may be technically accurate while still creating a false impression.

| Anti-pattern | How to spot it | What to do |
|---|---|---|
| Cherry-picked endpoints | A trendline that starts or ends at an unusual moment — recession bottom, post-pandemic spike, the day after a regulation changed | Re-plot the same metric with a longer window and a less convenient start date. If the conclusion changes, the original claim is cherry-picked. |
| Truncated y-axes | Bar charts where the y-axis starts above zero, exaggerating differences | Re-plot with y-axis at zero. If the bars now look identical, the visual was the trick. |
| Correlation paraded as causation | Two trendlines moving together, presented as if one causes the other | Ask: what's the third variable that drives both? Was there a randomized intervention? Without one, the causal claim is unsupported. |
| Unweighted averages | "The average customer saves $X" without saying that one whale customer is dragging the mean | Ask for the median and the distribution. If the median is materially different from the mean, the average is misleading. |
| Lifetime-vs-annual swaps | "90% of startups fail" — but "fail" means at any point over 10 years, not in year one | Pin down the timeframe. Re-rate the claim against the actual annualized number. |
| Relative-vs-absolute risk | "This intervention doubles your risk" when the absolute risk goes from 0.001% to 0.002% | Always ask for the absolute numbers. Doubling a tiny risk is still tiny. |
| Selection-biased samples | "We surveyed our customers and 95% love the product" | Note the sampling frame. Customer surveys exclude the ones who already churned. |
| Survivorship-only datasets | "Successful founders did X, so do X" | Demand data on the founders who also did X and failed. |
| Made-up precision | "73.4% of teams agree" with no citation | Spurious precision is a red flag. Ask for the underlying study. |
| Big-number-without-base-rate | "1 million people did X" — without saying out of how many | Demand the denominator. A million out of 350 million is small; a million out of 2 million is huge. |

## Family 2 — Context Removal

The numbers and quotes are real, but they've been stripped of the qualifiers that change the meaning.

| Anti-pattern | How to spot it | What to do |
|---|---|---|
| Quote mining | A short clipped quote presented without the surrounding paragraph | Find the original. Read the paragraph above and below. Confirm the speaker meant what the clip implies. |
| Dropped qualifiers | The original said "up to X%" or "in some cases" — the citation drops the hedge | Restore the original phrasing. Most "X% of customers" stats are "up to X%" in the source. |
| Lost timeframes | "Crime is up 50%" with no period | Specify the time window. A 50% jump from a single low month is different from a 50% rise over a decade. |
| Missing denominators | "Deaths increased 200%" without saying out of how many people | Restore the denominator. Percent changes off small bases are routinely sensational. |
| Stripped study population | A finding from a specialized population (e.g., NICU infants) presented as if it generalizes | State the original population. Note when the cited claim doesn't apply. |
| Dropped confidence intervals | A point estimate with no error bars | Restore the CI. If it crosses zero or is wider than the headline difference, the headline is overconfident. |
| Mistranslated effect sizes | "Significant" rephrased as "huge" — statistically significant doesn't mean practically meaningful | Restore the effect size in plain units. A 1mmHg blood pressure reduction is statistically significant and clinically irrelevant. |

## Family 3 — False Equivalences

Comparing things that aren't comparable, or treating settled positions as open debates.

| Anti-pattern | How to spot it | What to do |
|---|---|---|
| Non-comparable populations | Comparing a metric across countries with different definitions of the metric | Pin down the definition. US vs European unemployment uses different methodologies. Either harmonize or refuse the comparison. |
| Both-sides-ing settled science | Presenting a 99/1 expert split as if it's a 50/50 debate | Surface the consensus weight. State the size of the dissenting minority and its track record. |
| Equating frequency with importance | A topic that's covered often gets treated as more important than one rarely covered | Decouple coverage from importance. Frequency reflects newsroom priorities, not real-world impact. |
| Apples-to-oranges metrics | Comparing nominal vs real, gross vs net, monthly vs annualized | Pin down the units. Convert to the same basis before judging the comparison. |
| Anecdote-vs-data equivalence | One vivid story presented as equal weight to a large dataset | Name the asymmetry explicitly. One story does not refute a 10,000-person study. |
| Scale equivalence | Comparing a $50K business and a $500M business as "two businesses doing X" | Note the scale. Strategies that work at one scale routinely fail at another. |

## Family 4 — Logical Fallacies

Reasoning errors that make a claim feel sound when its structure is broken.

| Anti-pattern | How to spot it | What to do |
|---|---|---|
| Ad hominem | Attacking the person making the claim instead of the claim itself | Separate the source's character from the claim's truth. A jerk can be right. |
| Appeal to authority (improper) | "Expert X says Y" — but X's expertise is not in Y's domain, or X has a financial stake | Check the domain match. Check disclosed conflicts. Downgrade tier accordingly. |
| False dichotomy | "Either X or Y" — when Z is also available | Surface the missing options. Most binary framings are advocacy, not analysis. |
| Slippery slope | "If we allow X, then Y, then Z" — without evidence of the causal links | Demand the link evidence. If Y has happened in jurisdictions that allowed X, surface it. If not, the slope is rhetorical. |
| Post hoc | "X happened, then Y happened, therefore X caused Y" | Demand a mechanism. Temporal sequence is not causation. |
| Circular reasoning | The conclusion is smuggled into the premise ("This is the best because nothing's better") | Restate the premise without the conclusion. If the argument disappears, it was circular. |
| Strawman | The claim being refuted isn't the actual claim that was made | Restate the original claim verbatim. Compare to what's being refuted. |
| Whataboutism | Deflecting from claim X by raising unrelated claim Y | Note the deflection. Return to X. |
| Appeal to popularity | "Lots of people believe Y" presented as evidence Y is true | Adoption is not truth. Cite the underlying evidence or note its absence. |
| Moving the goalposts | When evidence is provided, a new requirement is invented | Note the shift explicitly. Return to the original standard of evidence. |

## How the screen runs

Run all four families against every non-trivial claim before assigning a verdict:

1. **Statistical Manipulation pass** — for every number, ask: what's the timeframe, denominator, and methodology?
2. **Context Removal pass** — read the source paragraph, not just the cited sentence.
3. **False Equivalence pass** — are the things being compared actually comparable?
4. **Logical Fallacies pass** — is the *structure* of the argument valid, independent of the data?

A claim that passes all four screens with tier 1–3 sources earns TRUE. A claim that hits one anti-pattern moves down at least one verdict level. Claims hitting two or more anti-patterns rarely climb above MIXED.

## Common combo patterns

A handful of claim types are reliably hit by multiple anti-patterns at once. When you see them, run the full screen with extra care:

- **Viral statistics** ("90% of startups fail") — usually combine cherry-picked endpoints + lifetime-vs-annual swap + missing denominator
- **Marketing case studies** ("Our customers see 10x ROI") — usually combine selection bias + survivorship + missing denominator + made-up precision
- **TAM-as-evidence claims** ("$50B TAM, growing 35% YoY") — usually combine non-comparable populations + circular sourcing + dropped methodology
- **"Studies show" without citation** — combines vague attribution + appeal to authority + missing study population
- **Comparative international stats** ("Country X is 5x more Y") — combines non-comparable populations + dropped definitions + cherry-picked endpoints
