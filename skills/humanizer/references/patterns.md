# Humanizer pattern catalog

This file is loaded on demand when SKILL.md needs the full inventory of AI-fingerprint tells. The 24 patterns are organized into five groups (6 / 6 / 6 / 3 / 3): Content, Language, Style, Communication, and Filler-Hedging. Each row gives a one-line definition, the trigger words to scan for, and one short example so the rewrite pass can recognize and remove the hit.

## Group 1 — Content (6)

| # | Pattern | Definition | Trigger words | Example |
|---|---|---|---|---|
| 1 | Significance and legacy inflation | Manufactured "this changes everything" framing applied to ordinary updates | watershed, milestone, defining, era-defining, forever changed, paradigm shift | "Today marks a watershed moment for our industry." |
| 2 | Notability name-dropping | Forced mentions of famous figures to lend authority by association | as Einstein said, Steve Jobs once, like Bezos, Buffett famously | "Like Bezos says, it's always day one — and that's why we built this." |
| 3 | Superficial -ing tails | Empty present-participle clauses that decorate without adding meaning | transforming, reshaping, redefining, revolutionizing, empowering | "A new platform transforming how teams collaborate." |
| 4 | Promotional-brochure tone | Marketing copy posing as commentary; product-page register in the wrong context | state-of-the-art, cutting-edge, best-in-class, end-to-end, enterprise-grade | "A state-of-the-art solution that empowers teams to do their best work." |
| 5 | Vague attributions | Authority claimed via unnamed sources | experts say, many believe, studies show (uncited), it is widely understood | "Many believe this is the future of work." |
| 6 | Formulaic wrap-up sections | The model defaults to "Challenges and Future Prospects" or "Looking Ahead" closers | challenges and future prospects, looking ahead, in conclusion, the road ahead | A blog post that ends with a "Challenges and Future Prospects" subhead it never earned. |

## Group 2 — Language (6)

| # | Pattern | Definition | Trigger words | Example |
|---|---|---|---|---|
| 7 | AI-vocabulary words | The signature lexicon that gives the model away on first read | delve, tapestry, testament, underscore, intricate, pivotal, landscape, vibrant, garner, foster, navigate, journey, robust, leverage, seamless, holistic | "Let's delve into the intricate tapestry of modern leadership." |
| 8 | Copula avoidance | The model dodges plain `is` / `are` / `has` and reaches for inflated linking verbs | represents, constitutes, embodies, serves as, stands as | "This represents a significant opportunity." (The plain "this is a big opportunity" was right there.) |
| 9 | Negative parallelisms | The "not just X, it's Y" construction used reflexively as emphasis | not just, not merely, not only, more than just | "Not just a tool — a partner in your success." |
| 10 | Forced rule-of-three lists | A two-part or four-part idea bent into three to satisfy a rhetorical reflex | first, second, third (when the underlying logic doesn't have three parts) | A trio of bullets where the third is clearly a stretch. |
| 11 | Elegant variation | Cycling through synonyms inside one paragraph to avoid repeating the right word | utilize / leverage / harness / employ for the same verb in adjacent sentences | "We utilize AI. We leverage data. We harness machine learning." (All the same verb.) |
| 12 | Bogus "from X to Y" ranges | Fake-range constructions that pretend to bracket a domain | from startups to Fortune 500s, from novice to expert, from coast to coast | "From solo founders to Fortune 500 CEOs, everyone benefits." |

## Group 3 — Style (6)

| # | Pattern | Definition | Trigger words | Example |
|---|---|---|---|---|
| 13 | Em-dash overuse | Bracket-dash construction used as a default rhythm fix | — — (paired em-dashes mid-sentence) | "The result — a clean break — was inevitable." |
| 14 | Mechanical bolding | Bolding the first 2–3 words of every bullet whether or not they're the load-bearing phrase | **Key benefit:**, **Important:**, **Note:** at the head of every list item | A bulleted list where every item starts with two bold words and a colon. |
| 15 | Inline-header bullets | Bullets that imitate definition lists when the items aren't actually definitions | **Term:** description, **Feature:** description | Five bullets all shaped "**Word:** sentence." when prose would do. |
| 16 | Title-Case Headings Where Sentence Case Belongs | Headings rendered in title case in contexts (LinkedIn posts, internal docs) where sentence case is the norm | Capitalized Every Word In A Heading | "How To Win At Marketing In 2025" instead of "How to win at marketing in 2025." |
| 17 | Decorative emojis | Emojis sprinkled in headings or list items as visual filler | rocket, sparkles, fire, check-marks scattered through prose | "Our launch plan: rocket emoji 1. Build, sparkles 2. Ship." |
| 18 | Curly typography | Curly quotes and en/em-dashes appearing where the source has straight quotes and hyphens | smart-quote " ", apostrophe ', en-dash – | A pasted reply from "Slack" that suddenly contains curly quotes the user never typed. |

## Group 4 — Communication (3)

| # | Pattern | Definition | Trigger words | Example |
|---|---|---|---|---|
| 19 | Chatbot pleasantries | Service-rep openings that don't belong in finished prose | great question!, certainly!, I'd be happy to, absolutely!, of course! | "Great question! I'd be happy to walk you through this." |
| 20 | Knowledge-cutoff disclaimers | Preambles about what the model can or can't do leaking into the user-facing draft | as of my last update, I cannot browse, my training data, I don't have real-time | "As of my last update, the platform supports..." |
| 21 | Sycophancy | Agreeing too quickly, complimenting the prompt, hedging real disagreement out of existence | what a thoughtful question, you raise an excellent point, you're absolutely right | An email reply that opens with "What a thoughtful note!" before any substance. |

## Group 5 — Filler / Hedging (3)

| # | Pattern | Definition | Trigger words | Example |
|---|---|---|---|---|
| 22 | Filler phrases | Throat-clearing that adds words and removes signal | it is important to note that, in today's fast-paced world, at the end of the day, it goes without saying | "It is important to note that timing matters." (Just say "timing matters.") |
| 23 | Over-hedging | Stacked qualifiers that drain a claim of its claim-ness | might possibly, could potentially, may perhaps, it could be argued | "This could potentially perhaps be a useful approach." |
| 24 | Generic cheerful conclusions | Customer-service closers attached to anything that ends | hope this helps!, let me know if you need anything!, happy to clarify! | A board-level memo that ends with "Hope this helps!" |

## How the soul overlay relates

Removing all 24 patterns is necessary but not sufficient. Even pattern-free prose can read as algorithmic if it has uniform sentence lengths, no first person, no admitted opinion, no acknowledged trade-off, no specific sensory detail, and zero tolerated mess. After scrubbing the 24, run the soul check from SKILL.md before declaring the rewrite finished.

## Quick-scan triage

When skimming a long draft, the fastest yield comes from this order:

1. **Group 2 vocabulary** (delve, leverage, robust, seamless) — these are the dead giveaways
2. **Group 3 style** (em-dashes, bolded bullet heads) — visual signature
3. **Group 4 communication** (pleasantries, sycophancy) — opening and closing lines
4. **Group 1 content** (legacy inflation, vague attributions) — usually in the first and last paragraphs
5. **Group 5 filler** (it is important to note, hope this helps) — usually at sentence boundaries

Patterns rarely appear alone. A draft hit by one is usually hit by six.
