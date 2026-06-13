# Alessa Vino R01 Asset Requirements

## Product Image

Use the no-background product layer:

- `/clients/alessa-vino/products/visner-di-pergola-2024/assets/product-shots/visner-di-pergola-cutout.png`

Source retained for audit:

- `/clients/alessa-vino/products/visner-di-pergola-2024/source/visner-di-pergola.png`

The Shopify product image was supplied as an RGBA PNG on a white square. The first pass removes the white background and crops to the bottle bounds. Do not use the uncropped white-square image in production templates.

## R01 - Feature / Benefit Product Hero

Reference folder:

- `/templates/r01-feature-benefit-product-hero/reference/`

Forensic teardown:

- `/templates/r01-feature-benefit-product-hero/forensic-teardown.md`

Background:

- Native deep ruby/burgundy gradient with olive-black depth stop.
- GPT Image background is not required for R01 unless a future pass adds texture or a tabletop scene.

Headline/subhead:

- High-contrast serif headline plaque.
- Compact gold subhead pill.

Support icons:

- GPT Image 2.0 generated white monoline icon system, cut into transparent PNGs:
  - Source sheet: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/r01-feature-benefit/gpt-image-2-r01-icon-sheet-v1-source.png`
  - Contact sheet: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/r01-feature-benefit/gpt-image-2-r01-icons-contact-sheet-v1.png`
  - Prompt/audit notes: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/r01-feature-benefit/gpt-image-2-r01-icon-sheet-v1-prompt.md`
- Four variants are required for each callout:
  - `sour-cherry-01.png` through `sour-cherry-04.png`
  - `wildflowers-01.png` through `wildflowers-04.png`
  - `marche-ritual-01.png` through `marche-ritual-04.png`
  - `chocolate-pairing-01.png` through `chocolate-pairing-04.png`
- Icons must stay in the product's R01 asset folder and be exposed through this ad's `asset-groups.json`; do not add them to the shared template asset group.
- Callout strategy and icon fit audit: `/clients/alessa-vino/products/visner-di-pergola-2024/ads/r01-feature-benefit-product-hero/callout-strategy.md`

Arrows:

- Reuse accepted R01 hand-drawn arrow assets from the first pass:
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v1/arrow-curve-up-right.png`
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v2/arrow-down-left-curve-a.png`
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v2/arrow-down-right-curve-b.png`

Quality rule:

- Do not use mixed product-page icon captures or hand-coded substitutes for this R01. The icon set must feel like one premium, commercially usable wine-ad system with consistent stroke weight, visual density, padding, and metaphor style.
- The selected icon must be semantically correct for the callout. Ban coffee/cocoa-plant imagery for `Chocolate pairing`, water-drop imagery for `Sour cherry nectar`, and landscape-only imagery for `Marche ritual` unless the copy is changed to an origin/provenance callout.
- Icon placement must be size-checked by visible alpha artwork at final export scale. If an icon reads as tiny, crop/normalize the transparent slice, enlarge the editor placement, or regenerate the icon with stronger visual density.
