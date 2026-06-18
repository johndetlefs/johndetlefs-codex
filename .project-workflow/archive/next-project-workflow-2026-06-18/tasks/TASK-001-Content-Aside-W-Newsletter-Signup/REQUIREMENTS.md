## Overview

- Goal (in user terms): Let readers subscribe to the newsletter from supported content pages without interrupting their reading flow.
- Primary user(s): Visitors reading published content pages.
- Desired outcome: Editors can enable a sidebar newsletter signup via frontmatter, and readers see a responsive sticky signup card with live submission feedback.

## User Story

As a content reader, I want eligible guide pages to show a newsletter signup sidebar, so that I can subscribe without losing my place in the article.

## In Scope

- Add an `aside` boolean frontmatter option for content pages.
- Render a sidebar column on content pages when `aside: true`.
- Place a newsletter signup card at the top of the aside column.
- Reuse the existing Sendy enrollment flow so newsletter submissions use the configured list from environment variables.
- Show live submission states in the sidebar form after the reader submits.
- Stack the content and aside into a single column on tablet and smaller viewports.

## Out of Scope

- Adding multiple aside variants or custom per-page aside content.
- Changing the booking page enrollment flow beyond compatibility needed for the shared endpoint.
- Introducing a new email provider or exposing server-only configuration to the client.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- Content page frontmatter must accept `aside: true | false`, defaulting to no aside when omitted.
- When `aside: true`, the content page must render the article body alongside a dedicated aside column on desktop layouts.
- The aside column must contain a newsletter signup card pinned to the top of the aside column while the reader scrolls the article.
- On tablet and smaller layouts, the article and aside must stack into a single column, with the newsletter card appearing after the article body in a stable reading order.
- The newsletter signup card must include a title, short supporting description, a single name field, a single email field, and one primary submit button.
- Submitting the newsletter card must enroll the reader through the existing Sendy-backed enrollment flow that uses the configured `SENDY_LIST_ID` environment variable on the server.
- After submission, the newsletter card must update in place to reflect submitting, success, and error states without a full page refresh.

### Non-Functional Requirements

- Performance / latency: Adding the aside must not introduce unnecessary client-side work outside the signup form itself.
- Security / permissions: The Sendy list ID must remain sourced from server-side environment configuration rather than being hard-coded in MDX content.
- Accessibility: Form controls and status messaging must remain keyboard accessible and expose submission feedback to assistive technologies.
- Observability (logs/metrics/audit expectations): Newsletter submissions should continue to use the existing enrollment logging path so failures remain visible in server logs.

## Acceptance Criteria

- AC1: A content page with `aside: true` in frontmatter renders an aside column with a newsletter signup card; a page without the flag does not render that aside.
- AC2: On desktop, the newsletter signup card stays fixed near the top of the aside column while the article scrolls; on tablet and smaller screens, the layout collapses to a single column with the newsletter card positioned after the article content.
- AC3: The newsletter signup card presents a title, brief description, name field, email field, and primary CTA with the requested light blue fill and dark blue dotted outline styling.
- AC4: Submitting the form uses the existing Sendy enrollment flow backed by environment configuration and updates the card inline to show submitting, success, or error feedback.

## Assumptions

- The existing Sendy enrollment endpoint is the intended backend for newsletter subscriptions on content pages.
- Reusing the shared signup component for MDX and page-level aside contexts is acceptable if behavior remains consistent.

## Open Questions

- None.

## Decisions Log

- Decision:
  - Context: The new sidebar newsletter form needs a list identifier.
  - Options considered: Read the list ID in client-side content, pass it through frontmatter, or keep using the existing server-side Sendy configuration.
  - Chosen: Keep using the existing server-side Sendy configuration sourced from `SENDY_LIST_ID`.
  - Why: It matches current infrastructure and avoids exposing server configuration in content files.
- Decision:
  - Context: The user story required a defined reading flow once the aside stacks on tablet and smaller screens.
  - Options considered: Place the newsletter card before the article content, or place it after the article content.
  - Chosen: Place the stacked newsletter card after the article content.
  - Why: This keeps reading primary on smaller screens while still exposing the signup after the content is consumed.

## Validation Plan (User-Facing)

- How the user will verify “done”: Open a content page with `aside: true`, confirm the sidebar appears on desktop, confirm the layout stacks on tablet/mobile widths, and submit the form with valid and invalid inputs to observe inline status changes.
- AC1 -> verification step: Toggle `aside: true` on a content page and confirm the sidebar only renders when the flag is enabled.
- AC2 -> verification step: View the page at desktop width and scroll to confirm the card remains at the top of the aside column, then reduce the viewport to tablet/mobile width and confirm the layout becomes one column with the newsletter card rendered after the article content.
- AC3 -> verification step: Inspect the rendered signup card and confirm the requested content fields plus the light blue background and dark blue dotted outline styling.
- AC4 -> verification step: Submit the form and confirm the button/status messaging changes during submit, then verify success or error feedback appears without a page reload.
- Rollout notes (if any): Editors must set `aside: true` in a page frontmatter block to enable the sidebar on that page.
