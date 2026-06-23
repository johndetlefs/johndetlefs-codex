## Overview

- Goal (in user terms): Provide one reusable global header, consistent with the homepage header behavior, that appears on all pages and can be configured to include specific top-level and dropdown navigation items.
- Primary user(s): Site visitors (navigation consumers), site editor/developer maintaining navigation config.
- Desired outcome: Navigation is centrally controlled through config, stays consistent site-wide, and always ends with a visible Book a Call CTA styled as a discreet button.

## User Story

As a site editor, I want a reusable global header with configurable top-level and dropdown navigation items, so that I can control what appears in navigation across all pages while always keeping a clear Book a Call action.

## In Scope

- Introduce/use a single global header component for all pages.
- Keep functional behavior aligned with the current homepage header interaction patterns.
- Add a config source that determines which top-level links and dropdown items are shown.
- Enforce that the final header link is always Book a Call.
- Style Book a Call as a discreet button variant (distinct from plain text links, but not dominant/primary-emphasis).

## Out of Scope

- Redesigning header information architecture beyond configured inclusion/exclusion.
- Changing core booking flow behavior or destination.
- Introducing CMS/editor UI for managing navigation content.
- Per-page header variants unless explicitly added in a future task.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The site must render a global header on all pages.
- The global header must preserve the same user-visible behavior as the homepage header (navigation interactions and link behavior).
- Navigation items must be driven by a central config that supports:
  - top-level navigation items
  - dropdown items under applicable parent entries
  - inclusion/exclusion of configured entries
- The last navigation action in the header must always be Book a Call, regardless of other configured items.
- Book a Call must navigate to the expected booking destination currently used by the site.
- Book a Call must be styled as a discreet button and remain visually distinct from standard navigation links.

### Non-Functional Requirements

- Performance / latency: Header render must not introduce noticeable additional navigation delay versus current pages.
- Security / permissions: Config-driven navigation must not expose restricted/internal-only links by default.
- Accessibility: Header navigation and dropdown interactions must remain keyboard-accessible with clear focus states and link/button semantics.
- Observability (logs/metrics/audit expectations): No additional telemetry is required for this task; existing analytics behavior remains unchanged.

## Acceptance Criteria

- AC1: Every route in the app displays the global header with no route exclusions.
- AC2: Header interactions on non-home pages match homepage header behavior.
- AC3: Updating the nav config changes included top-level and dropdown items without requiring component logic changes.
- AC4: Book a Call is always the final header action and links to the booking destination.
- AC5: Book a Call renders with discreet-button styling distinct from normal links.
- AC6: Keyboard navigation can reach and activate top-level links, dropdown items, and Book a Call.
- AC7: Header navigation does not use in-page `#` section links; all header destinations are route-valid links.
- AC8: For nav items with dropdown children, the parent item is a non-navigable toggle and only child items are navigable links.

## Assumptions

- “Functionally the same as homepage header” refers to current UX behavior already implemented in the repository.
- “Editor” means a project maintainer updating repository config (not a runtime CMS user).
- Existing booking destination route/URL remains valid.

## Open Questions

- None.

## Decisions Log

- Decision:
  - Context: Navigation management mechanism.
  - Options considered: Runtime CMS editor UI; repository config file.
  - Chosen: Repository config file.
  - Why: Requested explicitly as “has a config file” and aligns with current repo constraints.
- Decision:
  - Context: Header coverage scope.
  - Options considered: Exclude select routes; show header on all routes.
  - Chosen: Show header on all routes.
  - Why: User confirmed no exclusions.
- Decision:
  - Context: Book a Call destination behavior.
  - Options considered: Fixed booking destination; configurable destination.
  - Chosen: Fixed to current booking destination.
  - Why: User selected fixed behavior to keep CTA destination consistent.
- Decision:
  - Context: Global header link strategy for non-home routes.
  - Options considered: A) hash-only links, B) cross-route anchors, C) route-valid links only.
  - Chosen: C) route-valid links only.
  - Why: User confirmed header will no longer use `#` links.
- Decision:
  - Context: Parent behavior for nav items with dropdown children.
  - Options considered: A) parent toggle only, B) parent navigable + dropdown, C) parent navigates and chevron toggles dropdown.
  - Chosen: A) parent is non-navigable toggle only.
  - Why: User selected clearer interaction where only child items are destinations.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC1 -> Visit all route types (home, content, booking, legal, success) and confirm header is present on each with no exclusions.
  - AC2 -> Compare homepage vs non-home header interactions and confirm parity.
  - AC3 -> Change config to hide/show one top-level item and one dropdown item, reload, and confirm output updates.
  - AC4 -> Confirm Book a Call appears last and navigates to booking destination.
  - AC5 -> Confirm Book a Call appears as discreet button styling on desktop and mobile nav states.
  - AC6 -> Use keyboard-only navigation (Tab/Shift+Tab/Enter/Space/Escape where relevant) to operate header and dropdowns.
  - AC7 -> Inspect configured header links and verify none use `#` section anchors; confirm each link resolves via valid route navigation.
  - AC8 -> For a parent with dropdown children, confirm activating parent toggles submenu only and navigation occurs only when selecting a child link.
- Rollout notes (if any): Safe incremental rollout; verify all primary routes in staging before production deploy.
