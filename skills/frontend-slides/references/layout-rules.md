# Slide Layout Rules

Used by `/frontend-slides`. Detailed specifications per slide type.

---

## Universal Rules (apply to every slide)

1. **One idea per slide** — if you're writing two sentences that make different points, split the slide.
2. **Title: 5–7 words** — specific claim, not a category label. "Revenue grew 3x YoY" not "Revenue Results".
3. **No more than 3 bullets** — if you need 4+, the slide needs restructuring.
4. **Visuals beat text** — a diagram communicates faster than bullets. Prefer diagrams when explaining a process, relationship, or comparison.
5. **Whitespace is not waste** — a slide with too much content is a slide that communicates nothing.
6. **Progress indicator** — show slide number (X/N) or a thin top bar on every slide except the title.

---

## Slide Types and Specs

### Title Slide

**Purpose**: Hook the audience. Establish the topic in one bold claim.

**Layout**:
- Centered layout OR left-aligned with visual on the right
- 1 large headline (60–80px) — the key claim or question
- 1 subtitle line (24px) — optional context or date
- Logo top-left OR centered below title
- No bullets, no body text

**Common mistake**: Making the title too descriptive ("Q3 Product Update") instead of compelling ("We shipped 3 features in 30 days. Here's what changed.").

---

### Problem / Context Slide

**Purpose**: Establish why this topic matters to this audience.

**Layout**:
- Headline: the problem in one line
- Body: 2–3 bullets OR a single paragraph (max 60 words)
- Optional: a supporting stat in large type (48px) as a visual anchor
- Left or center aligned

**Formula**: "X happens → it causes Y → that costs Z"

---

### Data / Stats Slide

**Purpose**: Make one number land. Not five numbers — one.

**Layout — single stat**:
- Large central number (80–120px) in accent color
- Short descriptor above (20px): "Year-over-year growth"
- Short context line below (18px): "vs. 12% industry average"

**Layout — comparison (2–3 numbers)**:
- Side by side columns, equal width
- Each column: large number, short label, optional icon
- Visual hierarchy: highlight the number you want them to remember

**Do not**: create a data table on a slide. If the data needs a table, send the data separately.

---

### Process / Flow Slide

**Purpose**: Show how something works step by step.

**Layout**:
- Horizontal arrows for 3–5 linear steps (each step: icon + 2-word label)
- Vertical steps for 3–4 stages that build on each other
- For complex flows: use a simplified diagram, not a full flowchart
- Keep labels to 2–4 words per node

**Avoid**: cramming a 10-step process into one slide. Group steps into 3–4 phases.

---

### Before / After Slide

**Purpose**: Show transformation or improvement.

**Layout**:
- Two columns: Before (left, muted color or gray) / After (right, accent color)
- Or: Two slides in sequence (transition creates the "after" effect visually)
- Use identical structure for both sides so the change is immediately obvious

---

### Quote Slide

**Purpose**: Let a customer, expert, or trusted voice make the point.

**Layout**:
- Quote: large (32–48px), left-aligned, no quotation marks (use visual styling instead)
- Attribution: small (18px) below — Name, Title, Company
- Optional: headshot photo right-aligned
- Background: slightly off from base background to distinguish it

**Keep quotes short** — max 30 words. If the full quote is longer, extract the punchiest sentence.

---

### Team / People Slide

**Purpose**: Introduce the people behind the work.

**Layout — 2–4 people**:
- Horizontal row of headshots (circular crop, 120–160px diameter)
- Name below headshot (18px bold)
- Title below name (16px, muted)

**Layout — 5–8 people**:
- 2-row grid
- Smaller headshots (80–100px)
- Name + title inline or below

**Avoid**: giant team grids with 20+ people. Pick the 4–6 most relevant to the audience.

---

### Call to Action (CTA) Slide

**Purpose**: Tell the audience exactly what to do next. One action, not three.

**Layout**:
- Bold headline: the action (imperative verb — "Book a call", "Sign up", "Download the report")
- Single line of supporting context (why now, what they get)
- Contact info OR URL — one thing, not both
- Optional: QR code for a URL if presenting live

**Never**: "Questions? Thank you!" as the last slide. Tell people what to do next.

---

## Navigation Code Snippet

Required on every HTML deck:

```javascript
document.addEventListener('keydown', (e) => {
  if (e.key === 'ArrowRight' || e.key === ' ') nextSlide();
  if (e.key === 'ArrowLeft') prevSlide();
  if (e.key === 'f' || e.key === 'F') toggleFullscreen();
  if (e.key === 'n' || e.key === 'N') toggleSpeakerNotes();
});

document.addEventListener('click', nextSlide);
```
