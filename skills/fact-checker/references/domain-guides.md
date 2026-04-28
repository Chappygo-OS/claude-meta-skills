# Domain-Specific Fact-Checking Guides

Used by `/fact-checker`. Tailored verification guidance by content domain.

---

## AI & Technology

**Why extra care is needed**: AI/tech evolves rapidly; AI training data is 6–18 months behind; model specs change frequently.

**Always verify**:
- Model names, context windows, parameter counts → official Anthropic/OpenAI/Google docs
- API pricing and rate limits → official pricing pages (change frequently)
- Feature availability (e.g., "supports vision") → current official docs
- Startup funding amounts → Crunchbase, TechCrunch, official press releases
- Acquisition details → SEC filings for public companies, official announcements

**Primary sources**:
- Anthropic: anthropic.com/news, docs.anthropic.com
- OpenAI: openai.com/blog, platform.openai.com/docs
- Google: blog.google, ai.google.dev/docs
- General tech news: TechCrunch, The Verge, Wired (for breaking news); then verify against official sources

**Common errors**:
- Model capability claims ("GPT-4 can do X") — capabilities change with updates
- "The latest model" descriptions — may reference a model that has since been superseded
- Programming language rankings — check TIOBE Index or Stack Overflow survey for current year
- GitHub star counts — snapshot in time; check GitHub directly

---

## Business & Finance

**Why extra care is needed**: Figures change with each earnings report; private company data is often estimated.

**Always verify**:
- Public company financials → SEC EDGAR (10-K, 10-Q filings) for US; Companies House for UK
- Revenue and valuation figures → verify year of the figure; distinguish ARR/MRR from total revenue
- Employee headcount → LinkedIn company pages are roughly current; press releases for announcements
- Acquisition prices → SEC filings, official press releases, Bloomberg/Reuters
- Market size estimates → check the methodology; many "market size" figures are from commissioned reports

**Primary sources**:
- US public companies: SEC EDGAR (sec.gov/edgar)
- UK companies: Companies House (companieshouse.gov.uk)
- Private company data: Crunchbase, PitchBook (estimates only — treat as ballpark)
- Global markets: World Bank, IMF, OECD

**Common errors**:
- Confusing valuation with revenue (a $1B company is not a $1B revenue company)
- Treating funding raised as a proxy for company health
- Using market size figures from 2–3 year old reports as "current"
- Applying US-market statistics to global claims

---

## Science & Health

**Why extra care is needed**: Research is often misrepresented; single studies get overgeneralized; preliminary results get reported as confirmed.

**Always verify**:
- Health claims → PubMed, Cochrane Reviews, NHS, Mayo Clinic, CDC, WHO
- Drug/supplement claims → FDA approvals database, clinical trial registries (clinicaltrials.gov)
- Climate data → IPCC reports, NASA GISS, NOAA
- Statistical claims from studies → check sample size, methodology, p-value, replication status

**Primary sources**:
- Medical: PubMed (pubmed.ncbi.nlm.nih.gov), Cochrane Library
- Clinical trials: clinicaltrials.gov
- FDA: fda.gov/drugs
- Climate: climate.nasa.gov, ipcc.ch
- CDC/WHO: cdc.gov, who.int

**Common errors**:
- "A study found X" — check if it's a single small study or a systematic review/meta-analysis
- Correlation presented as causation (especially common in nutrition and psychology)
- Preliminary results (preprints) presented as peer-reviewed findings
- "Scientists say" or "experts believe" without named sources

---

## Legal & Regulatory

**Why extra care is needed**: Laws and regulations vary by jurisdiction; change frequently; often misinterpreted.

**Always verify**:
- US law → Cornell Law School's LII (law.cornell.edu), official federal/state government sites
- EU law → EUR-Lex (eur-lex.europa.eu)
- GDPR compliance claims → European Data Protection Board guidance
- Copyright/trademark → USPTO (patents, trademarks), US Copyright Office

**Primary sources**:
- US legislation: congress.gov, law.cornell.edu
- EU legislation: eur-lex.europa.eu
- UK legislation: legislation.gov.uk
- Supreme Court opinions: supremecourt.gov

**Common errors**:
- Confusing proposed bills with passed law
- Applying US regulations to international audiences
- "This is legal/illegal" statements that ignore jurisdiction
- Describing historical law that has since changed

---

## History & Dates

**Why extra care is needed**: Dates get rounded, events get conflated, causation gets oversimplified.

**Always verify**:
- Company founding dates → official company website, Crunchbase, or original press coverage
- Product launch dates → official announcements, Wayback Machine for historical web pages
- Historical events → Encyclopedia Britannica for established history; archived newspaper sources for 20th century
- "First X ever" claims → these are frequently wrong; do a targeted search for earlier examples

**Primary sources**:
- Business history: company websites, Crunchbase, official filings
- General history: Encyclopedia Britannica, major news archives
- Internet history: Wayback Machine (web.archive.org)

**Common errors**:
- Off-by-one-year errors in founding dates
- Conflating "first product" with "first version" or "first public launch"
- Attributing an invention to the person who popularized it, not who invented it
- "X was founded in [year]" when the company changed names, merged, or was rebranded

---

## Quick Domain Lookup Table

| Domain | Claim type | Go to first |
|--------|-----------|-------------|
| AI/ML | Model specs | Official vendor docs |
| AI/ML | Startup funding | Crunchbase |
| Business | Public co. financials | SEC EDGAR |
| Business | Market size | Original report methodology |
| Science | Health claims | PubMed + Cochrane |
| Science | Drug approvals | FDA database |
| Law | US regulations | law.cornell.edu |
| Law | EU regulations | EUR-Lex |
| History | Dates/events | Encyclopedia Britannica + news archives |
| Tech specs | Protocol/API | Official specification doc |
