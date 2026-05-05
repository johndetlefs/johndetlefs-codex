---
name: guide-video-pipeline
description: Use when planning, producing, tracking, or repurposing a JohnDetlefs.com Shopify guide video; creating or updating a content packet; moving a topic from idea to script, recording, CapCut edit brief, YouTube package, Shorts/Reels plan, guide page, deployment, or Meta Ads.
---

# Guide Video Pipeline

## Overview

Run the JohnDetlefs.com guide-video workflow from first topic idea through page and ad assets. Keep each guide in a content packet so every channel uses one canonical angle.

## First Step

Read workspace context before making decisions:

- `/Users/johndetlefs/repos/johndetlefs/PROJECT_CONTEXT.md`
- `/Users/johndetlefs/repos/johndetlefs/AGENTS.md`

Then inspect or create the relevant packet under:

- `/Users/johndetlefs/repos/johndetlefs/content-packets/<topic-slug>/`

Capture spin-off guide ideas in:

- `/Users/johndetlefs/repos/johndetlefs/content-packets/IDEA_BACKLOG.md`

If the task involves implementing a guide page, also follow:

- `/Users/johndetlefs/repos/johndetlefs/next/AGENTS.md`
- `/Users/johndetlefs/repos/johndetlefs/next/.project-workflow/CONSTITUTION.md`

## Packet Model

Each guide gets one packet folder:

```text
content-packets/<topic-slug>/
  status.md
  brief.md
  hooks.md
  script.md
  recording-checklist.md
  capcut-edit-brief.md
  youtube-package.md
  shorts-plan.md
  guide-page-plan.md
  meta-ads.md
```

Use `references/packet-files.md` for the expected contents of each file. Create only the files needed for the current stage, but keep `status.md` current.

## Workflow

1. **Idea and angle**: define the target Shopify operator, pain point, commercial intent, proof/examples, and likely Fix-It Call connection.
2. **Hook tests**: create several testable bait-and-switch hooks for the first 10 seconds of the main video, YouTube title/thumbnail framing, Shorts/Reels, and Meta Ads. Prefer the pattern: agreement, reversal, bridge.
3. **Script and recording plan**: write the long-form YouTube script, screen-share beats, selected opening hook, CTA, and capture checklist.
4. **Edit brief**: translate the script into a CapCut-friendly timeline, cut list, captions, zooms, callouts, and export notes.
5. **YouTube package**: produce title variants, description, chapters, tags, thumbnail concepts, pinned comment, and CTA.
6. **Short-form plan**: choose clips for YouTube Shorts, Meta Reels, and other vertical placements with hooks, captions, and framing notes.
7. **Guide page**: turn the transcript/script into a standalone MDX guide under `next/content/guides/<slug>/index.mdx`, with a video hero and useful written content.
8. **Deploy support**: validate the smallest relevant checks in `next/` and summarize deploy readiness.
9. **Meta Ads**: create traffic ads that send to the guide page, with UTM conventions, angle variants, and creative briefs.

## Operating Rules

- Keep the Fix-It Call as the main public conversion path.
- Treat invoiced follow-on hours as a post-call/customer-success option, not a primary public CTA.
- When a useful follow-up topic appears, add a brief entry to `content-packets/IDEA_BACKLOG.md` instead of expanding the current guide beyond its scope.
- Make guide pages useful without requiring the viewer to watch the video.
- Send paid social traffic to the guide page unless the user explicitly asks for a homepage or booking-page campaign.
- Maintain Australian spelling and JohnDetlefs.com voice: direct, practical, experienced, and low-fluff.
- Do not invent live performance results, client outcomes, prices, or platform settings. Mark unknowns clearly.
- Update `status.md` whenever a stage changes.

## Routing To Other Skills

- Use `youtube-transcript-to-content-page` when turning a YouTube video or transcript into an MDX guide page.
- Use future specialist skills when available, such as `guide-idea-planner`, `guide-script-writer`, `capcut-edit-brief`, `youtube-publisher`, `shorts-repurposer`, `guide-page-builder`, `meta-ads-builder`, and `content-ops-tracker`.

## Output Shape

For planning tasks, return the packet path, current stage, updated files, and the next concrete action.

For creation tasks, edit the packet files directly and keep the final response short: what changed, where it lives, and what should happen next.
