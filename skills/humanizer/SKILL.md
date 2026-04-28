---
name: humanizer
description: Removes AI writing markers from any text — run on anything AI-generated before it reaches a human reader
---

# Humanizer

AI-generated text has tells. Certain words, sentence patterns, and structures that signal "a machine wrote this." This skill detects and removes them based on documented AI writing markers. Run it on any AI output — emails, LinkedIn posts, onboarding docs, scripts — before it goes out.

## Usage

```
/humanizer [text to humanize]
```

Or pipe it from another skill:
```
/linkedin-post [topic]
Then: run the humanizer skill on this output.
```

## Embed in other skills (recommended)

Tell Claude to update any writing skill to auto-humanize its output:

```
Update my [linkedin-post / newsletter / email] skill to always run the humanizer
skill on the final output before presenting it to me.
```

## Instructions for Claude

When this skill is invoked with text:

1. **Read the full text** before making any changes.

2. **Scan for AI writing markers**, including:
   - **Filler openers**: "I hope this finds you well", "Certainly!", "Of course!", "Absolutely!", "Great question!"
   - **Hype words**: "unlock", "leverage", "game-changer", "transformative", "revolutionary", "cutting-edge", "dive into", "delve into"
   - **Vague intensifiers**: "incredibly", "extremely", "very", "quite", "rather" used without specificity
   - **Future-tense endings**: sentences that close with a prediction ("This will transform how you work")
   - **Symmetrical list structure**: every bullet point the same length, same grammatical pattern
   - **Passive over active voice** used more than 20% of the time
   - **Em-dash overuse** as a stylistic crutch
   - **Hedging without reason**: "It's worth noting that", "It's important to remember that"
   - **Transition padding**: "Furthermore", "Moreover", "In conclusion", "To summarize"
   - **Generic specificity**: "many businesses", "various industries", "numerous studies"

3. **Rewrite to fix each marker**:
   - Replace hype words with concrete descriptions ("unlock" → what it actually does)
   - Remove filler openers entirely
   - Vary sentence length and structure deliberately
   - Use specific numbers, names, and examples instead of vague generalities
   - Prefer active voice
   - Cut transition padding — let ideas connect without announcing it

4. **Preserve the author's voice** — do not change the core message, argument structure, or personal anecdotes. Only fix the markers.

5. **Show a diff** — present:
   - The humanized version (ready to use)
   - A brief list of the main changes made (3–5 bullets), so the author can learn and customize

## Customization

Add your own patterns to avoid by editing this skill file. Example additions:
- Words you never use: add them to the marker list
- Phrases specific to your industry that feel formulaic
- Your preferred alternative phrasings

## Notes

- Run this on AI output, not on text the user wrote themselves.
- The more specific the replacement, the better the result. Vague → concrete is the core transformation.

## References

Load on demand when the user asks for the full pattern catalog or worked examples:
- `references/patterns.md` — full 24-pattern catalog (content / language / style / communication / filler-hedging) with trigger words for each
- `references/examples.md` — four worked Before/After rewrites with change logs keyed to the catalog
