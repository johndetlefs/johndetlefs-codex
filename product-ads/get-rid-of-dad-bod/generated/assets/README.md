# Reusable Product Assets

## Current Assets

- `product-shots/whey-pack-3quarter-ai-green.png`
- `product-shots/whey-pack-3quarter-ai-transparent.png`

`whey-pack-3quarter-ai-transparent.png` is the current reusable product layer for the ad system. It was generated as a fresh three-quarter pack shot on a chroma-key background, then converted to a transparent PNG for compositing.

The older local cutout `whey-pack-3quarter-transparent.png` is retained as a workflow artifact, but it is not the preferred product asset.

`source/whey_protein_concentrate_chocolate.png` in the packet root is not a production template layer. It is a source/reference image and should not be placed directly into new templates.

## Backgrounds, Props, And Hero Shots

Reference templates R02-R11 have per-format asset requirements documented in:

- `../../reference-ads/asset-requirements.md`

Use GPT Image 2.0 for any photoreal background, lifestyle scene, hand-held shot, tabletop kit, ingredient cue, sensory texture, prop, sticker set, or icon sheet needed to match a source advertisement.

Recommended folders:

- `backgrounds/`: generated scene backgrounds without product packaging or text.
- `hero-shots/`: composited or isolated hero elements such as hands, grounded shadows, or product-in-scene helpers.
- `props/`: transparent props such as ingredient cues, generic containers, kit accessories, or comparison-side objects.
- `icons/<template-slug>/`: cut transparent icon/sticker/arrow assets.
- `icon-sheets/`: original GPT Image 2.0 asset sheets before cutting.

Production rule: keep generated backgrounds and props text-free. Add product claims, buttons, badges, UI messages, and ad copy in the editor/renderer so they remain editable and safe-zone aware.

## Icon / Arrow Asset Sets

For ad formats that use hand-drawn arrows, callout icons, stickers, badges, or other illustrative support assets, create and store a real asset set before building the layout.

Current feature/benefit sets:

- Source sheet: `icon-sheets/feature-benefit-line-icons-v1-green.png`
- Transparent sheet and cut assets: `icons/feature-benefit-v1/`
- Review contact sheet: `icons/feature-benefit-v1/asset-contact-sheet-blue.png`
- Source sheet: `icon-sheets/feature-benefit-line-icons-v2-green.png`
- Transparent sheet and cut assets: `icons/feature-benefit-v2/`
- Review contact sheet: `icons/feature-benefit-v2/asset-contact-sheet-blue.png`

`feature-benefit-v2` is the active expanded set. It includes four icon options for each template-01 benefit group plus additional arrow variations by direction. Rebuild it with:

```bash
node product-ads/get-rid-of-dad-bod/scripts/build-feature-benefit-asset-pack.mjs
```

Rule: the editor should place and transform designed assets. It should not rely on emojis or rough hand-coded path sketches for production icons/arrows. If a generated PNG asset becomes part of a reusable template library, trace and clean it into SVG before treating stroke width and colour as final editable controls.

## Shot List To Build Next

- `product-shots/whey-pack-front-ai-transparent.png`: straight-on product hero.
- `product-shots/whey-pack-table-ai-transparent.png`: product grounded on a bench/table for lifestyle ads.
- `product-shots/whey-pack-small-corner-ai-transparent.png`: smaller product lockup for testimonial, FAQ, and retargeting formats.

The safest production workflow is still to keep the actual pack from source photography or approved renders, then composite it into generated or designed ad scenes. Fully AI-regenerating the packaging should be treated as concept-only unless the label is manually checked.
