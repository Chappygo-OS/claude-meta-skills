# AI Hallucination Anti-Patterns

Used by `/fact-checker`. Common patterns of AI-generated false or misleading content. Flag these immediately when spotted.

---

## Pattern 1: The Invented Statistic

**What it looks like**:
> "According to research, 67% of enterprise companies now use AI for customer service."
> "Studies show that the average employee spends 3.2 hours per day on email."

**Why it happens**: AI generates plausible-sounding numbers to fill gaps in its training data. Round numbers or numbers that end in .5 or .2 are especially suspicious.

**How to detect**: Search for the exact statistic in quotes. If you can't find the original study within 2 searches, the number is likely fabricated.

**Red flags**:
- No citation attached to a specific number
- The number is suspiciously precise (3.2 hours, 67.4%)
- The number is suspiciously round (50%, 3x, 70%)
- "According to research" or "studies show" without naming the research

---

## Pattern 2: The Phantom Study

**What it looks like**:
> "A 2022 MIT study found that remote workers are 13% more productive."
> "McKinsey's 2023 Global Survey on AI Adoption found that..."

**Why it happens**: AI generates plausible study metadata (institution, year, finding) by pattern-matching from real studies it has seen.

**How to detect**: Search for the study by institution + year + topic. If the specific study doesn't appear on the institution's website or in academic databases, it doesn't exist.

**Note**: There IS a real Stanford/MIT study on remote work productivity — but the specific numbers, framing, and conclusions are frequently mangled in AI output. Always verify.

---

## Pattern 3: The Fabricated Quote

**What it looks like**:
> "As Elon Musk said, 'The only limit to human achievement is imagination and hard work.'"
> "According to OpenAI CEO Sam Altman, 'We expect AGI by 2026.'"

**Why it happens**: AI generates quotes that sound like they came from someone, based on their known positions and speaking style.

**How to detect**: Search the quote in exact quotes. If it doesn't appear in any primary source, it's fabricated. Even if it sounds exactly like something they'd say, it may never have been said.

**Especially dangerous for**: direct quotes in content that will be read by the quoted person's audience.

---

## Pattern 4: The Outdated Fact Presented as Current

**What it looks like**:
> "Twitter's current monthly active users are 330 million." (pre-X rebrand figure)
> "Python is the third most popular language according to the TIOBE index."

**Why it happens**: AI's training data has a cutoff. It presents the most recent data it has seen as if it's current, even when it's years old.

**How to detect**: Check the claim against the current date. If the topic is something that changes frequently (market share, rankings, company stats, regulatory rules), the AI figure may be outdated.

**Especially dangerous for**: competitive analysis, market sizing, regulatory compliance content.

---

## Pattern 5: The Confident Technical Error

**What it looks like**:
> "OpenAI's GPT-4 uses 1.76 trillion parameters."
> "MCP requires a REST API — it doesn't support WebSockets."
> "The maximum context window for Claude 3 is 100k tokens."

**Why it happens**: AI confidently states technical specifications that were either never confirmed, have changed, or were always wrong.

**How to detect**: For technical specifications, always check the official documentation or the primary source announcement. Do not trust any technical spec from AI output without verification.

---

## Pattern 6: The False Attribution

**What it looks like**:
> "Jeff Bezos famously said in his 2018 shareholder letter, 'Disagree and commit.'" (the phrase is real; the attribution to a specific letter needs verification)
> "The concept of 'product-market fit' was coined by Marc Andreessen." (simplified; the term was popularized by others before him)

**Why it happens**: AI generalizes and simplifies attribution based on who is most commonly associated with a concept or phrase.

**How to detect**: Search for the original source of the concept, phrase, or idea. Wikipedia's citation history is a reasonable starting point.

---

## Pattern 7: The Plausible but Wrong Number

**What it looks like**:
> "Anthropic was founded in 2021." (True)
> "Anthropic has raised over $7 billion in total funding." (May need verification — funding rounds change)
> "Claude 3 Opus has a 200k token context window." (Outdated — newer versions have different specs)

**Why it happens**: AI has partial information and fills in the rest with plausible values.

**How to detect**: These are harder to catch because they're not obviously wrong. Check specific factual claims (dates, amounts, specifications) even when they seem plausible.

---

## Pattern 8: The False Causation

**What it looks like**:
> "Companies that use AI are 40% more profitable — showing that AI adoption drives profit."
> "Countries with higher coffee consumption have higher GDP, proving coffee boosts economic output."

**Why it happens**: AI infers causation from correlation statistics, or generates causal framing without the underlying evidence.

**How to detect**: When a claim involves causation ("proves", "shows that X causes Y", "leads to"), check whether the original source established causation (controlled study) or correlation (survey/observational data).

**Fix**: Replace causal language with correlational language: "are associated with", "are correlated with", "may be related to".

---

## Pattern 9: The Hedged Hallucination

**What it looks like**:
> "While I'm not certain of the exact figure, it's generally understood that around 60% of..."
> "Various reports suggest that approximately..."

**Why it happens**: AI adds hedging language to lower-confidence fabrications, which makes them harder to catch.

**How to detect**: The presence of hedging ("approximately", "around", "generally understood to be") does not mean the claim is real — it may just mean the AI is less certain about its fabrication. Treat hedged statistics with the same skepticism as confident ones.

---

## Priority Checklist for AI-Generated Content

When fact-checking AI output, always check:
- [ ] Every number with a % sign
- [ ] Every study or research citation
- [ ] Every direct quote attributed to a named person
- [ ] Every specific date (founding year, release date, event date)
- [ ] Every technical specification (token limits, API specs, version numbers)
- [ ] Every funding, revenue, or valuation figure
- [ ] Every causal claim ("causes", "proves", "shows that")
