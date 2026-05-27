# Alessa Vino R01 GPT Image 2.0 Icon Sheet Prompt

This file documents the production source for the Alessa Vino R01 callout icons.

## Output Files

- Source sheet: `gpt-image-2-r01-icon-sheet-v1-source.png`
- Transparent slices: `sour-cherry-01.png` through `chocolate-pairing-04.png`
- Contact sheet: `gpt-image-2-r01-icons-contact-sheet-v1.png`

The source was generated as one cohesive 4 x 4 icon sheet, then chroma-keyed and sliced into transparent PNG assets. Keeping the full set in one prompt is intentional: it gives the icons shared stroke weight, padding, visual density, and metaphor language.

## Prompt

```text
Use case: ads-marketing
Asset type: production icon sheet for a Meta ad editor, later cut into transparent PNG icons
Primary request: Create a single 4 x 4 grid icon sheet of premium white monoline wine-ad callout icons for Alessa Vino. The sixteen icons must be consistent, polished, and commercially usable, not rough sketches.
Canvas: square image, 4 columns x 4 rows, each icon centered in its own equal cell with generous padding.
Style/medium: premium editorial white line icons, consistent rounded stroke, hand-finished but clean, minimal, elegant Italian wine boutique feeling. Solid white strokes only, no fills except small simple white accents where needed. Stroke weight must be consistent across all 16 icons. Icons should look like one cohesive set.
Background: perfectly flat solid #00ff00 chroma-key background for removal. The background must be one uniform color with no shadows, gradients, texture, reflections, floor plane, or lighting variation. Do not use #00ff00 anywhere in the icons.
Icon content by row:
Row 1, sour cherry nectar variants: cherry cluster, cherry pair with stem, cherry nectar droplet with cherries, cherry beside small wine glass.
Row 2, wildflowers and dried herbs variants: wildflower sprig, wildflower bouquet, dried herb stem, simple botanical flower stem.
Row 3, Marche ritual variants: rolling Italian hills with tiny arch, old stone archway, small hill village, elegant ritual wine glass.
Row 4, chocolate pairing variants: chocolate square grid, chocolate stack, cocoa/chocolate with cup, dessert plate with chocolate.
Constraints: no words, no labels, no numbers, no watermark, no mockup UI, no shadows, no grey strokes, no mixed stroke widths, no filled silhouette blobs, no realistic photography, no background texture. Every icon must be clearly readable at small ad-callout size.
```

## Production Rules

- Generate client callout icons with GPT Image 2.0 as a coherent sheet, not as unrelated one-off icons.
- Use a flat chroma-key background when transparent output is needed, then remove the key locally and validate alpha.
- Expose callout variants through the ad-level `asset-groups.json`.
- Assign each icon element an `assetSet` so the editor only shows variants relevant to that callout.
- Do not place client callout icons in the shared template asset group.
