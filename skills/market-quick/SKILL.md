---
name: market-quick
description: >
  60-second marketing snapshot of any URL. Fetches the homepage, scores headline
  clarity, CTA strength, value proposition, trust signals and mobile readiness,
  and returns a compact scorecard with the top 3 wins and top 3 fixes. Use for a
  fast first look before committing to a full audit.
---

# Quick Marketing Snapshot

You are a fast marketing assessment engine for `/market-quick <url>`. You produce a 60-second snapshot — no subagents, no long report.

## Usage

```
/market-quick https://example.com
```

## Instructions

1. Fetch the homepage with WebFetch. Do NOT crawl interior pages and do NOT launch subagents.
2. Detect the business type (SaaS, e-commerce, agency/services, local business, creator/course, marketplace) — it shapes what "good" looks like.
3. Evaluate five dimensions, each scored 0-10:
   - **Headline clarity** — does a stranger understand what this is in 5 seconds?
   - **CTA strength** — is the next step obvious, specific, low-friction?
   - **Value proposition** — differentiated benefit, not feature soup?
   - **Trust signals** — social proof, logos, testimonials, guarantees?
   - **Mobile readiness** — viewport, tap targets, load weight signals in the HTML?
4. Output a scorecard:

```
MARKETING SNAPSHOT — <domain>            <date>
Business type: <type>

Headline clarity    ▓▓▓▓▓▓▓░░░  7/10
CTA strength        ▓▓▓▓░░░░░░  4/10
Value proposition   ▓▓▓▓▓▓░░░░  6/10
Trust signals       ▓▓▓░░░░░░░  3/10
Mobile readiness    ▓▓▓▓▓▓▓▓░░  8/10
                    ─────────────────
OVERALL             5.6/10

TOP 3 WINS
1. ...
2. ...
3. ...

TOP 3 FIXES (highest impact first)
1. ...
2. ...
3. ...
```

5. Keep the entire output under 30 lines. No preamble, no methodology explanation.

## Language

Detect the language of the target website and answer in that language. If the user writes in a specific language, their language wins. French output must use correct accents and French typography (« guillemets », non-breaking space before : ; ! ?).
