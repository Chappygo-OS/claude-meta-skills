---
name: audio-transcriber
description: Transcribes, cleans, and processes audio content — turns voice notes, meetings, and interviews into structured text you can actually use
---

# Audio Transcriber

Raw audio transcripts are messy. Filler words, crosstalk, rambling digressions, no punctuation. This skill cleans the transcript, identifies speakers, extracts key information, and structures it into the format you need: meeting notes, action items, interview summaries, article drafts, or CRM entries.

## Usage

```
/audio-transcriber [paste transcript or attach audio file]
```

With output type specified:
```
/audio-transcriber [transcript] → meeting notes with action items
/audio-transcriber [transcript] → structured interview summary
/audio-transcriber [transcript] → blog post draft
/audio-transcriber [transcript] → CRM notes for this sales call
```

## Instructions for Claude

When this skill is invoked:

### 1. Determine the input type

- **Raw transcript**: text already transcribed, needs cleaning and structuring
- **Audio file**: transcribe first using available audio processing tools, then clean
- **AI-generated transcript** (Otter, Fireflies, Zoom, Whisper): usually partially processed — still needs structure

If audio transcription tools are not available, ask the user to paste the transcript as text.

### 2. Determine the output type

If not specified, ask:
- Meeting notes (with action items and decisions)?
- Interview or conversation summary?
- Content for publishing (blog post, newsletter, LinkedIn post)?
- Sales call notes (for CRM)?
- General summary?

Different outputs require different processing — don't guess.

### 3. Clean the transcript

Before structuring, clean:

**Remove filler words**: "um", "uh", "like", "you know", "sort of", "kind of", "I mean"
**Fix run-on sentences**: split where a new idea begins
**Correct obvious transcription errors**: homophones, garbled technical terms (compare against context)
**Remove crosstalk markers** and [inaudible] sections — note what was inaudible in the output
**Normalize speaker labels**: if the transcript has "Speaker 1" / "Speaker 2", ask the user to identify them or use context clues

### 4. Structure by output type

**Meeting notes**:
```
## Meeting: [topic or title]
**Date**: [if available]
**Attendees**: [names if identifiable]
**Duration**: [if available]

### Summary
[3–5 sentence summary of what was discussed and decided]

### Decisions Made
- [Decision 1]
- [Decision 2]

### Action Items
| Item | Owner | Deadline |
|------|-------|---------|
| [task] | [name] | [date or "TBD"] |

### Key Discussion Points
[Main topics discussed, with brief summaries of each]

### Open Questions / Parking Lot
[Things mentioned but not resolved]
```

**Interview / conversation summary**:
```
## Interview Summary: [subject] — [date]

### About the subject
[Name, role, context — 2 sentences]

### Key themes
1. [Theme 1]: [2-3 sentence summary]
2. [Theme 2]: [...]
3. [Theme 3]: [...]

### Notable quotes
> "[Exact quote]" — [Speaker]

### Key insights
- [Insight 1]
- [Insight 2]
```

**Sales call notes (CRM format)**:
```
## Call: [Company] — [Date]
**Contact**: [Name, Title]
**Stage**: [Discovery / Demo / Proposal / Negotiation]
**Duration**: [time]

### Summary
[2-3 sentences: who we spoke to, what we discussed, where we left it]

### Pain points identified
- [Pain 1]
- [Pain 2]

### Objections raised
- [Objection 1]: [their exact words]

### Next steps
- [ ] [Action] by [owner] by [date]
- [ ] [Action]

### Key quotes
> "[Exact quote from prospect about their situation or pain]"
```

**Content draft (blog/newsletter/LinkedIn)**:
```
Process the transcript as a ghost-writing task:
1. Identify the 3-5 strongest ideas or insights from the transcript
2. Build an outline around them
3. Write a draft in the speaker's voice (not AI-polished voice)
4. Flag sections where the source is thin or needs expansion
5. Run /humanizer on the output before delivering
```

### 5. Flag uncertain content

Mark anything that:
- Was inaudible or garbled
- Was an aside or off-the-record comment that probably shouldn't be included
- Seems like it may have been misattributed to the wrong speaker
- Is a number or name that the transcript may have garbled

### 6. Offer follow-on processing

After delivering the structured output:
- "Want me to draft a follow-up email based on the action items?"
- "Should I create a LinkedIn post from the key insights?"
- "Want me to add these notes to [connected CRM via MCP]?"

## Skill integrations

- **`/humanizer`** — run on any drafted content before publishing
- **`/fact-checker`** — verify any specific claims made in the audio
- **`/prompt-master`** — improve the prompt if the output type needs refining
- **`/mcp-builder`** — build a CRM MCP to auto-import the sales call notes

## Notes

- The quality of the output is bounded by the quality of the transcript. Poor audio = poor transcription = poor output.
- For multi-speaker recordings: request speaker identification early — the entire structure depends on knowing who said what.
- For long recordings (60+ minutes): process in sections to maintain quality.
