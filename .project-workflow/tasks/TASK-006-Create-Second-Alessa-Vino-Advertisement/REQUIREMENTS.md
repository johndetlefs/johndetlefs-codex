# Requirements

## Summary

- Task: TASK-006
- Title: Create Second Alessa Vino Advertisement
- Last updated: 2026-06-13
- Primary repo: parent workspace repo (`/Users/johndetlefs/repos/johndetlefs`)
- Repos touched: parent only
- Branch/PR: `codex/product-ads-next-pass`, PR pending
- Workflow owner: parent workspace tracker (`.project-workflow/`)

## Goal

Create a second Alessa Vino Meta image ad direction for the Visner di Pergola 2024 product using the reusable R02 notes-app/personal-switch template, so the account has a second production creative beyond the existing R01 feature-benefit product hero.

## Non-Goals

- No changes to the `next/` website application.
- No changes to the `email/` repository.
- No new client/product beyond Alessa Vino's Visner di Pergola 2024.
- No final paid-media launch, campaign setup, or ad-platform publishing.
- No redesign of the existing R01 creative beyond incidental editor-state preservation.

## Users & Context

- John needs another product-ad creative direction in the parent `product-ads/` system.
- The R02 direction adapts a fake Notes app reference style into a reusable production template.
- The task belongs to the parent workspace because all changed production files live under `product-ads/`.

## Requirements (Outcome-Focused)

- Promote the R02 notes-app/personal-switch concept into `product-ads/templates/`.
- Add an Alessa Vino R02 ad project for `visner-di-pergola-2024`.
- Let the product-ad editor distinguish template-specific title/subtitle/export/background settings for R01 and R02.
- Keep reusable R02 common elements, including fake Notes chrome assets, inside the R02 template folder.
- Record safe-zone QA expectations for Meta image ratios.
- Keep the product-ad admin inventory able to show both Alessa Vino ads separately.

## Acceptance Criteria (Verifiable)

- AC1: `product-ads/templates/r02-notes-personal-switch/` exists with template config, asset requirements, common elements, reference assets, and reusable icon assets.
- AC2: `product-ads/clients/alessa-vino/products/visner-di-pergola-2024/ads/r02-notes-personal-switch/` exists with saved editor state and documentation.
- AC3: Product config supports template-specific overrides for R01 and R02 editor subtitle, export prefix, and background settings.
- AC4: The editor server applies template-specific product overrides when building editor context.
- AC5: Safe-zone QA guidance is documented and referenced by the product-ad architecture docs.
- AC6: Validation confirms the R02 editor/admin data loads and the expected Meta ad ratios render for QA.

## Open Questions (Answer Needed)

- None for this cleanup pass. Final paid-media launch remains outside this task.

## Decisions (Resolved)

- Use the parent workspace workflow tracker for this task because `product-ads/` belongs to the parent repo.
- Keep `next/.project-workflow/` app-local and remove `TASK-006` from that tracker.
- Use template-specific product overrides instead of duplicating product config per template.
- Use a shared vector-derived `notes-top-actions-v1` icon asset instead of unicode fake Notes controls.

## Validation Plan

- Run JSON validation for template, product, and editor-state files.
- Start the product-ads editor/admin server and confirm both Alessa Vino ads appear.
- Browser-preview R02 in 9:16, 4:5, 1:1, and 1.91:1 ratios.
- Confirm safe-zone guidance is recorded for R02 and reusable templates.
- Run parent workflow doctor after moving this task into the parent tracker.
