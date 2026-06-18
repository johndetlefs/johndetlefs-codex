## User Story

As a site editor, I want a reusable global header with configurable top-level and dropdown navigation items, so that I can control what appears in navigation across all pages while always keeping a clear Book a Call action.

## Goal

- Deliver a reusable global header that matches homepage header behavior, renders on all routes, supports config-driven top-level/dropdown link inclusion, and always ends with a fixed-destination Book a Call CTA styled as a discreet button.

## Approach

- Extract current homepage header behavior into a shared global header component and render it from app layout so every route gets the same navigation shell.
- Add a single config source for header link structure (top-level + dropdown), then drive rendering from config without route-specific header logic.
- Replace homepage section-hash header links with route-valid destinations for global navigation consistency.
- Define dropdown-parent behavior as non-navigable toggle controls, with navigation only on child links.
- Preserve existing homepage interaction behavior and enforce Book a Call placement/destination/style rules at render level so they cannot be accidentally broken by config edits.

## Phases

### Phase 1

- Changes: Create a reusable global header component based on existing homepage behavior and mount it in root layout so all routes render the same header structure.
- Validation: Navigate through home, markdown content routes, booking, privacy, terms, and success pages and confirm header appears everywhere and behaves consistently with homepage interactions.
- Tracker updates: Keep story status as `Analysing` while plan is under review; move to `Plan Confirmed` only after explicit user confirmation.

### Phase 2

- Changes: Add central header config with top-level + dropdown item inclusion and enforce fixed final Book a Call CTA with discreet button styling.
- Validation: Modify config to hide/show top-level and dropdown entries, verify nav updates without component logic edits, and confirm Book a Call remains last with fixed booking destination and keyboard accessibility.
- Tracker updates: Keep status `Analysing` during implementation planning adjustments; move to `In Progress` when implementation begins.

## Task List (for IMPLEMENTATION.md)

|  ID | Title                                             | Description                                                                                                                                                                                            | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                                                                                | User Verification                                                                                                                                                                                                                                                                                                                                                                                         | Status   |
| --: | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Global header appears on all routes               | Every app route renders one shared header component from layout, replacing per-page header duplication and preserving homepage interaction behavior for desktop and mobile states.                     | - Header is visible on home, content, booking, privacy, terms, and success routes.<br>- Non-home header interactions (menu open/close, nav behavior) match homepage behavior.<br>- No route exclusions exist for header rendering.                                                                                                                                                                                                 | - Open each route type in browser and confirm header is present.<br>- Compare home vs non-home menu behavior and verify parity.                                                                                                                                                                                                                                                                           | Complete |
|   2 | Navigation is config-driven with dropdown support | Header top-level and dropdown entries are controlled by a central config source so maintainers can include/exclude links without changing component logic.                                             | - Config defines top-level links and optional dropdown children.<br>- Header link destinations are route-valid and do not use `#` section anchors.<br>- Parent items with dropdown children act as non-navigable toggles; only child items navigate.<br>- Changing config (hide/show one top-level and one dropdown item) updates rendered nav after reload.<br>- Header component requires no logic change for those nav updates. | - Edit config to remove one top-level and one dropdown link, reload, and verify both disappear.<br>- Restore config values and verify both reappear.<br>- Confirm configured header links contain no `#` anchors and all resolve through route navigation.<br>- Open a dropdown from its parent and confirm parent toggles submenu without navigating, then select a child and confirm navigation occurs. | Complete |
|   3 | Book a Call is fixed final discreet CTA           | Header always renders Book a Call as the final navigation action, with fixed existing booking destination and discreet button styling distinct from normal links, while remaining keyboard accessible. | - Book a Call is always the last nav action in desktop and mobile menus.<br>- Book a Call destination is fixed to the current booking path.<br>- Book a Call styling is visually distinct from standard text links but remains discreet.<br>- Keyboard users can focus and activate top-level links, dropdown items, and Book a Call.                                                                                              | - Confirm Book a Call appears last on desktop and mobile menu states.<br>- Activate Book a Call and verify it lands on booking route.<br>- Tab through header controls and activate links/dropdowns/CTA via keyboard only.                                                                                                                                                                                | Complete |

## Files / Areas Likely to Change

- `app/layout.tsx` for global header mounting.
- `app/page.tsx` to remove inlined homepage-only header markup and use shared component behavior.
- `components/` for new shared global header component(s).
- `app/_lib/` or `components/` for header config source (matching existing project patterns).
- Potential minor page spacing adjustments where fixed header overlap must be avoided.

## Data / RLS / RPC / Migrations

- None expected for this task (no database schema, RLS, RPC, or migration changes).

## Risks & Mitigations

- Risk: Behavior drift from homepage header during extraction.<br>Mitigation: Use direct parity checks against existing homepage interactions before and after extraction.
- Risk: Config misuse could hide critical nav links.<br>Mitigation: Keep Book a Call fixed and enforced as final item, independent of config ordering.
- Risk: Fixed header could overlap page content on some routes.<br>Mitigation: Validate route-level top spacing across all route types listed in requirements.
