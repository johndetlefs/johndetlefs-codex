## User Story

As a content reader, I want pages with hero media to begin with a clear hero section, optional CTA, and optional reading metadata/progress cues, so that I can quickly understand the page context, take the next action, and track my reading progress.

## Goal

- Deliver content pages where hero image/video presentation and optional reading aids are clear, configurable via frontmatter, and verifiable.

## Approach

- Implement in two safe slices: hero presentation first, optional metadata/progress second.
- Keep optional elements frontmatter-driven using explicit toggles (`showReadTime`, `showProgressBar`) and optional `readTime` override.
- Validate each outcome using user-visible checks across representative content pages.

## Phases

### Phase 1

- Changes: hero image with title overlay and per-page black overlay opacity; hero video with title above and wide responsive guttered layout; support both YouTube and Wistia hero videos.
- Validation: verify image hero behavior and compare overlay opacity across pages; verify YouTube and Wistia hero pages render and follow the same layout rules.
- Tracker updates: keep story status as `Analysing` while implementation planning is active.

### Phase 2

- Changes: optional published and updated date display by presence; optional read time via `showReadTime` + optional `readTime` override; optional progress bar via `showProgressBar`; conditional hiding when fields are absent.
- Validation: verify metadata combinations, read-time toggle behavior, and progress bar scroll behavior on enabled/disabled pages.
- Tracker updates: move to `Plan Confirmed` only after explicit user confirmation.

## Task List

|  ID | Title                                              | Description                                                                                                                                                                                                                                    | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                   | User Verification                                                                                                                                                                                                                                                                                 | Status   |
| --: | -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Image Hero With Title Overlay                      | Content pages with hero images start with an image hero that overlays the page title and supports per-page black overlay opacity.                                                                                                              | - Image hero is first visible section when image frontmatter is present.<br>- Title is rendered over the hero image.<br>- Overlay opacity follows per-page frontmatter value.                                                                                                                                                                                         | - Open a page configured with hero image and confirm title appears over image at top of page.<br>- Compare two pages with different overlay opacities and confirm visible difference.                                                                                                             | Complete |
|   2 | Video Hero Wide Layout For YouTube And Wistia      | Content pages with hero videos start with a video hero that places title above video, uses a wide container with responsive gutters, supports YouTube and Wistia embeds, and supports combined image+video hero composition when both are set. | - Video hero is first visible section when video frontmatter is present.<br>- Title renders above video.<br>- Desktop layout uses wide container broader than article body with gutters.<br>- Both YouTube and Wistia hero videos render correctly.<br>- If both hero image and hero video are set, image renders as background with title and video layered over it. | - Open a YouTube hero page and verify title-above-video and wide-gutter layout.<br>- Open a Wistia hero page and verify same layout behavior and successful playback render.<br>- Open a page with both hero image and hero video and verify background-image + overlaid title/video composition. | Complete |
|   3 | Optional Reading Metadata Display                  | Published date, updated date, and read time display only when configured by frontmatter using explicit toggles.                                                                                                                                | - Published date shows only when present.<br>- Updated date shows only when present.<br>- Read time shows only when `showReadTime: true`.<br>- If `readTime` is provided, displayed value uses override.                                                                                                                                                              | - Open pages with published/updated combinations and verify only present fields show.<br>- Open one page with `showReadTime: true` and one without; verify read time shown vs hidden.<br>- Add `readTime` override and verify override value is displayed.                                        | Complete |
|   4 | Optional Scroll Progress Meter                     | Reader progress bar appears only when enabled and accurately reflects progress through main content as user scrolls.                                                                                                                           | - Progress bar renders only when `showProgressBar: true`.<br>- Progress meter updates from top to bottom during scroll.<br>- Progress bar is hidden when flag is absent/false.                                                                                                                                                                                        | - Open a page with `showProgressBar: true`, scroll top-to-bottom, and verify meter progresses accordingly.<br>- Open a page without the flag and verify no progress bar is shown.                                                                                                                 | Complete |
|   5 | Conditional Rendering And Accessibility Guardrails | Optional hero metadata and progress UI elements remain hidden when frontmatter is absent and remain readable/usable when shown.                                                                                                                | - Missing optional frontmatter does not render related UI elements.<br>- Hero title/metadata maintain readable contrast over media.<br>- Progress indicator does not block content interaction.                                                                                                                                                                       | - Open a page missing all optional fields and verify no optional UI appears.<br>- Manually inspect hero/title readability against dark and light media backgrounds.<br>- Interact with page content while progress bar is visible and confirm no blocked interactions.                            | Complete |

## Notes

- Task: JD-006
- Title: Content Hero Section
- Created: 2026-03-10
