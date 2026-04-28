# Voice Profile Guide

Used by `/humanizer`. How to extract and apply a writing voice profile when humanizing content.

---

## What is a Voice Profile?

A voice profile is a set of observed patterns from someone's real writing that can be used to make AI-generated content sound like them. It's not about copying content — it's about matching the *style* of how they write.

---

## How to Extract a Voice Profile

When a user provides sample text, analyze it across these dimensions:

### 1. Sentence length and rhythm

- Average sentence length (short: < 10 words / medium: 10–20 / long: 20+)
- Rhythm pattern: does the writer vary length deliberately? (short. short. medium. long — pause — short.) Or are they consistently medium?
- Fragment usage: do they use sentence fragments intentionally? ("Right.")
- Questions: do they use rhetorical questions often?

### 2. Person and POV

- First person (I/we) vs. second person (you) vs. third person
- How direct are they with "you"? ("You should..." vs. "One might consider...")
- Do they speak as an individual or as a company/organization?

### 3. Vocabulary level

- Industry jargon: do they use it, or do they explain it?
- Casual vs. formal: do they use contractions? Informal phrases?
- Technical depth: do they get specific or stay conceptual?

### 4. Structural habits

- Do they use bullet points, or do they prefer prose?
- Do they use numbered steps, or narrative description?
- Headers in emails/posts, or flowing paragraphs?
- Do they tend to open with context or jump straight to the point?

### 5. Distinctive phrases or patterns

- Specific words they always or never use
- How they handle transitions (hard cuts, or flowing connectors?)
- How they handle uncertainty ("I think..." vs. "I believe..." vs. stating confidently)
- Closing style: do they end with a question, a call to action, a statement, or a trailing thought?

---

## Voice Profile Template

```
## Voice Profile: [Name / Handle]

**Sentence rhythm**: [Short / Mixed / Long — describe pattern]
**Person**: [First person singular / plural / second person]
**Formality**: [Casual / Professional / Formal]
**Contractions**: [Always / Sometimes / Never]
**Jargon**: [None / Light / Heavy]
**Bullets**: [Avoids / Occasional / Frequent]
**Opening style**: [Context-first / Punch-first / Question-first]
**Closing style**: [Question / CTA / Statement / Open-ended]

**Signature patterns**:
- [Phrase or construction they use frequently]
- [Word they never use]
- [Structural habit]

**Sample sentences that capture their voice**:
- "[example]"
- "[example]"
```

---

## Applying a Voice Profile

When humanizing content with a voice profile:

1. **Read the profile** before making any changes.
2. **Adjust sentence length** to match the profile's rhythm.
3. **Match person**: if they always write in first person, change "businesses can benefit from" to "I saw this work when...".
4. **Add their typical openers**: if they always open with a short punchy statement, restructure the opening.
5. **Replace vocabulary**: if they never use "leverage" and prefer plain English, catch every instance.
6. **Match structural habits**: if they use prose instead of bullets, convert bullet lists to narrative.

---

## Quick Voice Profiles: Common Writer Types

### The Direct Operator
- Short sentences. No filler. States conclusions first, explains after.
- No bullets. Uses "I" frequently. Uses data as proof.
- Never uses: "In today's world", "leverage", "transformative"
- Sample: "We changed the pricing. Churn went up. We changed it back. Here's what we learned."

### The Thoughtful Practitioner
- Longer sentences with measured reasoning. Often uses "but" and "however" to balance.
- Uses "we" more than "I". Asks rhetorical questions to guide the reader.
- Structural: intro → problem → nuance → conclusion
- Sample: "The obvious answer is to hire faster. But speed is how you make your culture worse without noticing."

### The Casual Expert
- Mix of short punchy lines and longer explanations. Uses contractions heavily.
- Talks to the reader directly: lots of "you" and "your".
- Doesn't explain jargon — assumes the reader knows it.
- Sample: "Here's the thing nobody tells you about product-market fit: you don't find it. It finds you. And it usually arrives at an inconvenient moment."

### The Data-First Analyst
- Every claim backed by a specific number. No vague generalities.
- Structured and logical. May use bullets but they're tightly formatted.
- Little humor. Precision over personality.
- Sample: "Q3 NPS: 62. Q4 NPS: 51. The 11-point drop traces to one thing: we changed the onboarding flow in October."
