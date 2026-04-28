# RECIPES — Skill Combination Playbook

How to combine the skills in this repo to handle real workflows end-to-end. Each recipe is a tested sequence of skill calls.

---

## Recipe 1: Research → Verify → Publish

**Use case**: You want to write and publish a piece of content that's factually accurate.

**Problem**: AI-generated research is fast but often contains fabricated statistics, outdated claims, and confident errors.

**Steps**:
```
1. /deep-research [topic or question]
   → Get a verified, cited research report

2. /fact-checker [your draft content that uses the research]
   → Verify every claim in the draft against the research and external sources

3. /humanizer [the fact-checked draft]
   → Remove AI writing markers before publishing
```

**When to use**: Articles, LinkedIn posts, video scripts, sales decks — anything that will be read by people who might fact-check you.

---

## Recipe 2: Idea → Optimized Prompt → Great Output

**Use case**: You have an idea in your head but you're getting mediocre outputs from Claude.

**Problem**: The gap between what you want and what Claude produces is usually a prompt quality gap, not a model capability gap.

**Steps**:
```
1. Brain dump your idea in natural language

2. /prompt-master [your brain dump]
   → Get a structured, optimized prompt with the right role, context, format, and constraints

3. Run the optimized prompt
   → Get the output you actually wanted

4. /humanizer [the output] — if it's written content
   → Remove any AI writing markers before using it
```

**When to use**: Any time the first attempt at a prompt gives underwhelming results. Set prompt-master to auto-mode to make this the default.

---

## Recipe 3: Big Decision — Structured Analysis

**Use case**: A significant decision is coming and you want to think it through properly, not just gut-feel it.

**Problem**: Decisions made under time pressure without a framework often have obvious-in-retrospect blind spots.

**Steps**:
```
1. /deep-research [relevant market, competitive, or factual context]
   → Get the factual foundation the decision needs

2. /decision-toolkit [the decision you're facing]
   → Apply the 9-lens first-principles framework with the research as context

3. /fact-checker [any specific claims in your decision framing]
   → Verify that the assumptions you're making are factually correct
```

**When to use**: Pricing changes, hiring decisions, product bets, partnership evaluations, major spending decisions.

---

## Recipe 4: Build a New Skill (The Right Way)

**Use case**: You want a custom skill for a workflow you do repeatedly.

**Problem**: Building a skill without a good spec produces a skill that does what you described, not what you meant.

**Steps**:
```
1. /find-skills [what you want to build]
   → Check if it already exists before building

   If no good match:

2. /process-interviewer [what you want to build or automate]
   → Deep interview to produce a full PRD

3. /prompt-master [paste the PRD]
   → Optimize the PRD as a prompt for building the skill

4. Build the skill from the optimized PRD
   → One session, one clear spec, no guessing
```

**When to use**: Any time you're about to build a skill. This sequence prevents the "build → test → rebuild → repeat" loop.

---

## Recipe 5: Connect Claude to Any Tool

**Use case**: You want Claude to read from or write to a tool that doesn't have a native MCP integration.

**Problem**: Claude's capabilities are bounded by its integrations. Without MCP, everything is copy-paste.

**Steps**:
```
1. /process-interviewer Build an MCP server for [tool]
   → Interview to define exactly which operations you need

2. /mcp-builder [software name and API docs URL]
   → Build the MCP server file + config JSON + install guide

3. Install the MCP server
   → Follow the step-by-step install guide

4. Test: ask Claude to use the new tool
   → Verify each operation works as expected
```

**When to use**: Any time you're doing repetitive copy-paste between Claude and a tool (CRM, spreadsheet, project management tool, email platform, database).

---

## Recipe 6: Meeting → Action

**Use case**: You had a meeting, have a recording or notes, and need everything documented and actioned.

**Problem**: Meeting outputs decay fast. The longer between the meeting and the documentation, the less useful it becomes.

**Steps**:
```
1. /audio-transcriber [recording or transcript] → meeting notes
   → Get clean meeting notes with decisions, action items, and open questions

2. /humanizer [drafted follow-up email]
   → Clean any AI markers from the follow-up email before sending

3. [if CRM connected via MCP]: add notes directly to the deal/contact record
```

**When to use**: After every significant meeting — sales calls, client check-ins, team retrospectives, strategic discussions.

---

## Recipe 7: Competitive Intelligence Report

**Use case**: You need to understand the competitive landscape before making a product or marketing decision.

**Steps**:
```
1. /deep-research [competitor category or market]
   → Get a structured overview of who the players are and their positioning

2. /agent-browser [competitor URLs] — extract pricing and feature pages
   → Get current pricing and feature data directly from their websites

3. /fact-checker [the combined research]
   → Flag outdated or unverifiable claims

4. /frontend-slides Create a competitive analysis deck
   → Turn the intelligence into a shareable presentation
```

**When to use**: Before a product launch, pricing change, fundraise, or sales playbook update.

---

## Recipe 8: Voice Note → Published Post

**Use case**: You think better by talking than writing, and you want to turn your voice notes into polished content.

**Problem**: Raw voice note transcripts are stream-of-consciousness and not directly publishable.

**Steps**:
```
1. Transcribe your voice note (Otter, Whisper, or native phone transcription)

2. /audio-transcriber [transcript] → blog post draft
   → Extract the core ideas and structure them into a draft

3. /fact-checker [the draft]
   → Verify any specific claims made while talking

4. /humanizer [the verified draft]
   → Remove AI rewriting artifacts and restore your authentic voice

5. Review and publish
```

**When to use**: Regular content creators, founders who share thought leadership, consultants who document their thinking.

---

## Recipe 9: Optimize Any Existing Process

**Use case**: You have a workflow that works but is slow, inconsistent, or depends too much on you manually.

**Steps**:
```
1. /process-interviewer [describe the current process]
   → Document the current process completely, identify where it breaks down

2. /decision-toolkit Should I automate this, delegate it, or redesign it?
   → Apply the decision framework to whether and how to change the process

3. /prompt-master [optimized version of the new process]
   → Turn the redesigned process into a clean, executable prompt

4. /find-skills [the redesigned process]
   → Check if a skill already exists for the new version

   Or:

5. Build a custom skill from the process-interviewer PRD
```

**When to use**: Quarterly process reviews, onboarding new team members to existing workflows, identifying automation opportunities.

---

## Recipe 10: Research-Backed Decision Presentation

**Use case**: You need to present a decision and its rationale to stakeholders — leadership, investors, or a client.

**Steps**:
```
1. /deep-research [the relevant context]
   → Build the factual foundation

2. /decision-toolkit [the decision]
   → Work through the structured analysis

3. /fact-checker [the decision document]
   → Verify every claim before presenting it

4. /frontend-slides Create a decision presentation
   → Build a deck that walks through the decision, the options, the analysis, and the recommendation

5. /humanizer [any written narrative in the deck]
   → Ensure the language is clear and human
```

**When to use**: Board meetings, investor updates, major client proposals, strategic offsites.

---

## Skill Dependency Map

```
find-skills ─────────────────── (always first, before building)
     │
     └──> process-interviewer ──> prompt-master ──> [build skill]

deep-research ──> fact-checker ──> humanizer ──> [publish]

audio-transcriber ──> humanizer ──> [publish or CRM]

decision-toolkit ──> deep-research (for context)
                 └──> fact-checker (for assumptions)

mcp-builder ──> process-interviewer (for scope)
            └──> [connects all skills to external tools]

frontend-slides ──> humanizer (for text)
               └──> fact-checker (for data)
```
