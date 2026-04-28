---
name: frontend-slides
description: Builds animated HTML presentations from scratch or from PowerPoint files — apply your brand guide for instant personalized decks
---

# Frontend Slides

Claude can generate HTML presentations, but the default quality isn't good enough to use in a sales call, YouTube video, or company meeting. This skill fixes that: it embeds best practices for slide layout, animation, and visual hierarchy, and applies your brand guide automatically when provided.

## Usage

```
/frontend-slides [topic or request]
```

From scratch:
```
/frontend-slides Build a 10-slide pitch deck for a B2B SaaS product targeting HR teams
/frontend-slides Create an explainer deck on how AI agents work. Target audience: non-technical executives
```

With brand guide:
```
/frontend-slides Create a product update deck for our Q2 all-hands. Brand: primary #1A1A2E, font Inter, logo top-left
```

Convert existing file:
```
/frontend-slides Convert the attached PPT into an animated HTML presentation
/frontend-slides Turn this outline into a full slide deck: [paste outline]
```

## Instructions for Claude

When this skill is invoked:

### 1. Determine inputs and intent

- **Source**: from scratch / from file (PPT, outline, notes) / from URL
- **Purpose**: sales pitch / explainer / all-hands update / YouTube / tutorial / workshop
- **Audience**: executives / technical team / customers / general public
- **Length**: how many slides? If not specified: 8–12 for most use cases
- **Brand guide**: provided / describe / use preset

If any of these are unclear, ask before building. Wrong assumptions here waste effort.

### 2. Apply brand guide or select style preset

If a brand guide is provided, extract:
- Primary and secondary colors → CSS custom properties (`--color-primary`, `--color-accent`)
- Typography: font family, weights (headline, body, caption sizes)
- Logo: URL or placeholder, placement (top-left default), max size
- Visual rules: border styles, spacing, gradients, icon style

If no brand guide is provided, choose from `references/presets.md`:
- **minimal** — white background, dark text, thin lines. Best for: business, consulting, internal docs
- **neon-cyber** — dark background, neon accents, glow effects. Best for: AI, tech, developer audiences
- **warm-editorial** — warm tones, serif headlines, editorial layout. Best for: media, content, creative
- **corporate-blue** — classic navy and white, clean grid. Best for: enterprise, finance, B2B
- **bold-impact** — large type, high contrast, full-bleed images. Best for: keynotes, sales, YouTube

### 3. Structure the deck

Use these layout principles (see `references/layout-rules.md` for per-slide-type specs):
- **Max 1 key idea per slide** — if a slide needs a long explanation, split it
- **Title**: 5–7 words, specific, not vague ("We grew 3x" not "Growth Results")
- **Body**: max 3 bullet points per slide, or 1 visual/chart — never both
- **Visuals** > text whenever possible — diagrams, icons, charts, screenshots
- **Progress indicator**: slide number (X/N) or a thin top progress bar
- **Consistent header/footer** across all slides — build it once in CSS
- **Speaker notes** section: hidden div per slide, shown on keypress `N`

Slide flow for most decks:
1. Title slide (hook — one bold claim or question)
2. Problem/context (why this matters)
3–8. Body slides (one idea each)
9. Summary or key takeaway
10. CTA or next steps

### 4. Build the HTML

Produce a single self-contained `.html` file with:

**Structure**:
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>[Deck title]</title>
  <style>/* all styles here */</style>
</head>
<body>
  <div class="deck">
    <div class="slide" id="slide-1">...</div>
    <!-- more slides -->
  </div>
  <script>/* navigation logic */</script>
</body>
</html>
```

**Required features**:
- CSS transitions for slide changes (fade default, slide-left for sequential content)
- Keyboard navigation: `→` / `Space` = next, `←` = previous, `F` = fullscreen, `N` = toggle speaker notes
- Click anywhere to advance
- Auto-fit to viewport (no scrolling)
- All resources inline — zero external dependencies (no CDN, no Google Fonts unless user confirms internet access)
- If using fonts: embed a system font stack or base64-encode a single web font

**Optional enhancements** (add when appropriate):
- Slide transition animations per slide type (fade-in for title, wipe for reveals)
- Code syntax highlighting (inline CSS, no external lib)
- Animated counters for stats slides
- Progressive bullet reveal (click to show one at a time)
- Dark/light mode toggle

### 5. Deliver

- Save the file as `[deck-topic]-slides.html`
- Provide a brief summary:
  - Number of slides
  - Style applied
  - Navigation instructions
  - Any slides where content was assumed (so user can verify)

### 6. Offer customizations

After delivery, ask:
- "Want to adjust any colors, fonts, or animations?"
- "Should I add speaker notes to any slides?"
- "Want me to save this brand guide into the skill so you never have to specify it again?"

## Save your brand permanently

Tell Claude once and never repeat:
```
Update the frontend-slides skill: primary color #1A1A2E, accent #E94560,
font Inter, logo top-left. Save this as my default brand.
```

## Skill integrations

- **`/humanizer`** — run on slide text before finalizing to remove AI writing markers
- **`/fact-checker`** — verify any statistics or claims in the slides
- **`/prompt-master`** — clarify a vague deck brief before building

## Notes

- Output is a single `.html` file — share directly, embed in a website, or present in browser fullscreen (`F11`).
- For YouTube content: open in Chrome, go fullscreen, record with Loom or OBS.
- For PDF export: open in Chrome → Print → Save as PDF → "Background graphics" on.
- Reference files: `references/presets.md`, `references/layout-rules.md`, `references/animation-library.md`
