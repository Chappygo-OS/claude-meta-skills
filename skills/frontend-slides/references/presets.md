# Visual Style Presets

Used by `/frontend-slides`. Apply these presets when no brand guide is provided.

---

## minimal

**Best for**: Business presentations, consulting decks, internal reports, investor updates

**Visual style**: White background, dark charcoal text, thin hairline borders, generous whitespace

```css
:root {
  --bg: #FFFFFF;
  --bg-alt: #F8F9FA;
  --text-primary: #1A1A1A;
  --text-secondary: #6B7280;
  --accent: #111827;
  --border: #E5E7EB;
  --font-heading: 'Georgia', 'Times New Roman', serif;
  --font-body: 'Helvetica Neue', 'Arial', sans-serif;
  --slide-padding: 64px;
}
```

**Slide characteristics**:
- Title: 48px, font-weight 700, no decoration
- Body: 20px, line-height 1.7
- Bullets: simple dash (—) not circles or arrows
- Charts: single-color bars, no gradients
- Transitions: fade (300ms ease)

---

## neon-cyber

**Best for**: AI/ML topics, developer audiences, tech conferences, YouTube thumbnails

**Visual style**: Near-black background, electric neon accents, subtle glow effects, monospace accent font

```css
:root {
  --bg: #0A0A0F;
  --bg-alt: #12121A;
  --text-primary: #E8E8F0;
  --text-secondary: #9999BB;
  --accent: #00FFB3;
  --accent-2: #7B61FF;
  --border: #222233;
  --glow: 0 0 20px rgba(0, 255, 179, 0.3);
  --font-heading: 'Courier New', 'Consolas', monospace;
  --font-body: 'Helvetica Neue', 'Arial', sans-serif;
  --slide-padding: 56px;
}
```

**Slide characteristics**:
- Title: 52px, font-weight 700, accent color or white
- Accent lines: 2px left border in `--accent` for section headings
- Bullets: > prefix character in accent color
- Code blocks: dark background with accent-colored syntax
- Transitions: slide-left (200ms ease-in-out)
- Optional: subtle animated grid background on title slide

---

## warm-editorial

**Best for**: Media companies, content creators, newsletters, creative agencies, podcast brands

**Visual style**: Warm off-white, serif headlines, editorial grid, ink-black text, warm amber accents

```css
:root {
  --bg: #FAF7F2;
  --bg-alt: #F0EBE3;
  --text-primary: #1C1208;
  --text-secondary: #6B5B47;
  --accent: #C8841A;
  --accent-light: #F5E6CC;
  --border: #D4C4B0;
  --font-heading: 'Georgia', 'Garamond', serif;
  --font-body: 'Palatino', 'Georgia', serif;
  --slide-padding: 60px;
}
```

**Slide characteristics**:
- Title: 52px, font-weight 400 (no bold — elegant weight), `--accent` color
- Pull quotes: large (72px) accent color, left-aligned, no quotation marks
- Section dividers: full-width thin line in `--border`
- Transitions: fade (400ms ease)

---

## corporate-blue

**Best for**: Enterprise sales decks, B2B pitches, finance presentations, board updates

**Visual style**: Classic navy and white, clean grid, reliable professional look, subtle depth

```css
:root {
  --bg: #FFFFFF;
  --bg-alt: #F0F4F8;
  --bg-dark: #1B2A4A;
  --text-primary: #1B2A4A;
  --text-secondary: #4A5568;
  --text-light: #FFFFFF;
  --accent: #2563EB;
  --accent-light: #EFF6FF;
  --border: #CBD5E1;
  --font-heading: 'Calibri', 'Arial', sans-serif;
  --font-body: 'Calibri', 'Arial', sans-serif;
  --slide-padding: 56px;
}
```

**Slide characteristics**:
- Title slides: dark navy background with white text (reverse style)
- Body slides: white background with dark text
- Charts: blue primary, gray secondary, no more than 3 colors
- Bullets: filled square (■) in `--accent`
- Transitions: fade (250ms)

---

## bold-impact

**Best for**: Keynotes, sales kickoffs, motivational content, YouTube intros, brand launches

**Visual style**: Full-bleed backgrounds, massive type, high contrast, dramatic imagery

```css
:root {
  --bg: #000000;
  --bg-alt: #111111;
  --text-primary: #FFFFFF;
  --text-secondary: #CCCCCC;
  --accent: #FF3B30;
  --accent-2: #FFD60A;
  --border: #333333;
  --font-heading: 'Impact', 'Arial Black', sans-serif;
  --font-body: 'Helvetica Neue', 'Arial', sans-serif;
  --slide-padding: 48px;
}
```

**Slide characteristics**:
- Title: 72–96px, all caps, letter-spacing: 0.05em
- Key stats: 120px+ number in accent color, small label underneath
- One idea per slide, always
- Transitions: cut (0ms) or fast slide (150ms)
- Background: use full-bleed color washes or image + dark overlay

---

## How to Customize a Preset

When the user provides partial brand information but not a full guide:
1. Start from the nearest preset
2. Override `--accent` with their brand color
3. Override font-family if they specify a font
4. Adjust `--bg` if they have a specific background preference

Example:
```
User: "Use minimal but with our brand color #E94560 and font Poppins"
→ Start from minimal preset
→ Replace --accent: #111827 with --accent: #E94560
→ Replace font-heading and font-body with 'Poppins', sans-serif
```
