---
name: humanizer
description: Removes AI writing markers from any text — run on anything AI-generated before it reaches a human reader
---

# Humanizer

AI-generated text has tells. Certain words, sentence patterns, and structures that signal "a machine wrote this." This skill detects and removes them based on a documented taxonomy of AI writing markers. Run it on any AI output — emails, LinkedIn posts, onboarding docs, scripts, proposals — before it goes out.

## Usage

```
/humanizer [text to humanize]
```

Pipe from another skill:
```
/linkedin-post [topic]
Then: /humanizer [paste output above]
```

Specify a voice:
```
/humanizer [text] — match the tone of this sample: [paste 2-3 sentences the user wrote]
```

## Embed in other skills (recommended)

Tell Claude to update any writing skill to auto-humanize its output:

```
Update my [linkedin-post / newsletter / email] skill to always run the humanizer
skill on the final output before presenting it to me.
```

## Instructions for Claude

When this skill is invoked with text:

### 1. Read the full text first

Do not make any changes before reading the entire piece. Understanding the argument structure and author's intent is necessary to preserve them while fixing the markers.

### 2. Detect a voice profile (if sample provided)

If the user provides sample text they wrote themselves:
- Identify their natural patterns: sentence length, preferred connectors, vocabulary level, use of I/we/you, humor, directness
- Store these as constraints for the rewrite
- See `references/voice-profiles.md` for how to extract and apply a voice profile

### 3. Scan for AI writing markers

See `references/patterns.md` for the full taxonomy with severity levels. Key categories:

**Filler openers** (delete entirely):
- "I hope this finds you well"
- "Certainly!", "Of course!", "Absolutely!", "Great question!", "Happy to help!"
- "In today's [fast-paced / digital / competitive] world..."
- "Let me break this down for you"

**Hype and jargon words** (replace with concrete description):
- "unlock", "leverage", "game-changer", "transformative", "revolutionary"
- "cutting-edge", "state-of-the-art", "innovative", "seamless", "robust"
- "dive into", "delve into", "explore", "unpack"
- "actionable", "impactful", "synergy", "holistic"

**Vague intensifiers** (remove or replace with specific data):
- "incredibly", "extremely", "very", "quite", "rather" — without specificity
- "many businesses", "various industries", "numerous studies", "experts say"
- "significant", "substantial", "considerable" — without a number

**Structural tells** (vary or flatten):
- **Symmetrical bullet lists**: every point the same length, same grammatical pattern — break the symmetry deliberately
- **Three-part structures**: "First... Second... Third..." "There are three key reasons..." — mix it up
- **Setup-payoff openers**: "X is important. Here's why." — cut the setup and start with why
- **Em-dash overuse** as a stylistic crutch — limit to 1 per 300 words
- **Transition padding**: "Furthermore", "Moreover", "In conclusion", "To summarize", "It's worth noting" — cut them

**Hedge phrases** (cut unless hedging is genuinely warranted):
- "It's worth noting that", "It's important to remember that"
- "As we know", "Of course", "Needless to say"
- "At the end of the day", "The bottom line is"

**Passive voice overuse** (flip to active):
- Passive > 20% of sentences → rewrite to active
- Exception: passive is appropriate when the actor is unknown or irrelevant

**Future-tense closes** (replace with present or specific):
- "This will transform how you work" → what it actually does today
- "This is going to change everything" → specific concrete claim or cut

### 4. Rewrite

For each detected marker:
- **Hype words** → concrete description of what the thing actually does
- **Filler openers** → delete, start with the first real sentence
- **Symmetrical lists** → vary length and phrasing deliberately; one item can be a single word
- **Vague generalities** → specific number, name, or example
- **Passive** → active voice
- **Transition padding** → hard delete; let ideas connect without announcing it
- **Em-dash overuse** → use period or comma instead

Preserve:
- Core message and argument structure
- Personal anecdotes and specific examples
- Named people, companies, and data
- The author's humor, asides, and personality signals

### 5. Show a diff

Present:
1. **Humanized version** — ready to use, no annotations
2. **Changes made** — 3–5 bullets summarizing what was fixed and why, so the author can learn

Format:
```
## Humanized

[clean text]

---

## What changed

- Removed "In today's AI-driven world" opener — started with the real point instead
- Replaced "leverage" (×3) with specific descriptions of each action
- Broke the symmetrical 4-bullet structure — varied lengths and phrasing
- Flipped 6 passive constructions to active voice
- Cut "Furthermore", "Moreover", "It's worth noting" transitions
```

### 6. Optional: severity score

If the user asks "how AI does this sound?", provide:
```
AI Signature Score: 7/10 (high)
Top offenders: filler opener, 4 hype words, symmetrical list, 3 em-dashes
After humanizing: 2/10 (low)
```

## Customization

Add your own banned words and preferred phrasings by editing this file. Example:
```
# My custom markers to remove:
- "world-class" (I don't use it, sounds pretentious)
- "at scale" (overused in SaaS writing)

# My preferred substitutions:
- "leverage" → "use" or [specific verb for the context]
- "seamless" → describe what actually makes it easy
```

## Skill integrations

- **`/fact-checker`** — run before humanizing to ensure the content is accurate first
- **`/frontend-slides`** — humanize slide text before finalizing a deck
- **`/prompt-master`** — clean up prompt drafts that will be used as templates

## Notes

- Run on AI output, not on text the human wrote themselves.
- The more specific the replacement, the better the result. Vague → concrete is the core transformation.
- Reference files: `references/patterns.md`, `references/examples.md`, `references/voice-profiles.md`
