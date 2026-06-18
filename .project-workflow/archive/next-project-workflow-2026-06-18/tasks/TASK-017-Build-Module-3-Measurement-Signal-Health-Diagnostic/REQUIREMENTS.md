# Requirements

## Summary

- Task: TASK-017
- Title: Build Module 3 Measurement Signal Health Diagnostic
- Last updated: 2026-06-18

## Overview

Module 3, Measurement And Signal Health, needs to move from a single Shopify analytics orientation step into a usable diagnostic module for Shopify Growth Coaching members. The member has already completed computer setup, project-workflow setup, and Shopify local setup. This module should now make them understand their business numbers before Module 4 begins storefront/product-page implementation work and Module 5 begins advertising work.

The core diagnostic should reuse the existing Shopify Bottleneck Analysis / Golden Ratio lead magnet flow rather than creating separate funnel math or a parallel report system. For the member flow, videos are intentionally out of scope for now. The member should run the same diagnostic, get the same result, and bring the outcome into coaching as a decision input.

## User Story

As a Shopify Growth Coaching member who has completed setup, I want Module 3 to guide me through the Golden Ratio diagnostic plus the key Shopify, product, and audience numbers, so that I understand where my business is leaking value before changing my product pages or advertising.

## Goal

Give members a clear, checklist-driven Module 3 path that:

- opens the Golden Ratio diagnostic from the member module;
- lets the diagnostic run without the public lead-magnet video layer for now;
- tells members what report result to record;
- gathers the key business inputs needed for later modules: top products, landing/product-page focus, Shopify funnel reliability, customer/audience demographics, and paid-social signal health;
- frames the likely next work as product-page/site changes in Module 4 and advertising changes in Module 5.

## Non-Goals

- No new report-calculation system.
- No new lead-magnet persistence, customer-profile, email, or operator-notification architecture.
- No video production, video scripts, or embedded member-module videos.
- No direct Shopify Admin API integration for pulling reports automatically.
- No Meta, Instagram, TikTok, or analytics API integration.
- No implementation of Module 4 or Module 5 changes.
- No redesign of the whole member dashboard or public lead-magnet landing page.

## Users & Context

- Primary user: a non-technical Shopify Growth Coaching member who has completed Modules 1 and 2 and is ready to diagnose what needs changing before touching the storefront.
- Operator context: John wants the member to arrive at coaching with the Golden Ratio result, likely product-page bottleneck, top products, customer/audience signal, and paid-social context.
- Product context: the coaching membership should use reports and checklists to prepare merchants to make their own changes safely, not sell a Fix-It call or done-for-you implementation.
- Technical context: the existing `/shopify-bottleneck-analysis` flow already captures lead details, generates signed report links, accepts Shopify funnel CSV/AOV input, calculates Golden Ratio results, persists output, and renders a detailed results page.

## Requirements (Outcome-Focused)

- Module 3 must contain a sequenced checklist that starts with Golden Ratio diagnostic setup and ends with a coaching-ready measurement brief.
- The Golden Ratio task must route members into the existing Shopify Bottleneck Analysis flow with member-specific context, not duplicate the formula or persistence code.
- The member diagnostic flow must hide the report setup/result video sections for now while preserving the rest of the diagnostic experience.
- The module must ask members to capture the Golden Ratio outcome: overall status, biggest bottleneck, revenue gap, and the highest-priority page/product area if available.
- The module must guide members to identify top-selling products and the first product/page area to inspect before Module 4.
- The module must guide members to capture current customer/audience demographics in plain language, including Shopify customer/location context and Meta/TikTok audience signals where available.
- The module must guide members to check paid-social signal health without changing campaigns: campaign objective, spend, purchases, cost per purchase, ROAS, CTR, landing page, and pixel/event confidence.
- The module copy must make it clear that Module 4 will focus on site/product-page implementation and Module 5 will focus on ad-platform changes.
- The implementation must preserve existing member progress persistence and sequential task locking.
- The implementation must avoid public Fix-It-call positioning inside the member Module 3 checklist.

## Acceptance Criteria (Verifiable)

- AC1: Module 3 contains multiple sequential checklist tasks that cover Golden Ratio diagnostic setup, report completion, result recording, top-product selection, audience/demographic context, paid-social signal health, and a final coaching brief.
- AC2: The Module 3 Golden Ratio task links to `/shopify-bottleneck-analysis` with member-context query parameters so the existing diagnostic is reused.
- AC3: When the diagnostic is opened in member context, the report setup page and results page do not render `BottleneckVideoSection`, while the default public diagnostic still renders videos.
- AC4: The member-context lead capture persists and navigates through report and results URLs while retaining the member context needed to keep videos hidden.
- AC5: Module 3 checklist copy tells the member what Golden Ratio result details to bring to coaching and how the result informs Module 4 and Module 5.
- AC6: Module 3 provides plain-language steps for top products, landing/product-page focus, customer demographics, and Meta/TikTok signal capture without asking the member to change settings or campaigns.
- AC7: Existing member checklist progress behaviour remains intact: tasks are still sequential, mark-complete buttons still work, and no new required-response gate blocks unrelated modules.
- AC8: Validation confirms lint passes and the local member Module 3 route renders with the updated checklist and member-context diagnostic links.

## Open Questions (Answer Needed)

- None. Videos are intentionally deferred, and automated platform imports are explicitly out of scope for this pass.

## Decisions (Resolved)

- Reuse the existing Shopify Bottleneck Analysis / Golden Ratio flow rather than creating a second diagnostic.
- Use a query-string context for the member diagnostic flow so member pages can suppress videos without changing the public lead-magnet experience.
- Keep Module 3 as measurement and diagnosis only; implementation work starts in Module 4 and ad changes start in Module 5.
- Treat Meta and TikTok as manual signal-gathering steps for now.

## Validation Plan

- Run `./.project-workflow/cli/workflow task ready --id TASK-017` after requirements and planning are written.
- Run `npm run lint`.
- Verify the local member Module 3 page in the in-app browser at `/members/modules/measurement-signal-health`.
- Verify the member-context diagnostic path hides videos on `/shopify-bottleneck-analysis/report` and `/shopify-bottleneck-analysis/results` when the member context query is present.
- Run `./.project-workflow/cli/workflow doctor` and report any warnings as existing or task-related.
