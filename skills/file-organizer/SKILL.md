---
name: file-organizer
description: Reversible directory cleanup — analyzes a folder, proposes a structure, waits for explicit approval, then executes with a full undo log — run on Downloads, Desktop, project folders, or shared drives
---

# File Organizer

Folder cleanups go wrong when an agent moves files first and asks questions later. This skill never does that. It analyzes, proposes, waits for an explicit yes, then executes — and logs every move so the whole session is reversible. Safe to run on any folder you care about.

## Usage

```
/file-organizer [absolute path to directory]
```

Examples:
```
/file-organizer ~/Downloads — clean up before backup
/file-organizer ~/Desktop — light tidy, leave active work alone
/file-organizer /Volumes/SharedDrive/inherited — find duplicates, propose structure
```

## Instructions for Claude

When this skill is invoked:

1. **Clarify the scope** — confirm the absolute path, the actual pain (findability / duplicates / clutter / no structure), what stays untouched (e.g., a `Working/` folder, anything modified in the last 7 days), and how aggressive to be (light tidy / standard / deep restructure).

2. **Analyze the current state** — run `ls -la` for the top level, `file` for type sniffing (extensions lie, headers don't), and `du -sh` sorted by size for the biggest subfolders. Build an extension histogram.

3. **Pick an organization axis** based on what the analysis reveals:
   - **By type** — when the folder is a junk drawer of formats (Documents, Images, Videos, Archives, Code).
   - **By purpose** — when work and personal mix, or active and archive mix.
   - **By date** — when most files are time-bound (receipts, invoices, screenshots).

4. **Find duplicates** with three independent passes: md5 hash equality (definitive), same filename across paths (likely), same byte size within tolerance (suggestive — surface, don't auto-delete). For each cluster, recommend which to keep.

5. **Propose the plan** as a markdown document with: current state summary, ASCII tree of the proposed structure, a Changes I'll Make list, a Files Needing Your Decision block for anything ambiguous, and an explicit approval prompt. Do not move anything until the user replies "yes".

6. **Execute on approval** — `mkdir -p` for new directories, `mv` for relocations (never copy-then-delete), preserve mtimes, log every source-to-destination move to a session undo file, and append a numeric suffix on collisions. Always confirm before any deletion.

7. **Summarize** — output counts (moved / renamed / archived / deleted), the new tree, and a maintenance cadence (weekly Downloads sweep / monthly archive / quarterly dedupe / yearly cold-storage).

## Notes

- The undo log is the safety net. Keep it for the session — if anything looks wrong, every move can be reversed.
- Default to archive-before-delete. The recovery cost of "I needed that" beats the storage cost of one more quarter.
- If the user says "just nuke it", slow them down and produce the proposal anyway. Reversible by design.
