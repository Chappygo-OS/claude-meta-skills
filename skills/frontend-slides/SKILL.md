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

With brand guide:
```
/frontend-slides Create an explainer deck on [topic]. Brand guide attached.
```

Convert existing PowerPoint:
```
/frontend-slides Convert the attached PPT into an animated HTML presentation. Brand guide: [attach or describe]
```

## Instructions for Claude

When this skill is invoked:

1. **Determine the presentation type**:
   - From scratch (topic-driven)
   - From an existing file (PPT, PPTX, outline, notes)
   - From a URL or document

2. **Apply brand guide if provided** — extract:
   - Primary and secondary colors (use as CSS variables)
   - Typography (font family, weights, sizes)
   - Logo placement and sizing rules
   - Any visual identity rules
   If no brand guide is provided, choose a style preset that fits the topic (e.g., neon-cyber for AI topics, minimal for business).

3. **Structure the deck** using these layout best practices:
   - Max 1 key idea per slide
   - Title: short (5–7 words), specific, not vague
   - Body: bullet points max 3 per slide, or one visual/chart
   - Progress indicator (slide number or bar)
   - Consistent header/footer placement

4. **Build the HTML** as a single self-contained file:
   - CSS animations for slide transitions (fade, slide, or brand-appropriate)
   - Keyboard navigation (arrow keys) and click navigation
   - Responsive for 16:9 display
   - All styles inline or in a `<style>` block — no external dependencies

5. **Deliver**:
   - The complete HTML file (save as `presentation.html`)
   - A brief summary: number of slides, style applied, navigation instructions

6. **Offer customization** — ask if the user wants to adjust colors, add slides, change the animation style, or embed the brand guide permanently into this skill.

## Customization tip

Tell Claude to update this skill with your brand once:
```
Update the frontend-slides skill with my brand: primary color #[hex],
font [name], logo at [position]. Save it so I never have to specify again.
```

## Notes

- Output is a single `.html` file — share it directly, embed in a website, or open in a browser for presenting.
- For YouTube content, combine with a screen recorder to capture slide animations as video B-roll.
