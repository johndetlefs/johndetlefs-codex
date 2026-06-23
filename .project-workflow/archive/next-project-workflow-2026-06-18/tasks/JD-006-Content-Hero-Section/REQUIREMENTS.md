## Overview

- Goal (in user terms): Present a clear, engaging page hero when media is provided, plus optional reading aids (dates, read time, progress) so readers can orient quickly.
- Primary user(s): Visitors reading content pages.
- Desired outcome: Content pages with configured hero media feel intentional and readable, with metadata/progress shown only when provided.

## User Story

As a content reader, I want pages with hero media to begin with a clear hero section, optional CTA, and optional reading metadata/progress cues, so that I can quickly understand the page context, take the next action, and track my reading progress.

## In Scope

- Hero section behavior for content pages when frontmatter includes hero media.
- Hero image presentation with title overlay and configurable black overlay opacity.
- Hero video presentation with title above the video and responsive wide layout with gutters.
- Support for both YouTube and Wistia hero videos.
- Combined hero behavior when both image and video are present: image as hero background with title and video layered over it.
- Optional CTA display from frontmatter.
- Optional display of published date, updated date, estimated reading time, and scroll progress bar.
- Conditional rendering of optional elements based on frontmatter presence.

## Out of Scope

- Redesign of non-content routes or global layout unrelated to content pages.
- Changes to video hosting/provider capabilities beyond currently supported embeds.
- CMS/editor tooling changes outside frontmatter-driven configuration.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- When a content page frontmatter specifies a hero image, the page begins with a hero section that displays the page title over the image.
- Hero image variant includes a black overlay over the image; overlay strength is configurable per page via frontmatter opacity value.
- When a content page frontmatter specifies a hero video, the page begins with a hero section that places the page title above the video.
- Hero video is displayed in a wide, prominent area with responsive side gutters using a wide container that is broader than the article body on desktop.
- Hero video supports both YouTube and Wistia embeds.
- Canonical hero video frontmatter is a single `heroVideo` URL string, with provider inferred from the URL.
- When both hero image and hero video are specified, the hero renders both: image as the top background layer, with title and video displayed over that background.
- CTA is displayed only when provided in frontmatter.
- Published date is displayed only when provided in frontmatter.
- Updated date is displayed only when provided in frontmatter.
- Estimated reading time is displayed only when `showReadTime` is true; a `readTime` value may be supplied as an override.
- Reading progress bar is displayed only when `showProgressBar` is true and updates as the user scrolls through page content.
- If an optional metadata field is absent in frontmatter, the related UI element is not rendered.

### Non-Functional Requirements

- Performance / latency: Hero and metadata rendering must not introduce noticeable layout shift beyond existing page load behavior.
- Security / permissions: Only trusted frontmatter values are rendered; no scriptable content is introduced through metadata fields.
- Accessibility: Title and metadata remain readable against hero backgrounds; progress indicator must have sufficient contrast and not block interaction.
- Observability (logs/metrics/audit expectations): Existing analytics/event behavior must remain unchanged unless explicitly configured elsewhere.

## Acceptance Criteria

- AC1: Given a page with hero image frontmatter, the first visible section is an image hero with the page title overlaid on the image.
- AC2: Given a page with hero image overlay opacity configured, the black overlay is applied using that page-specific value.
- AC3: Given a page with hero video frontmatter, the first visible section is a video hero with the page title above the video and responsive side gutters.
- AC3a: Given a page with YouTube hero video frontmatter, the hero video renders correctly in the same layout behavior as other hero videos.
- AC3b: Given a page with Wistia hero video frontmatter, the hero video renders correctly in the same layout behavior as other hero videos.
- AC3c: Given a page with both hero image and hero video frontmatter, the hero image renders as top background and both title and video render over it.
- AC4: Given pages where CTA is present in frontmatter, CTA is shown; when absent, CTA is hidden.
- AC5: Given pages where published date and/or updated date are present, only the present fields are shown.
- AC6: Given a page where `showReadTime` is true, estimated reading time is shown (using `readTime` override when provided); otherwise it is hidden.
- AC7: Given a page where `showProgressBar` is true, a scroll progress meter is shown and reflects reader progress from top to bottom.
- AC8: Given a page where optional fields (CTA, published, updated, read time, progress) are absent, none of those corresponding UI elements render.

## Assumptions

- Content pages already derive title and media settings from frontmatter.
- Reading time is estimated from page content text using a consistent method already used by the app, or a standard estimate if none exists.
- Progress meter reflects main content scroll rather than total document including footer.

## Open Questions

- None.

## Decisions Log

- Decision:
  - Context: Hero media and optional reading aids must be configurable per content page.
  - Options considered: Always-on metadata/progress vs frontmatter-driven optional rendering.
  - Chosen: Frontmatter-driven optional rendering.
  - Why: Matches the requested behavior that optional elements are hidden when not present.
- Decision:
  - Context: Read time and progress bar toggles required explicit per-page control.
  - Options considered: A) explicit booleans + optional override, B) presence-based, C) always-on unless disabled.
  - Chosen: A) Explicit `showReadTime`, `showProgressBar`, with optional `readTime` override.
  - Why: Provides clear author intent and avoids ambiguity from inferred behavior.
- Decision:
  - Context: Hero video needed "large width with gutters" behavior on desktop.
  - Options considered: A) full-bleed with fixed gutters, B) wide container beyond article width, C) same as article width.
  - Chosen: B) Wide container with responsive max width.
  - Why: Preserves emphasis while keeping a readable, controlled layout.
- Decision:
  - Context: Supported hero video providers.
  - Options considered: single provider, both YouTube and Wistia.
  - Chosen: Support both YouTube and Wistia.
  - Why: Matches content authoring needs and existing component capability.
- Decision:
  - Context: Optional metadata behavior for published date.
  - Options considered: A) keep required, B) make optional, C) required only in strict mode.
  - Chosen: B) Make `published` optional and hide when absent.
  - Why: Aligns with the user story requirement that optional metadata is shown only when present.
- Decision:
  - Context: Behavior when both hero image and hero video are configured on the same page.
  - Options considered: A) video only, B) image only, C) invalid config, D) render both with image background and title/video layered over it.
  - Chosen: D) Render both, with image as top background and title + video over the image.
  - Why: Delivers the requested composite hero treatment and preserves both media inputs.
- Decision:
  - Context: Canonical frontmatter schema for YouTube/Wistia hero videos.
  - Options considered: A) single URL string, B) structured provider+id fields, C) dual-format support.
  - Chosen: A) Use a single `heroVideo` URL string and infer provider from URL.
  - Why: Keeps authoring simple and aligns with the current content schema pattern.
- Decision:
  - Context: CTA behavior on content pages.
  - Options considered: always show CTA, show CTA only when configured.
  - Chosen: Show CTA only when `cta` is present in frontmatter.
  - Why: Preserves page-level flexibility and keeps optional content truly optional.

## Validation Plan (User-Facing)

- How the user will verify "done": Visit representative content pages with different frontmatter combinations and confirm hero and optional metadata/progress behaviors match ACs.
- Rollout notes (if any): No rollout gating expected; behavior is content-page specific.
- AC-by-AC mapping (`AC -> verification step`):
  - AC1 -> Open a page with hero image configured and confirm hero is first section with title over image.
  - AC2 -> Open two pages with different overlay opacity values and confirm visible overlay difference matches page config.
  - AC3 -> Open a page with hero video configured and confirm title is above video and video is wide with gutters.
  - AC3a -> Open a page with YouTube hero video and confirm render/layout matches configured hero video expectations.
  - AC3b -> Open a page with Wistia hero video and confirm render/layout matches configured hero video expectations.
  - AC3c -> Open a page with both hero image and hero video configured and confirm image is background while title and video are layered over it.
  - AC4 -> Compare one page with `cta` and one without; verify CTA shown vs hidden.
  - AC5 -> Compare pages with only published, only updated, both, and neither; verify only present fields render.
  - AC6 -> Open one page with `showReadTime: true` and one without; verify read time shown vs hidden, and if `readTime` is provided it is used.
  - AC7 -> Open a page with `showProgressBar: true`; scroll from top to bottom and confirm meter advances accordingly.
  - AC8 -> Open a page missing all optional fields and verify no optional metadata/progress UI is shown.
