# Fact-checker source hierarchy

This file is loaded on demand when SKILL.md needs the full six-tier source quality hierarchy. The hierarchy is the backbone of the verdict scale: a claim sourced only at tiers 5–6 cannot earn TRUE, and one tier-1 source typically outranks ten tier-6 sources. Each tier section explains what counts, when to be skeptical even at that tier, and concrete examples.

## Tier 1 — Peer-reviewed studies and meta-analyses

**What counts**

- Articles in indexed peer-reviewed journals (PubMed, Web of Science, Scopus)
- Cochrane reviews, Campbell Collaboration reviews, and other registered systematic reviews
- Replication studies that explicitly attempt to reproduce a published finding
- Pre-registered studies (registered hypotheses and analysis plans before data collection)

**When to be skeptical**

- Single studies, especially with small n or no replication
- Journals with low or absent peer review (predatory journals)
- Industry-funded research without disclosed conflicts of interest
- Findings that have failed replication elsewhere — the original peer-reviewed status doesn't make a non-replicating result true
- Pre-prints (not yet peer-reviewed) — usable, but tag clearly

**Examples**

- A 2023 randomized controlled trial in *NEJM*
- A Cochrane meta-analysis of cognitive behavioral therapy for chronic pain
- A pre-registered economics field experiment published in the *AER*

## Tier 2 — Official government statistics and regulatory filings

**What counts**

- National statistical agencies (BLS, BEA, Census Bureau, Statistics Canada, Eurostat, ONS, ABS)
- Central bank publications (Federal Reserve, ECB, BoE, BoJ, RBA)
- Regulatory filings (SEC 10-K / 10-Q, EDGAR full text, FDA labels and reviews, EPA registries)
- Court records and dockets
- WHO, OECD, IMF, World Bank datasets

**When to be skeptical**

- Some governments publish strategically — be wary of single-source national stats from regimes with documented data manipulation
- Regulatory filings can hide nuance in footnotes; read the footnotes
- Data quality varies by program and year; check the methodology page

**Examples**

- BLS Business Employment Dynamics for startup failure rates
- A company's 10-K filing for revenue and segment data
- The FDA drug label for indicated uses and safety warnings

## Tier 3 — Reputable fact-checked news with editorial accountability

**What counts**

- Outlets with named editors, published corrections policies, and a track record of correcting errors
- Specialty desks (e.g., a science desk staffed by reporters with science backgrounds)
- Investigative reporting with documented sourcing
- Beat reporters with subject-matter expertise

**When to be skeptical**

- Even reputable outlets are weaker outside their core beat — a politics reporter's science take is closer to tier 5
- Headlines are often written by editors, not reporters; read the body
- Embargoed press-release journalism without independent verification leans tier 5
- Op-eds and analysis pieces are not the same as reporting

**Examples**

- *Reuters* or *AP* wire reporting on a court ruling
- *The Atlantic* science desk on a public-health study
- *FT*, *WSJ*, or *Bloomberg* on a regulatory filing they read directly

## Tier 4 — In-domain expert statements

**What counts**

- Named, credentialed experts speaking on the record about their own field
- University professors with publication records in the specific topic
- Senior practitioners with documented experience (a 20-year cardiologist on cardiology, an SEC-registered investment advisor on securities law)

**When to be skeptical**

- Expertise is domain-bound. A renowned physicist is a tier 5 source on epidemiology.
- Single-expert opinion is not the same as scientific consensus
- Conflicts of interest must be disclosed and weighted (paid consultants, board memberships)
- "Adjacent expertise" is the most common failure — a tier 1 expert in field A becomes tier 5 in field B

**Examples**

- An infectious disease specialist quoted on a vaccine question (tier 4)
- That same specialist quoted on monetary policy (tier 5)
- An ex-FBI agent quoted on a current FBI investigation (tier 4 if recent; closer to 5 if their tenure ended a decade ago)

## Tier 5 — General news outlets without specialty desks

**What counts**

- Local newspapers and TV stations
- General-interest magazines and websites
- News aggregators that summarize without independent reporting
- Broadcast morning shows and lifestyle outlets

**When to be skeptical**

- Default skepticism. These outlets are often syndicating wire content with their own headline spin.
- Lifestyle and morning-show coverage of science is reliably oversimplified
- "Studies show" without naming the study is a tier 6 signal masquerading as tier 5

**Examples**

- A local TV station summarizing a national health story
- A general-interest blog citing "a recent study" without a link
- A morning show citing "doctors recommend" without naming the doctors

## Tier 6 — Social media, anonymous blogs, AI summaries

**What counts**

- Twitter/X, LinkedIn, TikTok, Instagram, Reddit posts
- Anonymous Substacks, Medium posts, personal blogs
- AI chatbot output without primary citations
- Screenshots of headlines without links to source articles

**When to be skeptical**

- Always. Tier 6 is not a source — it's a *pointer to a source*. Click through.
- Verified accounts are not credentialed accounts. Verification just means the account paid for a checkmark.
- A million retweets does not move a tier 6 claim up the hierarchy.
- AI summaries hallucinate. Treat them as unverified pointers until the underlying source is found.

**Examples**

- A viral LinkedIn post citing a "study" with no link
- A tweet summarizing a paper inaccurately
- A ChatGPT response citing a fabricated paper title

## Cross-tier rules

### The 1-vs-10 rule

A single tier-1 source typically outranks ten tier-6 sources. Volume of low-quality citations is not evidence — it's amplification.

### The two-source convergence rule

Before assigning TRUE or FALSE on a non-trivial claim, cross-reference at least two independent sources at tier 1–3. "Independent" means they are not citing each other or a common upstream source — two outlets summarizing the same press release count as one source.

### The recency rule

A 2019 stat about office work is a different claim today than it was in 2019. When evaluating recency:

- Tier 1 and tier 2 sources can hold for years to decades depending on topic
- Tier 3 reporting decays in months for fast-moving stories
- Tier 4 expert statements should be timestamped — what an expert said in 2018 about COVID isn't what they'd say today

### The context rule

Read the surrounding paragraph, not just the highlighted sentence. Statistical and statistical-sounding claims are routinely stripped of qualifiers ("up to", "in some cases", "among adults aged 18-44") that change the meaning.

## Tier-to-rating ceilings

| Highest tier in the evidence pile | Maximum rating possible |
|---|---|
| Tier 1 with convergence (2+ studies) | TRUE |
| Tier 1 single source, or tier 2 + tier 3 | MOSTLY TRUE |
| Tier 3 only | MOSTLY TRUE (with caveats) |
| Tier 4 only | MIXED at best — single expert opinion |
| Tier 5 only | UNVERIFIABLE |
| Tier 6 only | UNVERIFIABLE — and surface that explicitly |

This ceiling is conservative on purpose. Climbing the hierarchy takes work; rating a claim requires that work to have been done.
