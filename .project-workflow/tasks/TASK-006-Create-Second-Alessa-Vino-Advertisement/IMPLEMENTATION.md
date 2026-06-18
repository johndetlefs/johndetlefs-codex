## User Story

As John, I want a second Alessa Vino product advertisement built from the second product-ad template, so that the account has another creative direction beyond the existing R01 feature/benefit hero.

## Acceptance Criteria

- [x] AC1: `product-ads/templates/r02-notes-personal-switch/` exists with template config, asset requirements, common elements, reference assets, and reusable icon assets.
- [x] AC2: `product-ads/clients/alessa-vino/products/visner-di-pergola-2024/ads/r02-notes-personal-switch/` exists with saved editor state and documentation.
- [x] AC3: Product config supports template-specific overrides for R01 and R02 editor subtitle, export prefix, and background settings.
- [x] AC4: The editor server applies template-specific product overrides when building editor context.
- [x] AC5: Safe-zone QA guidance is documented and referenced by the product-ad architecture docs.
- [x] AC6: Validation confirms the R02 editor/admin data loads and the expected Meta ad ratios render for QA.

## Validation

- JSON validated for the R02 template, Alessa product config, and R02 editor state.
- Product-ads editor/admin server confirmed the inventory has two Alessa Vino ads and two templates.
- Browser preview rendered all four R02 Meta ratios: 9:16, 4:5, 1:1, and 1.91:1.
- Visual QA pass adjusted the R02 background to match the R01 cherry-depth red, changed checklist text/check icons for contrast, and corrected the 4:5 bottle placement so it no longer overlaps checklist copy.
- Safe-zone QA pass confirmed the 9:16 fake Notes chrome sits inside the edge guard while the headline, checklist, and product-identifying bottle area sit inside the Reels safe rectangle.
- R02 template documentation now records reusable fake Notes chrome and the safe-zone rule for future ads.
- Replaced the top-right fake Notes unicode controls with a shared vector-derived `notes-top-actions-v1` icon asset in the R02 template common elements, then verified the Alessa R02 editor loads that shared asset.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Promote R02 template | Add the reusable notes-app/personal-switch template, reference assets, common elements, and icon assets under `product-ads/templates/`. | AC1, AC5 | Inspect the R02 template folder and safe-zone documentation. | Complete |
| 2 | Add Alessa R02 ad | Add the saved Alessa Vino R02 ad project and documentation under the Visner di Pergola product. | AC2, AC6 | Open the product-ad admin/editor and confirm the R02 ad appears separately from R01. | Complete |
| 3 | Support template overrides | Update product config and editor context building so R01 and R02 can use template-specific export, subtitle, and background values. | AC3, AC4 | Load R01 and R02 editor contexts and confirm their distinct settings. | Complete |
| 4 | Validate Meta ratios | Preview the R02 creative in 9:16, 4:5, 1:1, and 1.91:1 and record visual/safe-zone QA notes. | AC5, AC6 | Confirm the implementation validation notes and safe-zone QA guidance. | Complete |

## Notes

- Task: TASK-006
- Title: Create Second Alessa Vino Advertisement
- Created: 2026-06-13
- Primary repo: parent workspace repo (`/Users/johndetlefs/repos/johndetlefs`)
- Repos touched: parent only
- Branch/PR: `codex/product-ads-next-pass`, PR pending
- Workflow owner: parent workspace tracker (`.project-workflow/`)
- Existing Alessa Vino ad: `product-ads/clients/alessa-vino/products/visner-di-pergola-2024/ads/r01-feature-benefit-product-hero/`
- Second migrated production template: `product-ads/templates/r02-notes-personal-switch/`
- New Alessa Vino R02 ad: `product-ads/clients/alessa-vino/products/visner-di-pergola-2024/ads/r02-notes-personal-switch/`
