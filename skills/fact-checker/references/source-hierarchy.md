# Source Hierarchy Reference

Used by `/fact-checker`. How to rank and evaluate sources when verifying factual claims.

---

## Source Tiers

### Tier 1 — Primary Sources (most authoritative)

Use these whenever available. They are the original source of truth.

- **Official company announcements**: press releases, investor relations pages, earnings calls, official blogs
- **Government and regulatory databases**: SEC filings, census data, official statistics agencies (Bureau of Labor Statistics, Eurostat, etc.)
- **Peer-reviewed research**: published academic papers, clinical trial registries, systematic reviews
- **Official documentation**: API docs, RFC specifications, official technical standards (IETF, ISO, W3C)
- **Legal documents**: contracts, court filings, patents (via Google Patents, USPTO, EUIPO)
- **Direct statements**: interviews where the person is speaking directly, not paraphrased

### Tier 2 — High-Quality Secondary Sources

Use when Tier 1 is not available or to cross-reference.

- Major news organizations with editorial standards and correction policies (NYT, WSJ, FT, Reuters, AP, Bloomberg)
- Industry analysts with transparent methodology (Gartner, Forrester, IDC — when their methodology is cited)
- Wikipedia (for widely established facts only — treat as a starting point, not an endpoint; check its cited sources)
- Non-profit research organizations with published methodology
- Official interviews quoted in reputable outlets

### Tier 3 — Medium-Quality Sources (use with caution)

These require cross-referencing against higher tiers.

- Trade publications and industry blogs
- Company-sponsored research (may have selection bias)
- Analyst reports without disclosed methodology
- News aggregators and newsletters

### Tier 4 — Low-Quality or Unreliable Sources (do not cite as proof)

- Social media posts (even from verified accounts, unless it's the person's official statement)
- AI-generated content (circular verification: don't use AI output to verify AI output)
- Anonymous blog posts, forums, Reddit threads
- Sites with no named author or publication date
- Aggregator articles that cite other aggregators with no original source

---

## How to Evaluate a Source

### Freshness

- Check the publication date. For fast-moving topics (AI, tech, startups, policy), anything older than 12 months may be outdated.
- Look for update dates on stats pages — "updated quarterly" vs. "last updated 2019" matters.
- For statistics, verify the reference period (e.g., "50% of marketers use AI" — what year? What sample?)

### Methodology

For statistics and research claims:
- Who conducted the study? (Independent or commissioned by an interested party?)
- What was the sample size? (n < 100 is usually not generalizable)
- How was the sample selected? (Random sample vs. self-selected survey respondents)
- What is the margin of error?
- Is the methodology section publicly available?

### Independence

- Cross-reference claims across sources that are independent of each other (not citing the same original source).
- If Source B cites Source A and Source C also cites Source A — you have one source, not two.
- Track the source chain: often viral statistics trace back to a single, methodologically weak study.

### Conflict of Interest

- Was the research funded by a company with a stake in the outcome?
- Is the author writing for a publication that profits from a particular finding?
- Funded research isn't automatically wrong, but the conflict should be disclosed and noted.

---

## Special Verification Cases

### Quotes attributed to real people

- Find the original context (speech, interview, article, book)
- Verify the exact wording — misquotes and condensed quotes are extremely common
- Check that the quote is not taken out of context
- If you cannot find the primary source: mark as ❓ Unverifiable, not ✅ True

### Statistics with no citation

Common pattern in AI-generated content: "Studies show that 73% of X do Y."

Steps:
1. Search the exact number in quotes: "73% of X do Y"
2. Find the original study if cited anywhere
3. Verify the study exists, the methodology is sound, and the number is accurately reported
4. If no original study can be found: ❌ Unverifiable or ❌ Fabricated — do not use

### Technical assertions about APIs, software, protocols

- Always check the official documentation directly
- AI training data for technical facts can be 6–24 months behind
- For version-specific claims: verify the version the claim applies to
- For "X uses Y protocol" claims: verify in the official spec or source code if needed

### Historical dates and events

- For business events (funding rounds, launches, acquisitions): check Crunchbase, PitchBook, or the company's own press releases
- For tech history: Wikipedia is usually reliable for established events, but check the cited sources for specific dates
- For recent events (< 2 years): news archives are more reliable than encyclopedias

---

## Source Hygiene for AI-Generated Content

When checking AI-generated text specifically, prioritize:

1. **Any statistic** — AI invents numbers with high confidence
2. **Any named study** — AI invents study titles and authors
3. **Any quote** — AI invents quotes and misattributes real quotes
4. **Any specific date or year** — AI confuses and invents dates
5. **Any recent event** — AI's training data cutoff means recent facts are often wrong or missing

The rule: if Claude (or any AI) wrote it, treat every specific claim as unverified until proven otherwise.
