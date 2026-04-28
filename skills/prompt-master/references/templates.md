# Prompt Master template library

This file is loaded on demand when SKILL.md needs the full skeleton for a specific prompt framework. Twelve frameworks are catalogued: classic structures (RTF, CO-STAR, RISEN, CRISPE), reasoning patterns (Chain of Thought, Few-Shot), file-scoped coding (File-Scope, ReAct + Stop Conditions), visual generation (Visual Descriptor, Reference Image Editing, ComfyUI), and a Prompt Decompiler for adapting an existing prompt to a new tool. Framework names never appear in the user-facing output — they live inside the engine.

## Framework selection cheat sheet

| Tag | Name | Use it when |
|---|---|---|
| A | RTF | The simplest fast prompt that needs role + task + format |
| B | CO-STAR | Marketing, copywriting, brand-voice work that needs tone and audience nuance |
| C | RISEN | A multi-step instruction with a defined end state and narrowing constraints |
| D | CRISPE | Exploratory or creative tasks that benefit from personality and experimentation |
| E | Chain of Thought | Math, logic, and multi-step reasoning on a non-reasoning-native model |
| F | Few-Shot | The model needs a pattern to imitate; format or style is hard to describe |
| G | File-Scope | Coding agents (Cursor, Cline, Windsurf) — surgical edits within named files |
| H | ReAct + Stop | Agentic runs (Claude Code, Devin, browser agents) that take real actions |
| I | Visual Descriptor | Text-to-image prompts (Midjourney, DALL-E 3, SeeDream, Stable Diffusion) |
| J | Reference Image Editing | Image-to-image edits where a reference is attached |
| K | ComfyUI | Local Stable Diffusion workflows — split into POSITIVE and NEGATIVE blocks |
| L | Prompt Decompiler | Adapting an existing prompt to a different tool or splitting a mega-prompt |

## A — RTF (Role / Task / Format)

**Use when** the task is small and well-defined. Single-purpose prompts where the user already knows what they want.

**Skeleton**

```
You are a [ROLE].
Your task is to [TASK].
Output in [FORMAT].
```

**Example**

```
You are a senior Python code reviewer.
Your task is to review the function below for performance issues only.
Output a numbered list of findings, each with line number and a one-line fix.
```

## B — CO-STAR (Context / Objective / Style / Tone / Audience / Response)

**Use when** the prompt needs to control voice and audience perception, not just task output.

**Skeleton**

```
# Context
[Background the model needs.]

# Objective
[What success looks like.]

# Style
[Sentence rhythm, structural constraints.]

# Tone
[Emotional register: warm, clinical, urgent...]

# Audience
[Who reads this and what they care about.]

# Response
[Output format and length bound.]
```

**Example**

```
# Context
Cybersecurity SaaS launching a free tier for solo developers.

# Objective
Write the launch announcement post for LinkedIn.

# Style
Short paragraphs. One concrete number. No bullet lists.

# Tone
Direct, slightly self-deprecating, technical.

# Audience
Indie developers and small-team CTOs who already know what a CSPM is.

# Response
180–220 words, ending with a one-line call-to-action.
```

## C — RISEN (Role / Instructions / Steps / End Goal / Narrowing)

**Use when** the prompt is procedural — it has named steps and a defined final state.

**Skeleton**

```
Role: [ROLE]
Instructions: [overall directive]
Steps:
  1. [Step]
  2. [Step]
  3. [Step]
End Goal: [what completion looks like]
Narrowing: [hard constraints, what to avoid]
```

**Example**

```
Role: Onboarding specialist
Instructions: Draft a 5-day welcome sequence for new SaaS users.
Steps:
  1. Day 1 — orientation email
  2. Day 2 — first feature walkthrough
  3. Day 3 — case study
  4. Day 4 — invitation to office hours
  5. Day 5 — feedback ask
End Goal: Five emails, each ≤150 words, in plain text.
Narrowing: No discounts. No "I hope this finds you well." No emojis.
```

## D — CRISPE (Capacity / Role / Insight / Statement / Personality / Experiment)

**Use when** the request is creative and benefits from a defined point of view plus permission to try variants.

**Skeleton**

```
Capacity: [domain expertise]
Role: [persona for the run]
Insight: [non-obvious frame the model should hold]
Statement: [the actual ask]
Personality: [voice and quirks]
Experiment: [how to vary attempts]
```

**Example**

```
Capacity: Brand strategist with 15 years in DTC consumer goods
Role: Creative director presenting to the founder
Insight: The category is saturated; differentiation comes from tone, not features.
Statement: Pitch three positioning angles for a new electrolyte drink.
Personality: Sharp, witty, no jargon, willing to disagree with the brief.
Experiment: Each angle should reject one assumption in the brief.
```

## E — Chain of Thought

**Use when** the task is multi-step reasoning AND the target is a non-reasoning-native model. Never apply on o3, o4-mini, DeepSeek-R1, or Qwen3 in thinking mode — those models do their own reasoning and forced chains hurt them.

**Skeleton**

```
[Task statement.]

Think through this step by step:
1. [First reasoning prompt]
2. [Second reasoning prompt]
3. [Third reasoning prompt]
4. [Fourth reasoning prompt]

Then output your final answer in [FORMAT].
```

**Example**

```
A train leaves Station A at 60 mph. Another leaves Station B at 80 mph
heading toward each other. The stations are 280 miles apart.

Think through this step by step:
1. State each train's speed and direction.
2. Compute the closing speed.
3. Divide distance by closing speed for the meeting time.
4. Sanity-check the answer.

Output the answer in hours and minutes.
```

## F — Few-Shot

**Use when** the desired output pattern is hard to describe but easy to demonstrate. Use 2–5 examples — never more.

**Skeleton**

```
[Instruction]

<example>
  <input>...</input>
  <output>...</output>
</example>

<example>
  <input>...</input>
  <output>...</output>
</example>

Now process this:
<input>...</input>
```

**Example**

```
Convert each meeting note into a one-line action item with owner.

<example>
  <input>Sales mentioned the new pricing page is confusing customers — the marketing lead said they'd take a look this week.</input>
  <output>Marketing lead: revise pricing page (this week)</output>
</example>

<example>
  <input>Engineering wants two weeks of soak time on the payments rewrite, the platform team owns it.</input>
  <output>Platform team: two weeks soak time on payments rewrite</output>
</example>

Now process this:
<input>...</input>
```

## G — File-Scope

**Use when** working with coding agents (Cursor, Cline, Windsurf, Continue) and the change must be surgical.

**Skeleton**

```
File: [path]
Function: [function or component]

Current behavior: [what it does now]
Desired change: [what it should do]

Do not touch:
- [path or scope]

Constraints:
- [build / type / test invariant]

Done when:
- [verifiable check 1]
- [verifiable check 2]
```

**Example**

```
File: src/components/Checkout.tsx
Function: CheckoutPage

Current behavior: reads cart state via legacy CartContext.useContext.
Desired change: replace all CartContext reads with the new useCart() hook.

Do not touch:
- src/components/Header.tsx
- any file outside src/components/Checkout/

Constraints:
- TypeScript strict mode must still compile
- Keep existing test ids intact

Done when:
- All CartContext imports removed from Checkout.tsx
- npm run typecheck passes
- npm test -- Checkout passes
```

## H — ReAct + Stop Conditions

**Use when** the agent takes real actions (Claude Code, Devin, SWE-agent, browser agents). Stop conditions are mandatory — without them the agent over-runs.

**Skeleton**

```
Objective: [the goal]

Start state: [where the agent is now]
Target state: [where the agent should be]

Allowed tools: [list]
Forbidden tools: [list]

Stop when:
- [condition 1]
- [condition 2]

Checkpoints (write OK after each):
- [check 1]
- [check 2]
```

**Example**

```
Objective: Open the deployment dashboard, find the failing build, copy the error.

Start state: Logged into Vercel, on /dashboard.
Target state: Error message pasted into the conversation.

Allowed tools: navigate, click, screenshot, copy_text
Forbidden tools: form_submit, file_upload

Stop when:
- The error message has been captured
- OR three navigation attempts have failed

Checkpoints:
- OK after locating the project
- OK after locating the failing build
- OK after copying the error
```

## I — Visual Descriptor

**Use when** generating images on Midjourney, DALL-E 3, Stable Diffusion, or SeeDream. Front-load the subject; technical parameters go last.

**Skeleton**

```
[SUBJECT], [ACTION], [SETTING], [STYLE], [MOOD], [LIGHTING],
[PALETTE], [COMPOSITION], --ar [ASPECT] --style [MODE]
--no [NEGATIVE LIST]
```

**Example**

```
matte black ceramic mug, soft steam rising from rim, sitting on raw polished
concrete countertop, low warm window light from camera left, deep shadows,
shallow depth of field, editorial product photography, neutral palette with
single warm amber highlight, centered composition with slight rule-of-thirds
offset, --ar 4:5 --style raw --no text, logo, plastic, glossy plastic
```

## J — Reference Image Editing

**Use when** the user attaches a reference image and wants targeted changes. The "keep" / "change" split prevents the model from rewriting everything.

**Skeleton**

```
[Precondition: reference image attached.]

Keep:
- [element]
- [element]

Change:
- [element] → [target]
- [element] → [target]

How much: [subtle / moderate / aggressive]
Style consistency: [match reference / new style / hybrid]
Negative: [what must not appear]
```

**Example**

```
[Reference image: portrait of a person in a blue blazer against a brick wall.]

Keep:
- Pose
- Lighting
- Brick wall

Change:
- Blue blazer → black turtleneck
- Background brick → white studio backdrop

How much: moderate
Style consistency: match reference
Negative: no logos, no text
```

## K — ComfyUI

**Use when** the runtime is local Stable Diffusion via ComfyUI. Always ask the checkpoint first (SD 1.5 / SDXL / Flux) — it changes how prompts are weighted.

**Skeleton**

```
[Precondition: confirm checkpoint = SD 1.5 / SDXL / Flux]

POSITIVE:
[comma-weighted tokens]

NEGATIVE:
[comma-weighted tokens]
```

**Example**

```
[Checkpoint: SDXL]

POSITIVE:
cinematic portrait, woman in late 30s, soft window light, freckles,
honey blonde hair, beige linen shirt, neutral palette, 35mm film,
shallow depth of field, photorealistic skin texture

NEGATIVE:
plastic skin, oversaturated, deformed hands, extra fingers, text,
watermark, cartoon, low resolution
```

## L — Prompt Decompiler

**Use when** the user has an existing prompt that needs to be adapted (different tool), simplified (too long), or split (multi-task overload). Four sub-tasks run in order.

**Skeleton**

```
1. Break down — list every distinct instruction in the source prompt
2. Adapt — translate each instruction to the target tool's idiom
3. Simplify — collapse redundancies, remove decorative language
4. Split — if the result is still multi-task, propose two prompts

Source prompt:
[paste]

Target tool:
[name]
```

**Example**

```
1. Break down — the source has six instructions: research X, summarize, write
   a blog post, generate three image prompts, output JSON, send to Slack.
2. Adapt — for Claude Code, drop the Slack step (use a hook); convert image
   prompts to a separate Midjourney call.
3. Simplify — remove "please make sure to" and "very important" qualifiers.
4. Split — research + summarize is one prompt; blog post + image prompts is
   a second prompt; the JSON output applies only to step 1.
```

## When two frameworks both fit

If RTF and CO-STAR both seem viable, pick RTF — shorter prompts win when the extra structure isn't earning its tokens. If CoT and Few-Shot both seem viable on a non-reasoning model, pick Few-Shot — examples are more reliable than instructions. Never combine more than two frameworks; layered structures degrade quality.
