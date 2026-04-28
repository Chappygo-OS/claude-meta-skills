# AI Writing Patterns Taxonomy

Used by `/humanizer`. Full catalog of AI writing markers with severity levels.

---

## Severity Levels

- **High** — Immediately signals AI authorship to most readers. Remove always.
- **Medium** — Common in AI output; noticeable to trained readers. Remove or replace.
- **Low** — Subtle signals; acceptable occasionally but not repeatedly. Use judgment.

---

## Category 1: Filler Openers (High)

These are the first sentences that say nothing. Delete and start with the real content.

| Pattern | Example | Fix |
|---------|---------|-----|
| Engagement opener | "Great question!" / "Absolutely!" / "Certainly!" | Delete entirely |
| Pleasantry | "I hope this finds you well." | Delete entirely |
| Context-setting | "In today's fast-paced world..." | Delete — start with the actual point |
| Task acknowledgment | "Let me help you with that." / "Happy to help!" | Delete entirely |
| Setup foreshadow | "Here's what you need to know about X." | Delete — just say what you need to say |
| Meta-commentary | "This is a complex topic, but I'll break it down." | Delete — just break it down |

---

## Category 2: Hype and Jargon Words (High)

These words have been used so much they've lost meaning. Replace with concrete descriptions.

| Word/phrase | Replace with |
|------------|-------------|
| unlock | [specific verb for what it does] |
| leverage | use / apply / take advantage of |
| game-changer | [describe the specific change it makes] |
| transformative | [describe what actually transforms and how] |
| revolutionary | [describe what it replaces and why that's significant] |
| cutting-edge | [name the specific technology or approach] |
| state-of-the-art | [specify what makes it current or advanced] |
| seamless | [describe what makes it easy or frictionless] |
| robust | [describe what makes it reliable or capable] |
| innovative | [describe what's new about it specifically] |
| dive into | read / explore / review |
| delve into | read / look at / examine |
| actionable | [describe what action it enables] |
| impactful | [describe the specific impact] |
| synergy | [describe how the things actually work together] |
| holistic | [describe what it includes specifically] |
| empower | [describe what they can now do that they couldn't before] |
| navigate | deal with / handle / manage |
| landscape | [field / industry / environment — whichever is precise] |
| ecosystem | [network / platform / suite — whichever is precise] |

---

## Category 3: Vague Intensifiers (Medium)

These add emphasis without information. Either remove them or replace with specific data.

| Pattern | Example | Fix |
|---------|---------|-----|
| Empty adverb | "incredibly fast" | Fast how? 2x? 50ms? |
| Vague qualifier | "many businesses" / "various industries" | Name them, or give a number |
| Unsourced authority | "experts say" / "studies show" | Name the expert. Cite the study. |
| Scale claim | "significant results" | Significant = what number? |
| Comparative without basis | "better performance" | Better than what? By how much? |
| Time vagueness | "recently" / "in recent years" | Specific year or time period |

---

## Category 4: Structural Tells (Medium)

These sentence and paragraph patterns are statistically overrepresented in AI output.

| Pattern | Description | Fix |
|---------|-------------|-----|
| Symmetrical bullet list | Every bullet is exactly the same grammatical structure and similar length | Vary deliberately — one bullet can be a single word |
| Three-part structure | "First... Second... Third..." for everything | Mix: sometimes 2 points, sometimes one statement, sometimes a question |
| Setup-payoff opener | "X is important. Here's why:" | Cut the setup. Start with the why. |
| Em-dash overuse | More than 1 em-dash per 300 words | Replace with period, comma, or rephrase |
| Numbered list for prose | Using 1/2/3 for ideas that flow naturally together | Use prose paragraphs when ideas connect |
| Forced parallelism | Making all phrases grammatically identical for "tidiness" | Natural language isn't always parallel |
| Symmetrical section lengths | Every section is exactly the same length | Vary based on the weight of each idea |

---

## Category 5: Hedge Phrases (Medium)

These signal uncertainty without adding useful caveats. Remove unless the hedging is genuinely warranted.

| Pattern | Examples |
|---------|---------|
| Unnecessary setup | "It's worth noting that..." / "It's important to remember..." |
| False consensus | "As we know..." / "Of course..." / "Needless to say..." |
| Vague closing clichés | "At the end of the day..." / "The bottom line is..." |
| Overqualified advice | "You might want to consider potentially looking into..." |
| Soft framing | "This could perhaps be seen as..." |

**Exception**: hedge when genuinely uncertain — "This approach may not work if your database exceeds 10M rows." That's useful hedging.

---

## Category 6: Transition Padding (High)

These words announce connections that readers can make themselves. Delete them.

| Delete these | Examples |
|-------------|---------|
| Additive | "Furthermore," / "Moreover," / "Additionally," / "In addition," |
| Conclusive | "In conclusion," / "To summarize," / "As a result," / "Therefore," |
| Contrastive | "However, it's worth noting that..." (when "However" + hedging = pure filler) |
| Sequential | "First and foremost," / "Last but not least," |

**Keep**: "However" and "But" when there's a genuine contrast. "So" when there's genuine causation.

---

## Category 7: Passive Voice Overuse (Medium)

Passive is fine when the actor is unknown or irrelevant. It's a problem when used reflexively.

**AI default pattern**: "The report was generated. The analysis was completed. The results were summarized."

**Fix**: "I generated the report, completed the analysis, and summarized the results."

**Rule**: flip passive to active for > 80% of sentences. Keep passive only when active voice would be awkward or when the actor genuinely doesn't matter.

---

## Category 8: Future-Tense Closes (Low)

AI tends to close sections with predictions and promises. Replace with present-tense capabilities or cut.

| Pattern | Example | Fix |
|---------|---------|-----|
| Promise close | "This will transform how you work." | What does it do today? Say that instead. |
| Universal prediction | "This is going to change everything." | Cut. Or make a specific, bounded claim. |
| Invitation | "Imagine a world where..." | Start with the reality, not the imagination. |
