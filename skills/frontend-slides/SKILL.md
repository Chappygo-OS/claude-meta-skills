---
name: frontend-slides
description: Builds animated HTML presentations from scratch, from PowerPoint files, or by converting outlines — apply your brand guide for instant personalized decks. Use when the user wants to build a presentation, convert a PPT/PPTX to web, create slides for a talk/pitch, or explore presentation styles.
---

# Frontend Slides

Create zero-dependency, animation-rich HTML presentations that run entirely in the browser. Helps non-designers discover their aesthetic through visual exploration rather than abstract choices.

## Non-Negotiables

1. **Zero dependencies**: default to one self-contained HTML file with inline CSS and JS.
2. **Viewport fit is mandatory**: every slide must fit inside one viewport with no internal scrolling.
3. **Show, don't tell**: use visual previews instead of abstract style questionnaires.
4. **Distinctive design**: avoid generic purple-gradient, Inter-on-white, template-looking decks.
5. **Production quality**: keep code accessible, responsive, and performant.

Before generating, read `STYLE_PRESETS.md` for the viewport-safe CSS base, density limits, preset catalog, and CSS gotchas.

---

## STEP 1 — DETECT MODE

Choose one path:
- **New presentation**: user has a topic, notes, or full draft
- **PPT conversion**: user has `.ppt` or `.pptx`
- **Enhancement**: user already has HTML slides and wants improvements

---

## STEP 2 — DISCOVER CONTENT

Ask only the minimum needed:
- **Purpose**: pitch, teaching, conference talk, sales, internal update, YouTube
- **Audience**: executives / technical team / customers / general public
- **Length**: short (5–10), medium (10–20), long (20+)
- **Content state**: finished copy, rough notes, topic only

If the user has content, ask them to paste it before styling.

---

## STEP 3 — DISCOVER STYLE

Default to visual exploration.

If the user already knows the desired preset, skip previews and use it directly.

Otherwise:
1. Ask what feeling the deck should create: impressed, energized, focused, inspired.
2. Generate **3 single-slide preview files** in `.ecc-design/slide-previews/`.
3. Each preview must be self-contained, show typography/color/motion clearly.
4. Ask the user which preview to keep or what elements to mix.

Use the preset guide in `STYLE_PRESETS.md` when mapping mood to style.

**If a brand guide is provided**, extract instead:
- Primary and secondary colors → CSS custom properties (`--color-primary`, `--color-accent`)
- Typography: font family, weights (headline, body, caption sizes)
- Logo: URL or placeholder, placement (top-left default), max size
- Visual rules: border styles, spacing, gradients, icon style

---

## STEP 4 — STRUCTURE THE DECK

Slide flow for most decks:
1. Title slide (hook — one bold claim or question)
2. Problem/context (why this matters)
3–N. Body slides (one idea each)
N-1. Summary or key takeaway
N. CTA or next steps

Content density limits (never exceed without splitting the slide):

| Slide type | Maximum content |
|------------|-----------------|
| Title | 1 heading + 1 subtitle + optional tagline |
| Content | 1 heading + 4–6 bullets or 2 paragraphs |
| Feature grid | 6 cards maximum |
| Code | 8–10 lines maximum |
| Quote | 1 quote + attribution |
| Image | 1 image, ideally under 60vh |

See `references/layout-rules.md` for per-slide-type specs.

---

## STEP 5 — BUILD THE HTML

Output `presentation.html` or `[presentation-name].html`.

Required HTML structure:
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

Required features:
- Viewport-safe CSS base from `STYLE_PRESETS.md` (mandatory — copy the base block)
- CSS custom properties for theme values
- Keyboard navigation: `→` / `Space` = next, `←` = previous, `F` = fullscreen, `N` = toggle speaker notes
- Click/touch/swipe navigation
- Progress indicator or slide index
- Intersection Observer for reveal animations
- Reduced-motion support (`prefers-reduced-motion`)
- All resources inline — zero external dependencies

Optional enhancements (add when appropriate):
- Code syntax highlighting (inline CSS, no external lib)
- Animated counters for stats slides
- Progressive bullet reveal (click to show one at a time)
- Speaker notes section: hidden div per slide, shown on keypress `N`
- Dark/light mode toggle

---

## STEP 6 — ENFORCE VIEWPORT FIT (HARD GATE)

Every `.slide` must use:
```css
height: 100vh;
height: 100dvh;
overflow: hidden;
```

Rules:
- All typography must use `clamp()`
- When content does not fit, split into multiple slides
- Never solve overflow by shrinking text below readable sizes
- Never allow scrollbars inside a slide
- Negative CSS functions like `-clamp(...)` are INVALID — use `calc(-1 * clamp(...))` instead

See the full mandatory base CSS block in `STYLE_PRESETS.md`.

---

## STEP 7 — VALIDATE AND DELIVER

Check the finished deck at minimum at: 1920×1080, 1280×720, 768×1024, 375×667, 667×375.

If browser automation is available, verify no slide overflows and keyboard navigation works.

At handoff:
- Delete temporary preview files unless the user wants to keep them
- Open the deck with the platform-appropriate opener:
  - macOS: `open file.html`
  - Linux: `xdg-open file.html`
  - Windows: `start "" file.html`
- Summarize: file path, preset used, slide count, easy theme customization points

---

## PPT / PPTX CONVERSION

For PowerPoint conversion:
1. Prefer `python3` with `python-pptx` to extract text, images, and notes.
2. If `python-pptx` is unavailable, ask whether to install it or fall back to a manual workflow.
3. Preserve slide order, speaker notes, and extracted assets.
4. After extraction, run the same style-selection workflow as a new presentation.

Keep conversion cross-platform. Do not rely on macOS-only tools when Python can do the job.

---

## SAVE YOUR BRAND PERMANENTLY

Tell Claude once and never repeat:
```
Update the frontend-slides skill: primary color #1A1A2E, accent #E94560,
font Inter, logo top-left. Save this as my default brand.
```

---

## Skill integrations

- **`/humanizer`** — run on slide text before finalizing to remove AI writing markers
- **`/fact-checker`** — verify any statistics or claims in the slides
- **`/prompt-master`** — clarify a vague deck brief before building

## Reference files

- `STYLE_PRESETS.md` — viewport-safe CSS base, 12 style presets, mood mapping, CSS gotchas
- `references/presets.md` — original 5-preset catalog
- `references/layout-rules.md` — specs for 8 slide types
- `references/animation-library.md` — CSS animation code snippets
