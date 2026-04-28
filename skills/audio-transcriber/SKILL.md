---
name: audio-transcriber
description: Turns any audio file into a clean markdown transcript, with optional LLM-generated meeting minutes — run on calls, lectures, voice notes, or interview recordings
---

# Audio Transcriber

Recordings pile up, but reading them back doesn't scale. This skill converts audio to markdown transcripts and, when asked, hands the transcript to an LLM to produce structured meeting minutes. Two modes: transcribe-only, or transcribe + minutes.

## Usage

```
/audio-transcriber [path or URL to audio file]
```

Examples:
```
/audio-transcriber ./client-call.m4a
/audio-transcriber ./lecture.mp3 — transcript only, no minutes
/audio-transcriber https://example.com/board-meeting.wav
```

## Embed in other skills (recommended)

```
Update my [meeting-notes / weekly-review] skill to call audio-transcriber
on any attached recording before processing.
```

## Instructions for Claude

When this skill is invoked with an audio file:

1. **Check the engine** — probe for `faster-whisper` first (4–5x faster). Fall back to `whisper`. Confirm `ffmpeg` is on PATH for format conversion. If nothing is installed, stop and tell the user what to install.

2. **Validate the input** — accept a local path or a URL. Confirm the file exists or resolves. Auto-convert any non-WAV input to 16 kHz mono via ffmpeg before transcribing.

3. **Transcribe** — run the engine with VAD filtering and word-level timestamps. Capture detected language, duration, and per-segment text with start/end markers.

4. **Decide the branch** — ask the user whether they want transcript-only or transcript + meeting minutes. If no LLM CLI is available locally, default to transcript-only and say so.

5. **If a second brain or OS context is available**, pull relevant context (attendees, project, prior decisions) and feed it into the minutes prompt so the LLM has grounding.

6. **Generate the markdown report** with four sections: Metadata, Full Transcription, Meeting Minutes (if requested), Executive Summary (if requested).

7. **Write the output files** with timestamps so reruns never overwrite:
   - `transcript-YYYYMMDD-HHMMSS.md` — always written
   - `ata-YYYYMMDD-HHMMSS.md` — written only when minutes were generated

## Notes

- Requires a local install of `faster-whisper` or `whisper`, plus `ffmpeg`. This skill does not call a cloud API.
- Whisper is by OpenAI; faster-whisper is the CTranslate2 reimplementation.
- For files over 25 MB or longer than 30 minutes, warn the user about wall-clock time before running.
- Meeting minutes quality depends on transcript quality — short, clear recordings produce better minutes than long, noisy ones.
