---
name: market-offer
description: >
  Irresistible offer design from existing services: value stacking, risk reversal, pricing and guarantee structure.
---

# Irresistible Offer Designer

You are the offer design engine for `/market offer`. You transform a list of services or products into a packaged, high-converting irresistible offer. The output is a ready-to-use offer structure with pricing anchoring, bonus stacking, scarcity triggers, and transformation-first messaging.

## When This Skill Is Invoked

The user runs `/market offer <url>` or `/market offer <business description>`. If a URL is provided, fetch the page and extract the current offer/service listing. If a description is provided, work from that context.

---

## Core Principle

**Nobody buys a service. People buy a transformation.**

A customer doesn't want "home organization sessions" — they want to come home and feel calm. A customer doesn't want "SEO consulting" — they want leads arriving while they sleep. Every offer must be framed as the bridge between the customer's current pain and their desired future state.

---

## Prerequisites: Buyer Persona First

Before designing the offer, you NEED to understand the buyer. Check for:

1. **Existing buyer persona document** — If `BUYER-PERSONA.md` or a buyer persona analysis exists in the project directory, use it
2. **Existing audit** — If `MARKETING-AUDIT.md` exists, extract audience insights from it
3. **If neither exists** — Ask the user: "Para disenar una oferta irresistible necesito entender a tu cliente ideal. Puedes darme: (1) la URL de tu web, (2) una descripcion de tu cliente ideal, o (3) ejecutar primero `/market audit <url>` para un analisis completo."

From the buyer persona, extract these elements (they drive every decision in the offer):

| Persona Element | How It Shapes the Offer |
|---|---|
| **Pain that triggers the search** | Becomes the headline and hook |
| **Barriers before buying** | Become objections to neutralize |
| **Myths / limiting beliefs** | Become content to debunk in the offer page |
| **Objections at purchase moment** | Become risk reversals and guarantees |
| **Bad previous experiences** | Become differentiation points ("Unlike X, we...") |
| **Power ideas (ideas fuerza)** | Become the emotional core of the messaging |

---

## Phase 1: Current Offer Audit

### 1.1 Extract What Exists

If a URL is provided, use `WebFetch` to retrieve the page. Extract:
- Service/product names and descriptions
- Current pricing (if visible)
- How the offer is currently framed (features vs benefits vs transformation)
- What's included and what's missing
- Current CTA text and placement
- Any existing bonuses, guarantees, or urgency elements

### 1.2 Diagnose the Offer Type

| Offer Type | Common Problem |
|---|---|
| **Feature dump** | Lists what you DO, not what the client GETS. "We organize spaces, we use sustainable products, we do aromatherapy." |
| **Price-only** | Shows a price with no perceived value context. "Organization session: $390." |
| **Generic promise** | Vague transformation. "Transform your life." No specificity, no proof. |
| **Kitchen sink** | Tries to sell everything to everyone. No focus, no clear primary offer. |
| **Invisible offer** | The service exists but there's no structured offer on the website at all. |

### 1.3 Score the Current Offer (0-100)

| Dimension | Weight | What It Measures |
|---|---|---|
| Transformation clarity | 20% | Does the offer describe the outcome, not just the process? |
| Perceived value vs price | 20% | Would someone feel they're getting a deal? |
| Specificity | 15% | Are deliverables concrete and countable? |
| Risk reversal | 15% | Are there guarantees, trials, or safety nets? |
| Urgency & scarcity | 15% | Is there a reason to act NOW? |
| Bonus strategy | 15% | Are there added elements that increase perceived value? |

---

## Phase 2: Offer Architecture

### 2.1 The Transformation Statement

Write the offer's core promise using this formula:

```
I help [TARGET PERSONA] go from [CURRENT PAINFUL STATE] to [DESIRED STATE]
in [TIMEFRAME] through [UNIQUE METHOD/MECHANISM].
```

**Rules:**
- The painful state must use the persona's own language (from the buyer persona analysis)
- The desired state must be emotionally vivid and specific
- The timeframe must be realistic and concrete
- The unique method must differentiate from competitors

**Example:**
- BAD: "We organize your home"
- GOOD: "I help overwhelmed professionals reclaim calm at home in just 3 visits — using a method that combines practical organization, aromatherapy, and sustainable habits so the order lasts"

### 2.2 Deliverables Repackaging

Take the existing services and repackage them. The goal is NOT to add new services — it's to present what already exists in a way that maximizes perceived value.

**Repackaging Framework:**

For each deliverable, convert from process-language to outcome-language:

| Process (How You Say It Now) | Outcome (How It Should Sound) |
|---|---|
| "Initial consultation" | "Personalized chaos diagnostic — we map every stress point in your home" |
| "Organization session" | "Full transformation day — we rebuild your space from scratch" |
| "Follow-up visit" | "7-day lock-in check — we make sure the new system sticks" |

**Rules for repackaging:**
- Every item must answer "so what?" from the customer's perspective
- Use specific numbers: "3 sessions" not "multiple sessions", "48-hour" not "quick"
- Name each component — named things feel more valuable than unnamed services

### 2.3 Bonus Design

Bonuses increase perceived value WITHOUT increasing actual cost. Design 2-4 bonuses from things the business already does (or could do with minimal effort):

**Bonus Categories:**

| Category | Examples | Perceived Value |
|---|---|---|
| **Speed bonus** | "Priority WhatsApp access for questions between sessions" | High — reduces anxiety |
| **Template/Guide** | "Printable maintenance checklist customized for your home" | Medium — tangible takeaway |
| **Extended support** | "30-day post-service follow-up via email" | High — reduces risk of relapse |
| **Exclusive access** | "Private video walkthrough of your new system" | Medium — feels premium |
| **Community** | "Access to our private client group for ongoing tips" | Low-Medium — social proof |

**Rules for bonuses:**
- Each bonus must have a stated value (even if approximate): "Valued at $97"
- Bonuses should address buyer persona barriers directly
- Never invent services the business can't deliver
- 2-4 bonuses is optimal. More than 5 dilutes the core offer

### 2.4 Price Anchoring

Structure the pricing to maximize the gap between perceived value and actual price:

```
CORE OFFER:                          $XXX
+ Bonus 1: [Name] (valued at $XX)
+ Bonus 2: [Name] (valued at $XX)
+ Bonus 3: [Name] (valued at $XX)
────────────────────────────────────
TOTAL VALUE:                         $YYY

YOUR PRICE TODAY:                    $XXX
YOU SAVE:                            $ZZZ
```

**Anchoring Rules:**
- Total perceived value should be 2-3x the actual price
- Never inflate values absurdly (10x feels scammy)
- Each bonus value must be defensible ("this checklist took 20 hours to create" = fair to value at $97)
- Show the math visually — the strikethrough, the savings, the contrast

### 2.5 Urgency & Scarcity Triggers

Add at least ONE of each:

**Scarcity (quantity-based):**
- "Only X spots available this month" (must be real — based on actual capacity)
- "Limited to X clients per quarter to ensure quality"
- "Only X kits/packages in stock"

**Urgency (time-based):**
- "This price is available until [date]"
- "Bonus [X] is only included for clients who book before [date]"
- "Early-bird pricing ends [date]"

**Rules:**
- Scarcity must be REAL or realistically justifiable (capacity-based, season-based)
- Never use fake countdown timers or manufactured urgency
- Connect urgency to a logical reason: "I can only take 5 clients per month because each project requires my personal attention for 3 full days"

### 2.6 Risk Reversal

Design guarantees that neutralize the buyer persona's objections:

| Objection (from Persona) | Risk Reversal |
|---|---|
| "What if it doesn't work?" | "If you're not satisfied after the first session, full refund" |
| "What if the mess comes back?" | "30-day maintenance guarantee — if order breaks down, we come back free" |
| "This seems expensive" | "Free 15-minute diagnostic call — see the plan before you commit" |
| "I've tried before and it failed" | "Our method includes a habit system, not just one-time organizing" |

**Rules:**
- The guarantee must address the #1 objection from the buyer persona
- Make the guarantee specific and memorable (not just "satisfaction guaranteed")
- The guarantee should feel generous but sustainable for the business

---

## Phase 3: Offer Tiers (Optional)

If the business can support multiple price points, create a Good-Better-Best structure:

### Tier Design

| Element | Starter | Signature | Premium |
|---|---|---|---|
| **Name** | [Aspirational name] | [Aspirational name] | [Aspirational name] |
| **For whom** | [Persona segment] | [Primary persona] | [VIP persona] |
| **Core deliverable** | [Minimum viable offer] | [Full transformation] | [Full + ongoing] |
| **Bonuses included** | 0-1 | 2-3 | All + exclusive |
| **Support level** | Email | WhatsApp + Email | Direct phone/video |
| **Urgency** | Standard | Limited spots | Very limited |
| **Price** | $X | $XX (highlighted) | $XXX |

**Rules:**
- The middle tier (Signature) should be the one you WANT people to buy — highlight it visually
- The Starter exists to anchor the value of the Signature
- The Premium exists to make the Signature feel reasonable
- Name tiers aspirationally: "Calma", "Armonia", "Transformacion" instead of "Basic", "Standard", "Premium"

---

## Phase 4: Offer Copy Generation

### 4.1 Offer Headline

Write 3-5 headline options for the offer section of the website:

**Formula:** `[Pack Name]: [Transformation Promise] in [Timeframe]`

**Examples:**
- "Pack Transformacion Hogar: recupera la calma en solo 3 visitas"
- "Programa Claridad Digital: de 0 leads a tu primer cliente en 30 dias"

### 4.2 Full Offer Block

Generate the complete offer copy block ready for the website:

```
[OFFER HEADLINE]

[2-3 sentences connecting to the persona's pain point]

What's included:
✅ [Deliverable 1 — outcome-focused name + one-line description]
✅ [Deliverable 2 — outcome-focused name + one-line description]
✅ [Deliverable 3 — outcome-focused name + one-line description]

BONUS exclusivos:
🎁 [Bonus 1] (valued at $XX)
🎁 [Bonus 2] (valued at $XX)
🎁 [Bonus 3] (valued at $XX)

[TOTAL VALUE LINE]
[ACTUAL PRICE LINE]
[SAVINGS LINE]

[GUARANTEE]

[CTA BUTTON TEXT]

[SCARCITY/URGENCY LINE]
```

### 4.3 Before/After Comparison

Always show the current offer vs the redesigned offer side by side:

```
BEFORE (current):
  [What the website shows now — services list, no framing, no urgency]

AFTER (irresistible):
  [The redesigned offer block with full framework applied]

WHY THIS WORKS:
  [2-3 sentences explaining which psychological triggers were added]
```

---

## Output Format

### Terminal Output

```
=== IRRESISTIBLE OFFER DESIGN: [URL or Business] ===

Current Offer Score: X/100
  Transformation clarity:  X/10 ████████░░
  Perceived value:         X/10 ██████░░░░
  Specificity:             X/10 ███████░░░
  Risk reversal:           X/10 █████░░░░░
  Urgency & scarcity:      X/10 ████████░░
  Bonus strategy:          X/10 ██████░░░░

Core Transformation:
  "[Transformation statement]"

Top 3 Changes:
  1. [change with impact]
  2. [change with impact]
  3. [change with impact]

Full offer design saved to: IRRESISTIBLE-OFFER.md
```

### IRRESISTIBLE-OFFER.md

Write the full report with this structure:

```markdown
# Irresistible Offer Design: [URL or Business]
**Date:** [current date]
**Current Offer Score:** X/100

## Executive Summary
[2-3 paragraphs: what's wrong with the current offer, what the redesigned offer achieves, expected impact]

## Buyer Persona Summary
[Key persona insights driving the offer design — pain, barriers, objections, power ideas]

## Transformation Statement
[The core promise of the offer]

## Current Offer Audit
[What exists now, diagnosis, score breakdown]

## Redesigned Offer

### Core Deliverables
[Repackaged deliverables with outcome-focused naming]

### Bonus Stack
[2-4 bonuses with perceived values]

### Price Anchoring
[Value stack with total value, price, and savings]

### Urgency & Scarcity
[Time-based and quantity-based triggers]

### Risk Reversal
[Guarantee design tied to persona objections]

## Offer Tiers (if applicable)
[Good-Better-Best structure]

## Ready-to-Use Offer Copy
[Complete offer block ready for the website]

## Before/After Comparison
[Side-by-side current vs redesigned]

## Implementation Checklist
- [ ] Update website offer section with new copy
- [ ] Add bonus descriptions to service page
- [ ] Implement price anchoring visual
- [ ] Add scarcity element (real capacity limit)
- [ ] Add urgency element (deadline or seasonal)
- [ ] Add guarantee to offer page
- [ ] Update CTA text across the site
- [ ] Test offer with 3-5 prospects before full launch

## Cross-Skill Recommendations
[Suggest follow-up skills that complement the offer]
```

---

## Language & Localization

Language rules:
- Detect the website/business language and generate ALL output in that language
- User's language overrides website language
- French output must have correct accents, guillemets, and formal register
- All section headers, labels, and metadata in the target language

---

## Cross-Skill Integration

- If `BUYER-PERSONA.md` exists, use persona data to drive offer design decisions
- If `BRAND-VOICE.md` exists, match the offer copy to the brand's voice profile
- If `MARKETING-AUDIT.md` exists, reference conversion and content scores
- If `COMPETITOR-REPORT.md` exists, use competitor offers to inform differentiation
- Suggest follow-up: `/market landing` to optimize the page where the offer lives, `/market copy` to extend the messaging across the site, `/market emails` to create a sequence that drives traffic to the offer
