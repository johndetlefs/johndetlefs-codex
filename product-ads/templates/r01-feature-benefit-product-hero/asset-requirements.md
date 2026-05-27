# R01 Feature / Benefit Product Hero Asset Requirements

This template owns only the reusable visual system for the R01 source format. Brand/product assets belong under `product-ads/clients/<client>/products/<product>/`.

## Source Intent

The source ad creates desire by making the product feel simple, useful, and easy to understand in one glance. The product sits in the centre as the answer, while short callouts, icons, and curved arrows pull attention back to the product. The emotional job is clarity and confidence: the viewer should feel "this solves a specific need for me" before reading any body copy.

## Required Template Assets

Reference:

- `/templates/r01-feature-benefit-product-hero/reference/original.webp`
- `/templates/r01-feature-benefit-product-hero/forensic-teardown.md`

Shared arrows and icons:

- `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v1/`
- `/templates/r01-feature-benefit-product-hero/assets/icons/feature-benefit-v2/`
- `/templates/r01-feature-benefit-product-hero/assets/icon-sheets/`
- `/templates/r01-feature-benefit-product-hero/asset-groups.json`

These assets are shared across brands. Do not copy them into client folders unless a client-specific variant is generated.

## Required Client Assets

Each product using R01 must provide:

- `brand.json`
- `product.json`
- `ads/r01-feature-benefit-product-hero/editor-state.json`
- A no-background product image under `assets/product-shots/`
- Product/client-specific icons under `assets/icons/` only when the shared icon set does not match the product category.
- Product-page or claim analysis under `source/` when the copy/claims need audit support.

## Layout Requirements

- Product is the central visual anchor.
- Arrows must start near the callout/icon they represent and end by pointing to the product feature/area being described.
- Arrow curvature, endpoint, and spacing must be part of teardown, not guessed during layout.
- Icon, arrow, text, and product spacing must be measured as a group so arrows do not crowd text or float too far from the callout.
- Callout lockups should cluster around the product differently per ratio while preserving the original source vibe.
- Safe zones must be checked for 9:16, 4:5, 1:1, and 1.91:1.

## Background Requirements

The exact source colour does not need to be copied. The background should use the client's brand colours while preserving the source concept: a clean high-contrast field that makes the product and callouts immediately legible.

Use GPT Image for a background only if the source concept requires a scene, texture, prop, or lifestyle environment. R01 currently does not require that; native SVG/CSS gradients are acceptable.

## Product Image Rule

Use the correct no-background product image. If the available product image cannot support the source concept or angle, generate a new product-compatible shot with GPT Image, then verify product label accuracy manually before using it in an editor state.

Do not store client-specific product images in `templates/`.
