# Alessa Vino R01 Callout Strategy

Source URL: `https://alessavino.com.au/collections/collections-best-sellers/products/visner-di-pergola-montepulciano-visciole-2024`

Source analysis: `/clients/alessa-vino/products/visner-di-pergola-2024/source/product-page-analysis.md`

Process reference: `/product-ads/CALLOUT_AND_ICON_PROCESS.md`

## Angle

This R01 should make a niche cherry wine feel desirable, culinary, and easy to understand:

> Not a syrupy afterthought; a rare Italian sour-cherry wine ritual with enough depth for chocolate, cheese, and slow-drinking moments.

## Current Callout Matrix

| Callout | Product truth | Emotional job | Viewer takeaway | Recommended icon metaphors | Banned metaphors | Current status |
| --- | --- | --- | --- | --- | --- | --- |
| Sour cherry nectar | Deep ruby-red sour cherry wine; sour cherry preserve cue | Make the flavour feel rich and specific | This is intense cherry wine, not generic red wine | Sour cherries with wine glass; cherry preserve swirl; cherry cluster with ruby wine mark; cherries beside bottle/glass | Water drop, hydration cue, generic juice drop, generic fruit bowl | Needs icon revision |
| Wildflowers / dried herbs | Aroma/flavour cues from product page | Add sophistication and aromatic complexity | This has botanical lift and savoury depth | Wildflower and herb sprig; aromatic stem; small bouquet with herb leaves; flower/herb beside wine glass | Random bouquet, delicate line art too thin to read, perfume bottle | Concept sound; needs stronger scale/density |
| Marche ritual | Product origin and traditional Italian serving/craft context | Make the wine feel culturally specific and special | This is an Italian serving ritual, not just a sweet wine | Pouring wine into small glass; Italian table setting; cellar arch with glass; bottle/glass ritual moment | Landscape-only hills, vineyard-only origin cue, generic village skyline unless copy changes to provenance | Needs icon/copy decision |
| Chocolate pairing | Product page mentions chocolate pairings | Give a clear serving occasion | Open this with chocolate or dessert | Chocolate square with wine glass; truffle beside glass; dessert plate with wine glass; chocolate shard and cherry/wine swirl | Coffee cup, cocoa pod/plant, generic dessert with no wine context | Needs icon revision |

## User Steering Notes

- The user rejected the current semantic fit: coffee/cocoa icons do not match `Chocolate pairing`, landscape icons do not clearly say `Marche ritual`, and a water drop does not fit `Sour cherry nectar`.
- The user also noted the selected icons feel too small in the layout.

## Size Audit

Current 9:16 editor icon frames:

- Sour cherry icon: `96 x 100`, about `8.9%` of canvas width.
- Wildflower icon: `92 x 92`, about `8.5%` of canvas width.
- Marche ritual icon: `96 x 96`, about `8.9%` of canvas width.
- Chocolate pairing icon: `92 x 92`, about `8.5%` of canvas width.

The issue is not only the editor frame. Several transparent slices have narrow visible alpha bboxes because the icon artwork sits inside a padded `320 x 320` source cell. The next pass should either normalize/crop the transparent slices more tightly or place narrow motifs larger per ratio.

## Recommended Next Pass

Before regenerating icons, get user approval on one of these directions:

1. Keep the current callout text and regenerate better-fitting icons.
2. Change `Marche ritual` to a clearer proof/origin callout such as `Marche heritage`, then use landscape/village cues.
3. Change `Marche ritual` to a clearer usage callout such as `Italian after-dinner ritual`, then use pouring/table/glass cues.

For icon generation, use GPT Image 2.0 and regenerate a cohesive 4 x 4 sheet. The prompt should ban coffee cups, cocoa plants, water drops, landscape-only ritual icons, and overly thin botanical strokes unless specifically approved.

## Draft Icon Brief For Approval

Use this only after the `Marche ritual` direction is confirmed.

Global style:

- Premium white monoline wine-ad icons.
- Bold enough to read at callout size.
- Consistent rounded stroke, visual density, and padding.
- No text, labels, numbers, logos, UI, shadows, or grey strokes.
- Flat chroma-key background for transparent extraction.

Rows:

1. `Sour cherry nectar`
   - Viewer takeaway: rich sour-cherry wine flavour.
   - Variants: cherry cluster with small wine glass; cherries with ruby wine swirl; cherry preserve spoon/mark with glass; cherries beside bottle silhouette.
   - Ban: water drops, juice splash, hydration cue.
2. `Wildflowers / dried herbs`
   - Viewer takeaway: aromatic lift and savoury botanical depth.
   - Variants: wildflower plus herb sprig; fuller botanical cluster; herb stem with small flower; flower/herb beside wine glass.
   - Ban: tiny thin stems, generic bouquet, perfume cues.
3. `Marche ritual`
   - Viewer takeaway: pending decision.
   - If usage ritual: pouring wine into a small glass; Italian table setting with glass; cellar arch with glass; bottle and glass serving moment.
   - If origin/provenance: Marche hills with village; cellar arch; hill village with vines; regional heritage cue.
   - Ban: landscape-only cue if the copy remains `ritual`.
4. `Chocolate pairing`
   - Viewer takeaway: serve this with chocolate or dessert.
   - Variants: chocolate square with wine glass; truffle beside glass; dessert plate with wine glass; dark chocolate shard with cherry/wine swirl.
   - Ban: coffee cups, cocoa pods/plants, generic dessert with no wine cue.
