# Skill Quality Gates

Used by `/find-skills`. Evaluation rubric for assessing a skill before recommending or installing it.

---

## Quick Scoring Card

Score each dimension 1–3. Total score ≥ 12 = recommend. 8–11 = recommend with caveats. < 8 = suggest building instead.

| Dimension | 1 (weak) | 2 (ok) | 3 (strong) |
|-----------|----------|--------|------------|
| Install count | < 50 | 50–500 | 500+ |
| Last updated | 2+ years ago | 6–24 months | < 6 months |
| Description clarity | Vague | Partially clear | Specific and concrete |
| Scope fit | Loose match | Partial match | Direct match |
| Author reputation | Unknown | Some history | Established author |

---

## Dimension 1: Install Count

**What it signals**: Community validation. More installs = more real-world testing.

| Count | Interpretation |
|-------|---------------|
| < 50 | Very new or very niche. Higher risk of undiscovered bugs. |
| 50–500 | Reasonably validated. Worth considering if it fits well. |
| 500–5,000 | Strong community validation. Low risk. |
| 5,000+ | Widely used. Almost certainly reliable for its stated purpose. |

**Caveat**: High install count for a 3-year-old skill may mean it was once popular but is now outdated. Always check the last-updated date alongside install count.

---

## Dimension 2: Freshness (Last Updated)

**Why it matters**: Skills age quickly, especially those that reference specific tools, APIs, or models.

| Last updated | Interpretation |
|-------------|---------------|
| < 3 months | Actively maintained |
| 3–12 months | Probably fine for stable tasks |
| 12–24 months | Review the instructions — tools it references may have changed |
| 2+ years | Likely outdated. Instructions may reference deprecated tools or old model behaviors. |

**High-staleness risk domains**: AI models, coding tools, API integrations, platform-specific tasks (LinkedIn, X, etc.)

**Low-staleness risk domains**: writing frameworks, decision frameworks, structured interview methodologies

---

## Dimension 3: Description Clarity

A good skill description tells you:
- What it does (specific output or action)
- What input it needs
- What it does NOT do (boundaries)

**Strong description example**:
> "Writes a 500-word LinkedIn post from a topic or bullet points. Humanizes output. Does not post — only generates copy."

**Weak description example**:
> "Helps you write better content for social media."

**Check for**:
- Does the description tell you the expected output format?
- Does it tell you what triggers it?
- Is there clarity about what's in scope vs. out of scope?

---

## Dimension 4: Scope Fit

How well does the skill match what the user is trying to do?

| Fit level | Description |
|-----------|-------------|
| Direct match | The skill does exactly what the user asked. |
| Partial match | The skill does 70–80% of what's needed; the rest requires manual work or another skill. |
| Loose match | The skill is in the same area but would require significant adaptation. |
| No match | Functionally different from what the user needs. |

**Recommendation rule**:
- Direct match → recommend and install
- Partial match → recommend with a note about what it doesn't cover
- Loose match → recommend building instead, or pair with a second skill
- No match → don't recommend; tell the user directly

---

## Dimension 5: Author Reputation

**Check for**:
- Does the author have other published skills? Quality is often consistent across an author's work.
- Are their other skills well-reviewed or highly installed?
- Is the author a known contributor to the Claude/AI skills ecosystem?

**Signals of a reliable author**:
- Multiple published skills with consistent quality
- Skills updated over time (maintenance mindset)
- Detailed instructions with edge cases documented
- Clear author bio or profile on skills.sh

---

## Red Flags — Do Not Recommend If:

- The skill description is copy-pasted filler with no specifics
- The instructions tell Claude to "just be helpful with X" — no structured guidance
- Last updated > 2 years AND references specific tools (the tools have likely changed)
- Install count < 10 AND the skill tackles a complex, high-stakes task
- The skill has no documented error handling or edge cases for a tool-dependent task
- The skill description conflicts with how Claude actually works (e.g., claims to "post to Twitter automatically" without MCP/tool integration)

---

## When to Recommend Building Instead

Recommend `/process-interviewer` and a custom build when:
- No existing skill scores ≥ 10 on the rubric above
- The task is highly specific to the user's business or workflow
- The closest skill requires significant modification
- The user has already tried existing skills and found them inadequate
- The process is core to how the user works and quality matters
