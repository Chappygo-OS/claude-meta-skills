---
name: file-organizer
description: Analyzes a messy file structure and produces a clean organization system — with a migration plan you approve before anything moves
---

# File Organizer

Messy file systems cost time every day. Wrong folder. Duplicate files. Outdated naming. Files with names like "final_FINAL_v3_USE-THIS.docx". This skill analyzes your existing file structure, proposes a clean organization system based on your work patterns, and generates a migration plan. Nothing moves until you approve it.

## Usage

```
/file-organizer
```

Then follow the interview to describe your current situation and what you need.

Or with a specific directory:
```
/file-organizer Organize my ~/Desktop — it's a disaster
/file-organizer Propose a file structure for a new client project
/file-organizer I need a naming convention for [type of files]
```

## Instructions for Claude

When this skill is invoked:

### 1. Understand the scope

Ask:
- What are we organizing? (Desktop, Downloads, a project folder, a shared drive, a specific file type)
- What tool or OS are you using? (macOS Finder, Windows Explorer, Google Drive, Notion, Dropbox)
- Is this existing files (need to migrate) or a new structure (need to design from scratch)?
- How many files roughly? (Dozens / hundreds / thousands)
- Are there other people who will use this system?

### 2. Analyze the current state

If Claude has file system access:
- List the current directory structure (2–3 levels deep)
- Identify: duplicates, naming inconsistencies, files in the wrong location, outdated files, files with no clear owner

If Claude does not have file system access:
- Ask the user to paste a directory listing (`ls -la` or `tree /F` on Windows)
- Or describe the main categories of files they have

### 3. Interview for work patterns

Before proposing any structure, understand how the user actually works:

1. What are the 5 most common types of work you do that generate files?
2. How do you most often search for files — by project, by date, by type, or by client?
3. Do you have any existing conventions (even informal ones) that you like?
4. What are the biggest pain points with the current structure?
5. Are there files you never touch but need to keep? (Archives)
6. Do you collaborate with others on these files?

### 4. Propose the new structure

Based on the interview, propose a folder structure:

```
## Proposed Structure for [Location]

[structure displayed as a tree]

### Naming conventions

Files: [naming pattern — e.g., YYYY-MM-DD_client_description]
Projects: [naming pattern]
Versions: [how to handle versioning]
Archives: [naming and location]

### Key decisions

- [Why I organized it this way]
- [Alternative I considered and rejected]
- [Any assumptions I made]
```

**Principles applied**:
- Organize by how you **search**, not by how files are **created**
- Max 3 levels deep — deeper hierarchies cause navigation fatigue
- Date-first naming (`2025-04-28_`) enables chronological sorting
- Consistent prefixes make scanning fast
- One archive folder per project/year, not scattered everywhere

### 5. Present the migration plan

Before moving anything:

```
## Migration Plan

### Files to move
| Current location | New location | Reason |
|-----------------|-------------|--------|
| [path] | [path] | [why] |

### Files to archive
| File | Location | Reason |
|------|---------|--------|
| [path] | archive/[path] | [why — unused since X, superseded by Y] |

### Files to delete (review carefully)
| File | Reason |
|------|--------|
| [path] | Duplicate of [path] |
| [path] | Empty file |

### Naming changes
| Current name | New name | Reason |
|-------------|---------|--------|
| [name] | [name] | [convention applied] |
```

**Do not execute any moves until the user approves the plan.**

### 6. Generate the migration script (optional)

If the user approves the plan and wants to automate it:

**macOS / Linux (bash)**:
```bash
#!/bin/bash
# File Organization Migration
# Generated: [date]
# REVIEW THIS BEFORE RUNNING

mkdir -p "[new/folder/path]"
mv "[old/path/file]" "[new/path/file]"
# ... all moves listed
```

**Windows (PowerShell)**:
```powershell
# File Organization Migration
# Generated: [date]
# REVIEW THIS BEFORE RUNNING

New-Item -ItemType Directory -Path "[new\folder\path]"
Move-Item "[old\path\file]" "[new\path\file]"
```

**Google Drive / cloud storage**: provide the manual steps in order.

### 7. Maintenance rules

After organizing, document 3–5 maintenance rules:
- "New project files go in `/Active/[client]/[project]/`"
- "Archive a project when it's been inactive for 3 months"
- "Never save to Desktop — use it as a temporary staging area only"
- "Add date prefix to any file that will have multiple versions"

## Skill integrations

- **`/process-interviewer`** — if you need to design a team-wide file system, interview stakeholders first
- **`/decision-toolkit`** — if you're deciding between organizing by client vs. project vs. date

## Notes

- Never move files without user review and approval. Lost files are a real cost.
- For shared drives (Google Drive, Dropbox, OneDrive): consider that others may have bookmarked specific paths. Moving files breaks those bookmarks — plan communications alongside the migration.
- For very large reorganizations (1,000+ files): break into phases and tackle one category at a time.
