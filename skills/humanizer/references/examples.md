# Humanizer worked examples

This file is loaded on demand when SKILL.md needs full Before / After rewrites with annotated change logs. Four examples cover the most common request types: a legal email, a LinkedIn post, a cold outreach message, and a meeting recap. Each entry shows the AI-flavored draft, the humanized rewrite at the same length or shorter, and a numbered change log naming which patterns from `patterns.md` were removed.

## Example 1 — Legal email about a contract dispute

A paralegal is following up with a client after a call about a regulatory disclosure dispute. The first draft was AI-generated and reads as such.

### Before

> I hope this email finds you well. I wanted to reach out to delve into the matter we discussed and ensure we leverage a robust framework that empowers your team to seamlessly navigate the regulatory landscape. As we move forward together on this journey, please don't hesitate to let me know if you have any questions!

### After

> Following up on our call. The shortest path through the new disclosure rules is the one I sketched on the call: file the Form 5 update first, then push the policy revision to the board in the same packet. I think it works. The risk is the board reads them as one ask and pushes back; we can split them if that happens. Tell me which way you want it.

### Change log

- Pattern #19 (chatbot pleasantries) — dropped "I hope this email finds you well" / "I wanted to reach out"
- Pattern #7 (AI vocab) — removed *delve, leverage, robust, seamlessly, navigate, landscape, journey*
- Pattern #4 (promotional-brochure tone) — replaced "robust framework that empowers your team" with the actual recommendation
- Pattern #22 (filler phrases) — cut "as we move forward together"
- Pattern #24 (generic cheerful conclusions) — replaced "please don't hesitate to let me know if you have any questions!" with a direct ask
- Soul overlay — added an admitted opinion ("I think it works"), an acknowledged risk, and a single concrete next step

## Example 2 — LinkedIn post announcing a partnership

A founder is announcing a new enterprise partnership. The AI draft reads like every other LinkedIn announcement.

### Before

> Today marks a pivotal moment in our journey. We're thrilled to announce a transformative new partnership that will foster a vibrant ecosystem and empower our customers to unlock unprecedented value — not just as a tool, but as a true partner in their success.

### After

> We signed with Acme today. Three months of back-and-forth, two near-walkaways, one weekend I'd rather not repeat. What it means in practice: our customers get same-day shipping in seven new metros starting June 1. That's the whole post. The press release version is on the site if you want the gloss.

### Change log

- Pattern #1 (significance inflation) — removed "Today marks a pivotal moment"
- Pattern #7 (AI vocab) — removed *pivotal, journey, transformative, foster, vibrant, empower, unprecedented*
- Pattern #3 (superficial -ing tails) — cut "transforming, fostering"
- Pattern #9 (negative parallelism) — removed "not just a tool, but a true partner"
- Pattern #4 (promotional-brochure tone) — swapped "ecosystem" / "unlock value" for the concrete operational change
- Soul overlay — added first-person physical detail ("one weekend I'd rather not repeat"), a concrete date, an admitted shortcut to the press release

## Example 3 — Cold outreach message

A B2B founder is cold-emailing a sales leader about a coaching tool. The AI draft is interchangeable with every cold email the recipient gets that week.

### Before

> I hope this message finds you well! I just wanted to reach out and touch base regarding our innovative platform that empowers companies like yours to leverage cutting-edge solutions. Would you be open to a quick chat to delve deeper into how we can foster mutual success?

### After

> Saw your team is hiring two more SDRs. We built a coaching tool that one of them will probably ask for in their first week — call recordings, ranked by what the rep did well and what they fluffed. 12-minute demo if you're curious. If not, I'll go away.

### Change log

- Pattern #19 (chatbot pleasantries) — dropped "I hope this message finds you well!" and "just wanted to reach out and touch base"
- Pattern #4 (promotional-brochure tone) — removed "innovative platform" / "cutting-edge solutions"
- Pattern #7 (AI vocab) — removed *leverage, delve, foster*
- Pattern #22 (filler phrases) — cut "would you be open to" / "mutual success"
- Soul overlay — opened with a specific signal (the SDR hiring), described the product in operational terms (call recordings, ranked), gave a precise duration (12 minutes), and offered a graceful exit ("I'll go away") that signals the sender is a person not a sequence

## Example 4 — Meeting recap turned into action items

A product manager is recapping a planning meeting for the team. The first draft reads like generic minutes.

### Before

> The meeting underscored several pivotal themes. Stakeholders engaged in a robust dialogue regarding the strategic landscape, and a vibrant exchange of perspectives ultimately fostered alignment around our key priorities moving forward.

### After

> Three things came out of the call. Sales wants to push the launch to August (sales lead owns it). Engineering wants two more weeks of soak time on the payments rewrite (platform team owns it). Marketing is fine either way but needs the date locked by Friday. Decision: August 14, locked. Owners assigned in the doc.

### Change log

- Pattern #1 (significance inflation) — removed "underscored several pivotal themes"
- Pattern #7 (AI vocab) — removed *underscored, pivotal, robust, landscape, vibrant, foster, key priorities*
- Pattern #5 (vague attributions) — replaced "stakeholders engaged" with named owner roles (sales lead, platform team)
- Pattern #22 (filler phrases) — cut "moving forward"
- Soul overlay — replaced abstract "alignment" with the actual decision and date; structure now mirrors how a person who was at the meeting would type it back

## How to read these change logs

When the user wants the rewrite plus its reasoning, append a numbered change log keyed to `patterns.md`. When the user just wants clean output, omit the log. The point of the worked examples is to show that humanization is a subtractive process most of the time — the AI draft contains both the words to remove and the words to keep, and rewriting is mostly the job of cutting the first set and finishing the second with one personal detail per paragraph.
