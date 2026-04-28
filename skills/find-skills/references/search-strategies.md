# Search Strategies Reference

Used by `/find-skills`. How to search skills.sh effectively for different types of tasks.

---

## Core Search Principle

Search for **the task**, not the tool. Use language that describes the desired outcome.

- Bad: "ChatGPT email"
- Good: "write follow-up emails from meeting notes"

---

## Search Term Strategies

### Strategy 1: Outcome-first

Describe what you want the output to look like.

```
"generate a weekly newsletter"
"summarize a PDF into bullet points"
"write a proposal from a project brief"
```

### Strategy 2: Process description

Describe the transformation you want.

```
"turn meeting notes into action items"
"convert bullet points into a LinkedIn post"
"extract tasks from an email thread"
```

### Strategy 3: Platform + action

When the task is platform-specific.

```
"LinkedIn post writer"
"Notion database from interview"
"Slack standup summary"
"HubSpot CRM update from call notes"
```

### Strategy 4: Problem-first

Describe the pain point, not the solution.

```
"AI text sounds too formal"
"spending too long writing proposals"
"clients send vague briefs"
```

### Strategy 5: Synonym sweep

If the first search returns thin results, try synonyms and related terms.

| First search | Try also |
|-------------|---------|
| "email writing" | "email copywriting", "cold email", "email template" |
| "meeting summary" | "call recap", "meeting notes", "transcript summary" |
| "social media" | "content calendar", "LinkedIn", "social copy" |
| "proposal" | "quote", "scope of work", "SOW", "client brief" |

---

## High-Signal Search Patterns by Category

### Writing tasks
```
[output type] writer  → "LinkedIn post writer", "newsletter writer"
[input] to [output]   → "transcript to blog post", "bullets to email"
[platform] [format]   → "Twitter thread from article"
```

### Research tasks
```
[topic] research      → "competitor research", "market research"
[source] analysis     → "PDF analysis", "document summary"
[type] report         → "SEO audit report", "competitive analysis"
```

### Communication tasks
```
[channel] [action]    → "email follow-up", "Slack reply draft"
[situation] response  → "cold outreach", "support ticket response"
```

### Automation tasks
```
automate [process]    → "automate lead qualification"
[workflow] automation → "CRM update automation"
[trigger] to [action] → "form submission to email sequence"
```

### Development tasks
```
[framework] [task]    → "React component generator"
[language] [type]     → "Python script from description"
code review [type]    → "code review TypeScript"
```

---

## Multi-Search Workflow

For important tasks, don't stop at the first search. Run 3 searches and compare results:

1. **Primary search**: most direct description of the task
2. **Synonym search**: alternative terminology for the same task
3. **Problem-first search**: the pain the task solves

If all three return weak results → build custom.
If two of three return strong results → pick the best from the overlap.

---

## Filtering Results

When you have many results, apply these filters in order:

1. **Install count** ≥ 100 (community-validated)
2. **Last updated** ≤ 18 months (relevant to current tools)
3. **Scope fit**: description matches the task specifically
4. **Author history**: check if the author has other well-regarded skills

---

## When to Stop Searching

Stop searching and recommend building when:

- After 5+ searches, no skill scores well on quality gates
- The task is highly specific to the user's exact workflow
- The closest match requires manual adaptation of >30% of its instructions
- The user says "I've tried X and Y and they don't work right"

Transition phrase:
> "I've searched across several query angles and nothing fits closely. Let me run `/process-interviewer` to spec out a custom skill that matches exactly what you need."
