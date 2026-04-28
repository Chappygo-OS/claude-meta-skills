---
name: prompt-master
description: Converts unstructured brain dumps into optimized prompts — apply once manually or embed in Claude's instructions to run automatically
---

# Prompt Master

Claude is ready to act on whatever you give it. That's a problem when your input is a messy voice-transcribed brain dump. This skill restructures any prompt according to best practices — clear goal, context, format, constraints — before Claude executes it. Works manually or embedded as an automatic step.

## Usage

```
/prompt-master [your unstructured prompt or brain dump]
```

Or add at the end of any long prompt:
```
...Please optimize this prompt using the prompt-master skill before running it.
```

## Auto-mode (recommended)

Add this to your Claude Code general instructions or CLAUDE.md:

```
Every time I use a medium to long unstructured prompt for a complex task,
auto-run the prompt-master skill on the input before processing.
```

Claude will then automatically optimize every complex prompt without being asked.

## Instructions for Claude

When this skill is invoked with a prompt:

1. **Read the input fully** before doing anything else.

2. **Identify the core intent** — what is the user actually trying to accomplish? State it in one sentence.

3. **Diagnose the issues** — briefly note what's unclear, missing, or unstructured (don't show this to the user unless they ask).

4. **Rewrite the prompt** applying these best practices:
   - **Goal**: one clear sentence stating the desired outcome
   - **Context**: relevant background the model needs to produce a good output
   - **Role**: assign Claude a specific role if it improves the output
   - **Format**: specify the output format (list, table, markdown, JSON, etc.)
   - **Constraints**: word count, tone, language, things to avoid
   - **Examples**: include a brief example of good output if the task is ambiguous
   - **Chain of thought**: add "Think step by step" for reasoning-heavy tasks

5. **If a second brain or OS context is available**, pull relevant context (voice, style, past decisions) and embed it directly into the optimized prompt.

6. **Output the optimized prompt** in a code block so it's easy to copy.

7. **Run the optimized prompt** immediately unless the user asked only for the optimization.

## Notes

- Works best on prompts over 3 sentences or voice-transcribed inputs.
- The auto-mode setup is the highest-leverage way to use this skill — set it once and forget it.
