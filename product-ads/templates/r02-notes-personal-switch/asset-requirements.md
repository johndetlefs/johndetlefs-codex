# R02 Notes / Personal Switch Asset Requirements

This template owns the reusable visual system for the R02 source format. Brand and product assets belong under `product-ads/clients/<client>/products/<product>/`.

## Required Template Assets

Reference:

- `/templates/r02-notes-personal-switch/reference/original.webp`
- `/templates/r02-notes-personal-switch/forensic-teardown.md`

Shared template assets:

- `/templates/r02-notes-personal-switch/assets/icons/notes-top-actions-v1.svg`
- `/templates/r02-notes-personal-switch/assets/icons/notes-top-actions-v1.png`

Reusable native-layer elements:

- `/templates/r02-notes-personal-switch/common-elements.json`
- The fake Notes top chrome should be consistent across R02 ads: `< All Notes` on the left and the shared vector-derived action icon strip on the right.
- Do not replace the action icons with text glyphs or unicode symbols in product-specific ad states.

## Required Client Assets

Each product using R02 must provide:

- `brand.json`
- `product.json`
- `ads/r02-notes-personal-switch/editor-state.json`
- A no-background product image under `assets/product-shots/`
- Product-page or claim analysis under `source/` when the copy/claims need audit support.
- `ads/r02-notes-personal-switch/template-pack.md` documenting the adapted copy and claims gate.
- `ads/r02-notes-personal-switch/adaptation-teardown.md` documenting why the adapted creative still matches the R02 mechanism.

## Layout Requirements

- The note should feel native and lightweight, not like a framed sales graphic.
- Fake phone chrome should remain inside the 5% edge guard. It does not need to be inside the stricter Stories/Reels safe rectangle because it is decorative.
- Product image must sit directly under the checklist and remain label-readable at mobile size.
- Checklist items should use check circles, not generic bullets.
- 9:16 must be checked with Edge guard and Reels safe-zone overlays. Important note text and product-identifying image areas should sit inside the Reels safe rectangle where practical.
- 4:5, 1:1, and 1.91:1 can rearrange the product beside the note, but must preserve the source hierarchy: note first, product second.

## Product Image Rule

Use the correct no-background product image. Do not place a product-page screenshot or white-box product image into this template.
