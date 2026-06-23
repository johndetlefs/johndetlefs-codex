# Requirements

## Overview

- Goal (in user terms): Capture high-value user behavior and conversion signals across the full site in a privacy-compliant way so business decisions are based on reliable analytics.
- Primary user(s): Site owner/marketing operator; secondarily, site visitors whose consent and privacy choices must be respected.
- Desired outcome: GTM-managed tracking is present on all pages, key conversion events are captured in GA + Meta, and tracking behavior follows legal consent requirements.

## User Story

As a prospective coaching client visiting the site, I want privacy-compliant analytics and marketing tracking to run consistently across all pages, so that the business can measure funnel performance and improve conversion decisions with reliable data.

## In Scope

- Add a tracking foundation that loads across all pages.
- Implement Google Tag Manager (GTM) as the central tag orchestration layer.
- Enable Google Analytics and Meta/Facebook Pixel through GTM.
- Define and track core funnel events for this site (at minimum: page views, booking milestones, and homepage booking CTA interactions).
- Ensure tracking is gated by consent behavior required for applicable law.

## Out of Scope

- Building custom BI dashboards or long-term reporting automation.
- Historical backfill of analytics data prior to deployment.
- Reworking product UX solely for analytics purposes.
- Guaranteeing "every" possible metric is tracked.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- Tracking scripts are available on every public page via a shared app-level integration.
- GTM container loads once per page and manages downstream tags.
- GA tracking receives page view events and core conversion events.
- Meta Pixel receives page view events and matching core conversion events.
- Booking-related milestones (`booking_start`, `booking_slot_selected`, `booking_submit`, `booking_success`) are tracked with consistent event names and parameters.
- Homepage booking CTA interactions (`booking_cta_click`) are tracked with consistent event names and parameters.
- Tracking does not fire for non-essential tags before required consent is granted.

### Non-Functional Requirements

- Performance / latency: Tracking integration must avoid noticeable UX degradation and avoid duplicate script injections.
- Security / permissions: Keys/container IDs are managed via environment configuration and are not hardcoded in source.
- Accessibility: Consent interaction (if shown) must remain keyboard- and screen-reader accessible.
- Observability (logs/metrics/audit expectations): There is a clear verification method (debug/preview tools + network inspection) to confirm whether each required event fired or was blocked.

## Acceptance Criteria

- AC1: GTM is present on all intended pages and initializes once per page load.
- AC2: GA receives page view events across the main user journey routes.
- AC3: Meta Pixel receives page view events across the main user journey routes.
- AC4: Booking funnel events are emitted at defined milestones (`booking_start`, `booking_slot_selected`, `booking_submit`, `booking_success`) and homepage booking CTA clicks (`booking_cta_click`) are emitted, all with consistent naming.
- AC5: Non-essential tracking does not fire before consent where required, and does fire after consent is granted.
- AC6: A lightweight pass/fail verification note is recorded in `IMPLEMENTATION.md` showing each required validation was checked end-to-end.

## Assumptions

- The project can use GTM as the primary tracking manager.
- This task will introduce a minimal in-app consent mechanism because no reusable consent mechanism currently exists in this repository.
- Required platform IDs (GTM, GA property/measurement setup, Meta Pixel) are available from the business owner.

## Open Questions

- None for this pass.

## Decisions Log

- Decision:
  - Context: Base analytics stack for initial pass.
  - Options considered: Direct script embeds per vendor vs GTM-managed orchestration.
  - Chosen: GTM-managed orchestration with GA + Meta as baseline.
  - Why: Keeps implementation centralized and easier to evolve without repeated code changes.
- Decision:
  - Context: Consent handling for privacy-compliant tracking in the user story.
  - Options considered: Region-aware strict, global strict opt-in, existing behavior only.
  - Chosen: Region-aware strict (GDPR/EEA strict consent, relaxed elsewhere where lawful).
  - Why: Balances legal compliance and data coverage by applying stricter consent where required.
- Decision:
  - Context: Platform scope for JD-003 launch.
  - Options considered: GA + Meta only, GA + Meta + Clarity, GA + Meta + broader set.
  - Chosen: GTM + GA + Meta only.
  - Why: Delivers core marketing and attribution coverage with minimal launch risk.
- Decision:
  - Context: Required booking funnel events for launch.
  - Options considered: Core 3 events, core + payment lifecycle, custom set.
  - Chosen: `booking_start`, `booking_slot_selected`, `booking_submit`, `booking_success`, plus homepage CTA event `booking_cta_click`, with a companion standard `purchase` event emitted on confirmed booking success for ad-platform optimization.
  - Why: Captures both conversion progression and top-of-funnel intent signals while keeping a consistent, GTM-friendly taxonomy and a standard purchase conversion event for Meta.
- Decision:
  - Context: Consent mechanism implementation approach for region-aware strict gating.
  - Options considered: Reuse existing mechanism, build new mechanism, hybrid approach.
  - Chosen: Build a new consent mechanism in this task (Q1 = Option B).
  - Why: No existing reusable consent mechanism was found in this repository, and legal gating requires explicit runtime control before non-essential tags fire.
- Decision:
  - Context: Launch parameter schema for booking funnel events.
  - Options considered: Minimal schema, standard funnel schema, custom schema.
  - Chosen: Standard funnel schema (Q2 = Option B): `event_name`, `page_path`, `timestamp`, `booking_step`, `session_id`, `source_medium` (when available).
  - Why: Improves funnel analysis quality and comparability while remaining feasible for MVP implementation.
- Decision:
  - Context: Verification evidence storage standard for AC6.
  - Options considered: Checklist with screenshots, checklist + exported debug captures, lightweight pass/fail note.
  - Chosen: Lightweight pass/fail note in `IMPLEMENTATION.md` (Q3 = Option C).
  - Why: Keeps this MVP scope lean while preserving explicit sign-off criteria.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC1 -> Open representative pages and verify GTM loads once using Tag Assistant/preview mode.
  - AC2 -> Navigate the primary journey and confirm GA page views in DebugView/realtime.
  - AC3 -> Navigate the primary journey and confirm Meta Pixel page views in Pixel Helper/events manager test mode.
  - AC4 -> Execute booking flow steps and confirm start/slot_selected/submit/success events with expected names/params, confirm a standard `purchase` event on confirmed booking success, then click homepage booking CTAs and confirm `booking_cta_click` events with expected names/params.
  - AC5 -> Validate behavior before and after consent to confirm non-essential tags are blocked until allowed.
  - AC6 -> Record a pass/fail verification note in `IMPLEMENTATION.md` confirming all AC checks were executed.
- Rollout notes (if any): Enable in staging first, validate events, then release to production.
