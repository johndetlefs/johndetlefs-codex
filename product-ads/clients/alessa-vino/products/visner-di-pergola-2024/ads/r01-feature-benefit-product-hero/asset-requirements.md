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

- Product-page icons converted into transparent white line assets:
  - `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/sour-cherry.png`
  - `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/wildflower.png`
  - `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/dessert-pairing.png`
  - `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/chocolate-pairing.png`

Arrows:

- Reuse accepted R01 hand-drawn arrow assets from the first pass:
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v1/arrow-curve-up-right.png`
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v2/arrow-down-left-curve-a.png`
  - `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v2/arrow-down-right-curve-b.png`

Future polish:

- Generate a wine-specific white line icon sheet if the product-page icons feel too generic at final export size.
- Useful additions: cherries, wine glass, Marche hill/crest cue, chocolate square, cheese wedge, dried herb sprig.
