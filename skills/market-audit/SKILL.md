---
name: market-audit
description: >
  Full marketing audit of a website. Launches 5 parallel subagents (copywriting, SEO, competitors, brand, funnel) and aggregates them into a scored, prioritized, client-ready MARKETING-AUDIT.md.
---

# Marketing Audit Orchestrator

You are the full marketing audit engine for `/market audit <url>`. You launch 5 parallel subagents, aggregate their results, and produce a unified MARKETING-AUDIT.md report that is client-ready and revenue-focused.

## When This Skill Is Invoked

The user runs `/market audit <url>`. This is the flagship command of the entire suite. It produces the most comprehensive deliverable: a scored, prioritized, actionable marketing audit.

---

## Phase 1: Discovery (Pre-Analysis)

Before launching subagents, perform these discovery steps:

### 1.1 Fetch the Target URL

Use `WebFetch` to retrieve the homepage and up to 5 key interior pages (pricing, about, product/features, blog, contact). Store raw content for subagent consumption.

### 1.2 Detect Business Type

Classify the business into one of these categories. This classification shapes every subagent's analysis focus:

| Business Type | Detection Signals | Analysis Focus |
|---------------|-------------------|----------------|
| **SaaS/Software** | Free trial CTA, pricing tiers, feature pages, "login" link, API docs | Trial-to-paid conversion, onboarding, feature differentiation, churn signals |
| **E-commerce** | Product listings, cart, checkout, product categories, reviews | Product pages, cart abandonment, upsells, reviews, AOV optimization |
| **Agency/Services** | Case studies, portfolio, "work with us", testimonials, contact forms | Trust signals, case studies, positioning, lead qualification |
| **Local Business** | Address, phone number, hours, "near me", Google Maps embed | Local SEO, Google Business Profile, reviews, NAP consistency |
| **Creator/Course** | Lead magnets, email capture, course listings, community links | Email capture rate, funnel design, testimonials, content quality |
| **Marketplace** | Two-sided messaging, buyer/seller flows, listing pages | Supply/demand balance, trust mechanisms, network effects |

### 1.3 Identify Key Pages

Map the site architecture to identify:
- Homepage
- Primary landing pages
- Pricing page (if exists)
- Product/feature pages
- About/team page
- Blog/content hub
- Contact/signup/trial page
- Legal pages (privacy, terms)

Store this page map for all subagents to reference.

### 1.4 Buyer Persona Inference

Before launching subagents, build a preliminary buyer persona from the website itself. This persona drives every subagent's analysis — without it, recommendations are generic.

**Extract from the website:**
- Who the site is talking to (pronouns, imagery, language level, industry jargon)
- What pain triggers the search for this product/service
- What barriers exist before buying (price, trust, complexity, time)
- What myths or limiting beliefs the target audience might have
- What objections appear at purchase moment (look for FAQ, guarantee language, "why us" sections)
- What bad previous experiences the audience may have had (look for "unlike other...", "no more...", differentiation language)
- What power ideas (ideas fuerza) resonate — the emotional core the brand uses (e.g., "calm", "freedom", "control")

**Document as a Persona Summary Table:**

| Element | Finding |
|---|---|
| **Who they are** | [demographics, role, life situation inferred from site language] |
| **Pain that triggers search** | [the problem that makes them look for this solution] |
| **Barriers before buying** | [what stops them from deciding: price, trust, complexity] |
| **Myths / limiting beliefs** | [false assumptions: "it won't last", "I can do it myself", "it's a luxury"] |
| **Objections at purchase** | [last-minute doubts: "too expensive", "what if it doesn't work"] |
| **Bad previous experiences** | [past failures: "I tried X and it failed", "agencies overpromise"] |
| **Power ideas** | [emotional triggers: calm, control, freedom, growth, security] |

This persona summary is passed to ALL subagents and included in the final report. It also becomes the foundation for follow-up skills like `/market offer` and `/market copy`.

If a `BUYER-PERSONA.md` already exists in the project directory, use it instead of inferring.

### 1.5 Strategic Hypotheses Detection

Inspect the engagement context (user brief, existing files in the client directory like `brief/`, `SYNTHESE-COMPARATIVE-HYPOTHESES.md`, `etude-marche/hypothese-*/`, README mentions, or signals on the site itself) for **strategic forks the client is evaluating**. Typical patterns:

- Two or more positioning niches under arbitration (e.g., cabinets médicaux vs espaces atypiques HNW)
- Rebrand decision (current brand vs new positioning, e.g., BienTaypa → Lima)
- Upmarket vs current-market positioning
- B2B vs B2C focus
- Geographic expansion options
- Pricing model fork (subscription vs one-shot, freemium vs paid)

**When at least one strategic hypothesis is identified, the audit MUST include a "Strategic Hypotheses" section in the report:**

1. List each hypothesis explicitly with its underlying premise
2. For each hypothesis, surface the **implicit assumptions** the client is making (use the `identify-assumptions` skill from `~/.claude/skills/identify-assumptions/` if installed — devil's-advocate analysis from PM/Designer/Engineer perspectives)
3. **Recommend a pre-mortem** on the leading hypothesis before resource commitment (use the `pre-mortem` skill from `~/.claude/skills/pre-mortem/` — Tiger / Paper Tiger / Elephant classification)
4. Where two or more hypotheses are roughly equivalent, recommend `brainstorm-experiments` (from `~/.claude/skills/brainstorm-experiments/`) to design cheap validation tests (pretotyping, fake-door, smoke test) before committing the client's budget

If no strategic hypotheses exist (standard audit for a single, settled positioning), skip this phase silently — do not invent forks where there are none.

---

## Phase 2: Analysis (Parallel Subagent Execution)

Launch all 5 subagents simultaneously using Claude Code's subagent capability. Each subagent receives the business type, page map, and fetched content.

### Subagent 1: market-content

**Focus:** Content quality, messaging clarity, copy effectiveness

Evaluates:
- Headline clarity and specificity (does it pass the 5-second test?)
- Value proposition strength (is the unique value immediately obvious?)
- Body copy persuasion (does it speak to pain points and desired outcomes?)
- Social proof quality (testimonials, logos, case studies, numbers)
- Content depth and authority (blog quality, thought leadership)
- Brand voice consistency across pages

**Scores:** Content & Messaging (0-100)

### Subagent 2: market-conversion

**Focus:** CRO, funnels, landing pages, signup flows

Evaluates:
- CTA effectiveness (clarity, placement, contrast, urgency)
- Form friction (number of fields, progressive disclosure, inline validation)
- Page layout and visual hierarchy (does the eye flow toward conversion?)
- Trust signals near conversion points (guarantees, security badges, testimonials)
- Mobile conversion experience
- Signup/checkout flow steps and drop-off risk
- Pricing page effectiveness (anchoring, packaging, FAQ)

**Scores:** Conversion Optimization (0-100)

### Subagent 3: market-competitive

**Focus:** Competitive positioning, market landscape

Evaluates:
- Unique positioning clarity (how differentiated is the messaging?)
- Competitor awareness signals (comparison pages, "vs" pages, alternatives pages)
- Market category definition (are they creating or joining a category?)
- Pricing relative to likely competitors
- Feature differentiation signals
- Review/reputation presence on third-party sites

**Scores:** Competitive Positioning (0-100)

### Subagent 4: market-technical

**Focus:** Technical SEO, site architecture, page speed

Evaluates:
- Title tags, meta descriptions, header hierarchy
- URL structure and internal linking
- Image optimization (alt tags, file sizes, modern formats)
- Mobile responsiveness
- Page load speed indicators (DOM size, resource count, render-blocking)
- Schema markup / structured data
- Sitemap and robots.txt
- Core Web Vitals signals (where detectable)
- Accessibility basics (contrast, form labels, skip navigation)

**Scores:** SEO & Discoverability (0-100)

### Subagent 5: market-strategy

**Focus:** Overall strategy, pricing, growth opportunities

Evaluates:
- Business model clarity
- Pricing strategy (value-based, competitor-based, cost-plus)
- Growth loops (referral, viral, content, sales-led)
- Retention signals (loyalty programs, community, email nurture)
- Expansion revenue opportunities (upsells, cross-sells, tiers)
- Market timing and trends alignment
- Brand trust signals (about page, team, mission, social proof depth)

**Scores:** Brand & Trust (0-100), Growth & Strategy (0-100)

---

## Phase 3: Synthesis (Aggregation and Scoring)

### 3.1 Scoring Methodology

Compute the composite Marketing Score using weighted averages:

```
Marketing Score = (
    Content_Score      * 0.25 +
    Conversion_Score   * 0.20 +
    SEO_Score          * 0.20 +
    Competitive_Score  * 0.15 +
    Brand_Score        * 0.10 +
    Growth_Score       * 0.10
)
```

**Score interpretation:**
| Score Range | Grade | Meaning |
|-------------|-------|---------|
| 85-100 | A | Excellent — minor optimizations only |
| 70-84 | B | Good — clear opportunities for improvement |
| 55-69 | C | Average — significant gaps to address |
| 40-54 | D | Below average — major overhaul needed |
| 0-39 | F | Critical — fundamental marketing issues |

### 3.2 Aggregate Recommendations

Collect all recommendations from subagents and classify them:

**Quick Wins** (implement in < 1 week, low effort, high impact):
- Copy changes to headlines and CTAs
- Adding missing meta descriptions
- Adding trust signals near CTAs
- Fixing broken links or images
- Adding urgency or social proof

**Strategic Recommendations** (1-4 weeks, medium effort, high impact):
- Redesigning pricing page
- Building comparison/alternatives pages
- Creating lead magnets or content upgrades
- Email sequence implementation
- Landing page A/B test designs

**Long-Term Initiatives** (1-3 months, high effort, transformative impact):
- Content marketing strategy overhaul
- SEO content gap campaign
- Funnel redesign
- Brand repositioning
- New growth channel development

### 3.3 Revenue Impact Estimates

For each recommendation, estimate the revenue impact:

```
Revenue Impact Formula:
  Current Monthly Traffic x Conversion Rate Improvement x Average Deal Value
  = Estimated Monthly Revenue Lift

Example:
  10,000 visitors x 0.5% conversion lift x $99 ARPU = $4,950/month
```

Provide conservative, moderate, and aggressive estimates where possible. Use these qualifiers:

| Impact Level | Monthly Revenue Lift | Confidence |
|-------------|---------------------|------------|
| High Impact | >$5,000/mo or >20% improvement | Based on clear evidence from audit |
| Medium Impact | $1,000-$5,000/mo or 5-20% improvement | Based on industry benchmarks |
| Low Impact | <$1,000/mo or <5% improvement | Incremental optimization |

### 3.4 Competitor Comparison Table

If the competitive subagent identified competitors, include a comparison:

```markdown
| Factor | [Target] | Competitor A | Competitor B | Competitor C |
|--------|----------|-------------|-------------|-------------|
| Headline Clarity | 6/10 | 8/10 | 5/10 | 7/10 |
| Value Prop Strength | 5/10 | 7/10 | 6/10 | 8/10 |
| Trust Signals | 7/10 | 9/10 | 4/10 | 6/10 |
| CTA Effectiveness | 4/10 | 8/10 | 6/10 | 7/10 |
| Pricing Clarity | 6/10 | 7/10 | 8/10 | 5/10 |
| Content Depth | 5/10 | 9/10 | 3/10 | 6/10 |
```

---

## Output Format: MARKETING-AUDIT.md

Write the final report to `MARKETING-AUDIT.md` in the current directory with this structure:

```markdown
# Marketing Audit: [Business Name]
**URL:** [url]
**Date:** [current date]
**Business Type:** [detected type]
**Overall Marketing Score: [X]/100 (Grade: [letter])**

---

## Executive Summary

[3-5 paragraph summary for a non-technical stakeholder. Lead with the score,
highlight the biggest strength, the biggest gap, and the top 3 actions
that would move the needle most. Include estimated revenue impact of
implementing all recommendations.]

---

## Score Breakdown

| Category | Score | Weight | Weighted Score | Key Finding |
|----------|-------|--------|---------------|-------------|
| Content & Messaging | X/100 | 25% | X | [one-line finding] |
| Conversion Optimization | X/100 | 20% | X | [one-line finding] |
| SEO & Discoverability | X/100 | 20% | X | [one-line finding] |
| Competitive Positioning | X/100 | 15% | X | [one-line finding] |
| Brand & Trust | X/100 | 10% | X | [one-line finding] |
| Growth & Strategy | X/100 | 10% | X | [one-line finding] |
| **TOTAL** | | **100%** | **X/100** | |

---

## Quick Wins (This Week)

[Numbered list of 5-10 quick wins with specific implementation steps.
Each should include: what to change, where to change it, why it matters,
and estimated impact.]

## Strategic Recommendations (This Month)

[Numbered list of 3-7 strategic recommendations with rationale,
implementation steps, and expected outcomes.]

## Long-Term Initiatives (This Quarter)

[Numbered list of 2-5 long-term initiatives with business case,
resource requirements, and projected ROI.]

---

## Buyer Persona Summary

[Persona summary table from Phase 1.4 — who the site targets, pain triggers,
barriers, myths, objections, bad experiences, and power ideas.
This section informs all recommendations below.]

---

## Strategic Hypotheses

*Include this section ONLY if Phase 1.5 detected strategic forks. Otherwise omit entirely.*

| # | Hypothesis | Underlying Premise | Implicit Assumptions | Recommended Validation Path |
|---|---|---|---|---|
| H1 | [e.g., target medical practices] | [why this could work] | [list 3-5 hidden assumptions] | Pre-mortem + 2-3 cheap experiments |
| H2 | [e.g., target HNW atypical spaces] | [why this could work] | [list 3-5 hidden assumptions] | Pre-mortem + 2-3 cheap experiments |

**Next-step recommendation:** Run `pre-mortem` on the leading hypothesis before commitment, and `brainstorm-experiments` to design 1-2 validation tests per hypothesis. Both skills are installed at `~/.claude/skills/`.

---

## Detailed Analysis by Category

### Content & Messaging Analysis
[Full findings from market-content subagent]

### Conversion Optimization Analysis
[Full findings from market-conversion subagent]

### SEO & Discoverability Analysis
[Full findings from market-technical subagent]

### Competitive Positioning Analysis
[Full findings from market-competitive subagent]

### Brand & Trust Analysis
[Full findings from market-strategy subagent — brand section]

### Growth & Strategy Analysis
[Full findings from market-strategy subagent — growth section]

---

## Competitor Comparison

[Comparison table from Section 3.4]

---

## Revenue Impact Summary

| Recommendation | Est. Monthly Impact | Confidence | Timeline |
|---------------|-------------------|------------|----------|
| [recommendation 1] | $X,XXX | High/Med/Low | X weeks |
| [recommendation 2] | $X,XXX | High/Med/Low | X weeks |
| ... | | | |
| **Total Potential** | **$XX,XXX/mo** | | |

---

## Next Steps

1. [Most critical action item]
2. [Second priority]
3. [Third priority]

*Generated by AI Marketing Suite — `/market audit`*
```

---

## Terminal Output

In addition to the file, display a condensed summary in the terminal:

```
=== MARKETING AUDIT COMPLETE ===

Business: [name] ([type])
URL: [url]
Marketing Score: [X]/100 (Grade: [letter])

Score Breakdown:
  Content & Messaging:     [XX]/100 ████████░░
  Conversion Optimization: [XX]/100 ██████░░░░
  SEO & Discoverability:   [XX]/100 ███████░░░
  Competitive Positioning: [XX]/100 █████░░░░░
  Brand & Trust:           [XX]/100 ████████░░
  Growth & Strategy:       [XX]/100 ██████░░░░

Top 3 Quick Wins:
  1. [win]
  2. [win]
  3. [win]

Top 3 Strategic Moves:
  1. [move]
  2. [move]
  3. [move]

Estimated Revenue Impact: $X,XXX-$XX,XXX/month

Full report saved to: MARKETING-AUDIT.md
```

---

## Error Handling

- If the URL is unreachable, report the error and suggest checking the URL
- If a subagent fails, continue with remaining subagents and note the gap in the report
- If the site is behind authentication, note what was accessible and recommend manual review for gated content
- If the site has very little content (single page), adapt the analysis accordingly and note limited scope

## Cross-Skill Integration

- If `COMPETITOR-REPORT.md` exists in the current directory, incorporate its findings
- If `BRAND-VOICE.md` exists, use it to contextualize content analysis
- Reference other available analyses in the executive summary
- Suggest follow-up commands: `/market offer` to design an irresistible offer based on the persona, `/market copy` for page-specific copy, `/market funnel` for journey + funnel analysis, `/market competitors` for deeper competitive dives

### Post-Audit Discovery Pipeline (when applicable)

At the end of every audit, in the "Next Steps" section, also recommend the relevant discovery skills installed at `~/.claude/skills/`:

| Trigger in the audit | Recommended discovery skill | What it does |
|---|---|---|
| Strategic hypotheses present (Phase 1.5) | `identify-assumptions` → `pre-mortem` → `brainstorm-experiments` | Surface assumptions, stress-test the leading bet, design cheap validation tests |
| Audit surfaces multiple opportunity areas without a clear winner | `brainstorm-ideas` | Product Trio + Opportunity Solution Tree to generate and prioritize options |
| High-stakes launch or rebrand on the roadmap | `pre-mortem` on the plan before client sign-off | Tiger / Paper Tiger / Elephant risk classification |
| Client wants to test an offer angle, headline, or channel cheaply | `brainstorm-experiments` | Pretotyping, fake-door, smoke test designs |

These skills are NOT triggered automatically — they are listed as concrete next steps the user can invoke. Frame them as "before committing budget, validate cheaply" — anchored to the audit findings, not generic advice.
