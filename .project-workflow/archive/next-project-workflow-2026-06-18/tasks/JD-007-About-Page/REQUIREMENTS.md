## Overview

- Goal (in user terms): Help prospective clients understand who provides the Fix-It service and build confidence to proceed to booking.
- Primary user(s): Shopify merchants and ecommerce operators evaluating whether to book a paid Fix-It session.
- Desired outcome: Users can quickly understand the provider background, relevant expertise, and fit for their needs from a dedicated About page.

## User Story

As an Australian Shopify merchant evaluating a Fix-It session, I want a clear About page that explains who is behind the service, what expertise is offered, and why the approach is trustworthy, so that I can decide whether to book with confidence.

## In Scope

- Add a new public About page for the website.
- Provide a long-form founder narrative focused on credibility, service model, and local context.
- Include a clear next step from the About page to booking.
- Add About discoverability from the global header navigation.

## Out of Scope

- Redesigning unrelated pages or the global site layout.
- Building a CMS/editor workflow for About-page content management.
- Adding testimonials, case studies, or media assets not already approved/provided.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The site includes a publicly reachable About page at the canonical route `/about`.
- The About page states who provides the service and what relevant ecommerce/Shopify expertise they bring.
- The About page explains how this expertise connects to customer outcomes (for example, faster diagnosis, practical fixes, and clearer next steps).
- The About page uses the provided long-form narrative copy exactly as given (no wording changes), including explicit named client references.
- The About page includes at least one clear call to action directing users to `/booking`.
- The global header includes a navigation link to the About page.
- The About page content and call to action are understandable without requiring users to read other pages first.

### Non-Functional Requirements

- Performance / latency: The About page should load within the same expected performance envelope as other simple marketing pages in this repo.
- Security / permissions: The page is public-read only and does not introduce new form inputs, auth flows, or sensitive data handling.
- Accessibility: Page structure supports keyboard navigation and semantic heading order; link text is descriptive.
- Observability (logs/metrics/audit expectations): Existing analytics behavior for standard page navigation remains intact; no special logging required unless explicitly requested.

## Acceptance Criteria

- AC-1: A public About page exists and is reachable at `/about`.
- AC-2: The global header includes an About link that navigates to `/about`.
- AC-3: The About page publishes the provided long-form copy exactly as supplied, including named clients, while still presenting clear "who", "expertise", and "why trust" content aligned to the user story.
- AC-4: The About page includes a prominent CTA that navigates to `/booking`.
- AC-5: The page is accessible for keyboard-only navigation and uses semantic heading structure.

## Assumptions

- Existing site styling/layout conventions should be reused for consistency.
- `/booking` remains the canonical booking route.
- The provided About narrative is approved for direct publication as written.

## Open Questions

- None.

## Decisions Log

- Decision:
  - Context: Requirements pass 1 for a new About page with limited initial input.
  - Options considered: Delay drafting until full details vs draft best-effort requirements with explicit open questions.
  - Chosen: Draft best-effort requirements with explicit open questions.
  - Why: Enables rapid progress while keeping ambiguities visible and testable.
- Decision:
  - Context: Canonical route for the About page.
  - Options considered: `/about`, `/about-me`, custom route.
  - Chosen: `/about`.
  - Why: Standard, concise route with predictable discoverability.
- Decision:
  - Context: Where users should discover About navigation.
  - Options considered: header only, footer only, both, route-only.
  - Chosen: Global header only.
  - Why: Ensures high visibility without expanding footer scope.
- Decision:
  - Context: About content depth and style for v1.
  - Options considered: short, medium, detailed.
  - Chosen: Detailed long-form narrative using provided copy direction.
  - Why: Supports trust-building through authentic background and clear service positioning.
- Decision:
  - Context: Q1 trust signaling choice for named client references.
  - Options considered: A include names, B anonymize, C conditional naming by permission.
  - Chosen: A include names directly in page copy.
  - Why: User explicitly approved direct naming to maximize credibility signaling.
- Decision:
  - Context: Q2 CTA destination for About page.
  - Options considered: A `/booking`, B external URL, C both.
  - Chosen: A internal `/booking` route.
  - Why: User explicitly chose the direct internal booking flow.
- Decision:
  - Context: Q3 editorial strictness for provided long-form copy.
  - Options considered: A near-verbatim, B light edit, C heavier rewrite.
  - Chosen: Publish exactly as given with no changes.
  - Why: User explicitly requested no copy edits.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC-1 -> Open `/about` directly and confirm the page renders successfully.
  - AC-2 -> Use the global header About link and confirm it navigates to `/about`.
  - AC-3 -> Compare the page copy on `/about` against the approved source text and confirm it is published exactly as provided, including named client references.
  - AC-4 -> Click the About-page CTA and confirm navigation to `/booking`.
  - AC-5 -> Navigate the page using keyboard only (Tab/Shift+Tab) and confirm focus order and heading semantics are sensible.
- Rollout notes (if any): No phased rollout required for this pass; publish with normal deploy flow.
