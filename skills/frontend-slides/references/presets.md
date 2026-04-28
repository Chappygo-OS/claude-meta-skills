# Frontend slides preset library

This file is loaded on demand when SKILL.md needs the full design preset catalog. Twelve named presets cover the typical use cases (pitch, teaching, conference, internal). Each preset entry gives the typography pair, the color palette mood, and when to pick it. The mood-to-preset map at the bottom matches the four discovery feelings (Impressed, Energized, Focused, Inspired) to the right shortlist for the live HTML preview pass. Density limits per slide type are listed last and are non-negotiable.

## Preset catalog

| # | Preset | Typography | Palette mood | Best for |
|---|---|---|---|---|
| 1 | Bold Signal | Archivo Black + Space Grotesk | High contrast, mostly black on white with one strong accent | Pitch openers, manifestos, "we're building something audacious" |
| 2 | Electric Studio | Manrope (display + body via weight stack) | Crisp white, electric accent, generous whitespace | Product launches, modern SaaS narratives |
| 3 | Creative Voltage | Syne + Space Mono | Off-white background, neon-on-black accents, monospaced detail | Agency pitches, creative studio decks, brand work |
| 4 | Dark Botanical | Cormorant + IBM Plex Sans | Deep green or near-black ground, ivory body, brass accent | Premium / luxury / wellness, premium B2B |
| 5 | Notebook Tabs | Bodoni Moda + DM Sans | Cream background, ink-blue body, paper-tab dividers | Teaching, workshops, structured how-to talks |
| 6 | Pastel Geometry | Plus Jakarta Sans | Soft pastel ground (mint, peach, lilac), charcoal body | Internal kickoffs, team alignment, friendly tone |
| 7 | Split Pastel | Outfit | Two-tone pastel split per slide (top half / bottom half), bold display | B2C product decks, lifestyle brands |
| 8 | Vintage Editorial | Fraunces + Work Sans | Warm cream, oxblood accent, hairline rules | Brand stories, founder talks, "the story behind the company" |
| 9 | Neon Cyber | Clash Display + Satoshi | Near-black ground, neon green or magenta accent, terminal feel | Dev tools, infra, security, technical conference |
| 10 | Terminal Green | JetBrains Mono | Pure black ground, phosphor green text, no other color | Engineering deep-dives, lower-level systems talks |
| 11 | Swiss Modern | Archivo + Nunito | White ground, single black accent, strict grid | Conference talks, finance, regulator-facing |
| 12 | Paper & Ink | Cormorant Garamond + Source Serif 4 | Off-white book paper, deep brown body, no second accent | Long-form lectures, academia, philosophy |

## How to read a preset

- **Typography pair** — display font (headings, big numerals) + body font. Both are Google Fonts so the deck stays portable.
- **Palette mood** — the temperature and contrast direction, not the exact hex codes. CSS custom properties expose `--color-bg`, `--color-fg`, `--color-accent` so the user can re-tune in seconds.
- **Best for** — the situation in which this preset stops being a default and starts being the right answer.

## Mood-to-preset map

When the user can't name a preset, ask how they want the audience to feel. Each feeling produces a three-preset shortlist that becomes the live preview pass.

| Feeling | Preset shortlist |
|---|---|
| Impressed | Bold Signal · Electric Studio · Dark Botanical |
| Energized | Creative Voltage · Neon Cyber · Split Pastel |
| Focused | Notebook Tabs · Paper & Ink · Swiss Modern |
| Inspired | Dark Botanical · Vintage Editorial · Pastel Geometry |

Three previews, three single-file HTML slides under 100 lines each, all dropped into `.ecc-design/slide-previews/`. The user picks visually rather than describing a vibe.

## Quick chooser by purpose

| Purpose | First-choice presets |
|---|---|
| Series A / Series B pitch | Bold Signal · Electric Studio |
| Seed pitch with brand-led narrative | Vintage Editorial · Dark Botanical |
| Conference talk on a technical topic | Swiss Modern · Notebook Tabs · Terminal Green |
| Workshop or training deck | Notebook Tabs · Paper & Ink |
| Internal team kickoff | Pastel Geometry · Notebook Tabs |
| Product launch slides | Electric Studio · Split Pastel |
| Dev tools / infra talk | Neon Cyber · Terminal Green |
| Brand story for a creator | Vintage Editorial · Creative Voltage |

Single-purpose decks pick one preset and stay there. Multi-section decks (e.g., a pitch with a brand-story chapter) can shift accent colors but should keep the typography pair consistent across sections.

## Six slide density limits

Density limits are hard caps. Overflow is solved by splitting the slide, never by shrinking type or scaling content.

| Slide type | Limit |
|---|---|
| Title slide | 1 heading + 1 subtitle. No more. |
| Content slide | 1 heading + either 4–6 bullets OR 2 short paragraphs. Not both. |
| Feature grid | At most 6 cards. Beyond 6, split into two slides. |
| Code slide | At most 8–10 lines. If longer, split. |
| Quote slide | 1 quote + attribution. Nothing else on the slide. |
| Image slide | 1 image, no taller than 60vh. Caption optional. |

A slide that exceeds these limits is a script with hyphens, not a slide. The fix is always to split.

## Five anti-patterns to refuse

When a user (or a source PPTX) pushes the deck toward any of these, push back:

1. **Purple-gradient startup template** — every YC deck has it; immediately marks the deck as default and unmemorable.
2. **System-font deck** — Arial / Helvetica / Times. Reads as "I gave up on design before I started."
3. **Bullet walls** — 9 bullets on one slide is a script with hyphens. Split into two slides or convert to prose.
4. **Scrollable code blocks** — if the snippet doesn't fit, the slide doesn't fit. Split.
5. **Fixed-height boxes** — break on every viewport that wasn't the one the deck was authored on. Use `clamp()` for type, never fixed pixel sizing for layout regions.

## Eight viewport sizes for validation

Every preset is verified at all eight before delivery:

- 1920×1080 (desktop projection)
- 1280×720 (laptop)
- 1440×900 (MacBook)
- 1024×768 (older projector)
- 768×1024 (tablet portrait)
- 414×896 (large phone portrait)
- 375×667 (phone portrait)
- 896×414 / 667×375 (phone landscape)

Every slide must render without scroll at every viewport. If a preset can't hold up across all eight, the slide is split — not the preset.

## Knobs the user controls after delivery

Every preset exposes the same set of CSS custom properties under `:root`:

- `--color-bg` — page ground
- `--color-fg` — body text
- `--color-accent` — primary accent (highlights, links, active states)
- `--color-accent-2` — optional secondary accent (used by some presets only)
- `--font-display` — heading font family
- `--font-body` — body font family
- `--type-scale` — multiplier on the modular type scale (default 1.0)

Adjusting these is the supported way to tune a delivered deck. Touching anything else risks breaking the viewport-fit gate.
