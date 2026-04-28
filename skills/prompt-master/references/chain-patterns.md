# Prompt Chain Patterns

Used by `/prompt-master`. Multi-step prompt patterns for complex tasks that require sequential processing.

---

## Pattern 1: Research → Synthesize → Format

**When to use**: When you need to gather information, then analyze it, then deliver it in a specific format.

```
## Step 1: Research
Search for [topic]. Collect:
- [Specific data point 1]
- [Specific data point 2]
- [Specific data point 3]
Note sources. Do not synthesize yet — just collect.

---

## Step 2: Synthesize (uses Step 1 output)
Based on the research above:
- What are the 3 most important findings?
- What conflicts or contradictions exist in the data?
- What is missing that would change the conclusion?

---

## Step 3: Format (uses Step 2 output)
Format the synthesis as [brief / report / table / slides outline]:
[Exact output specification]
```

---

## Pattern 2: Draft → Critique → Revise

**When to use**: Writing tasks where quality matters enough to warrant a self-review pass.

```
## Step 1: Draft
Write a first draft of [content type] about [topic].
Target: [audience, tone, length]
Do not over-edit — produce a complete draft quickly.

---

## Step 2: Critique (uses Step 1 output)
Review the draft above against these criteria:
1. Does it open with the strongest point? If not, reorder.
2. Are there any AI writing markers? (List them)
3. Is every claim specific? (Flag vague ones)
4. Is the length right for the format?
Rate each dimension: [pass / fix / rewrite]

---

## Step 3: Revise (uses Step 1 + Step 2 output)
Revise the draft addressing all "fix" and "rewrite" items from the critique.
Do not change anything rated "pass."
Deliver the revised version only — no commentary.
```

---

## Pattern 3: Extract → Transform → Validate

**When to use**: Data processing tasks where accuracy matters and the transformation has clear rules.

```
## Step 1: Extract
From the input below, extract:
- [Field 1]: [definition and format]
- [Field 2]: [definition and format]
- [Field 3]: [definition and format]
If a field is missing, mark it as "NOT FOUND".
Do not infer or fill in values that aren't present.

Input:
[data]

---

## Step 2: Transform (uses Step 1 output)
Apply these transformations to the extracted data:
- [Rule 1]
- [Rule 2]
Output as [JSON / CSV / table].

---

## Step 3: Validate (uses Step 2 output)
Check the output against these rules:
- [ ] All required fields are present
- [ ] [Specific validation rule]
- [ ] [Specific validation rule]
If any check fails, list the failures. Do not silently pass.
```

---

## Pattern 4: Understand → Specify → Build

**When to use**: Building a skill, workflow, automation, or tool. Ensures the spec is solid before implementation.

```
## Step 1: Understand
Read the following description of what I want to build:
[description]

Restate in your own words:
1. What this does (one sentence)
2. What the input is
3. What the output is
4. The 3 most important edge cases
Ask: "Is this correct?"

---

## Step 2: Specify (after confirmation)
Write a detailed specification:
- Trigger and inputs
- Step-by-step process
- Output format
- Edge case handling
- What it should NOT do

---

## Step 3: Build (uses Step 2 output)
Implement the specification above exactly.
Do not add features not in the spec.
Mark any assumptions you made.
```

---

## Pattern 5: Brainstorm → Filter → Develop

**When to use**: Ideation tasks where you need many ideas first, then quality filtering, then development of the best ones.

```
## Step 1: Brainstorm
Generate [N] ideas for [topic].
No filtering. No editing. Include obvious ideas, wild ideas, and everything between.
Format: numbered list, 1 sentence each.

---

## Step 2: Filter (uses Step 1 output)
From the list above, select the [3-5] strongest ideas using these criteria:
1. [Criterion 1]
2. [Criterion 2]
3. [Criterion 3]
Explain the selection in one sentence per idea.

---

## Step 3: Develop (uses Step 2 output)
Develop each selected idea into a full [format: concept brief / outline / detailed plan]:
[Exact specification of what "developed" means]
```

---

## Pattern 6: Parallel Analysis (for decisions)

**When to use**: Decision-making where you want two independent perspectives before synthesizing.

```
## Analyst A: Argue for [Option 1]
Make the strongest possible case for [Option 1].
Include: rationale, evidence, risks addressed, timeline.
Do not mention [Option 2].

---

## Analyst B: Argue for [Option 2]
Make the strongest possible case for [Option 2].
Include: rationale, evidence, risks addressed, timeline.
Do not mention [Option 1].

---

## Synthesis: Compare and Surface Tensions
Given both arguments above:
1. What does each argument assume that the other challenges?
2. What factual questions would resolve the disagreement?
3. Under what conditions is Option 1 better? Option 2?
Do not give a recommendation. Surface the tensions.
```

---

## When to Use Chains vs. Single Prompts

Use a chain when:
- The task has genuinely distinct phases (research ≠ synthesis ≠ formatting)
- An error in an early step would propagate badly without a checkpoint
- The quality bar is high enough to warrant a review pass
- The task is long enough that a single prompt would exceed quality thresholds

Use a single prompt when:
- The task is well-defined and straightforward
- The output can be verified at a glance
- Speed matters more than maximum quality
- Chaining would add complexity without adding quality
