# R01 - Feature / Benefit Product Hero Forensic Teardown

Reference image: `original.webp`
Client/product adaptation: Alessa Vino / Corrado Tonelli Visner di Pergola Selezione Vino di Visciole 2024

## Source Mechanism

R01 is a category-reframe product hero. The source makes a supplement feel easier and more desirable by using a strong category headline, a tucked subhead pill, a centred product, and four compact icon/text/arrow satellites that remove objections or create desire.

## Alessa Vino Emotional Job

Desired feeling:

- "This is not a generic sweet wine. It is a rare Italian ritual I can bring out with dessert, chocolate, or cheese."

Interest mechanism:

- `Cherry Wine Reimagined` reframes a niche category that could otherwise feel unfamiliar or too sweet.

Desire mechanism:

- The subhead translates the product into ritual and rarity: `Not just dessert - a rare Italian ritual.`
- The callouts sell taste, craft, origin, and pairing rather than technical wine facts alone.

Anxiety reduced:

- "What does it taste like?" -> sour cherry, wildflowers, dried herbs.
- "When would I drink it?" -> chocolate pairing / dessert context.
- "Why is it special?" -> Marche ritual and traditional production cue.

## Copy System

Headline:

- `Cherry Wine Reimagined`

Subhead:

- `Not just dessert - a rare Italian ritual.`

Callouts:

- `SOUR CHERRY / NECTAR`
- `WILDFLOWERS / DRIED HERBS`
- `MARCHE / RITUAL`
- `CHOCOLATE / PAIRING`

## Visual Adaptation

Preserve from source:

- Full-frame brand-colour background.
- High-contrast serif headline in a dark rounded plaque.
- Smaller gold/yellow pill tucked under the headline.
- Large centred product hero.
- Four compact white icon/text/arrow callouts orbiting the product.
- Arrows must start from the callout lockup and point back into the product.

Adapt for Alessa:

- Background shifts from supplement green to deep ruby/burgundy with an olive-black lower stop.
- Headline plaque uses Alessa's dark olive/ink.
- Subhead pill uses the store's gold accent.
- Product layer uses the cut-out wine bottle: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/product-shots/visner-di-pergola-cutout.png`.
- Icon support uses a GPT Image 2.0 generated white monoline set, cut into transparent PNG variants for each callout.

## Current R01 Implementation Lock

This first pass uses the accepted Get Rid Of Dad Bod R01 layout as the base, then tightens callouts around the slimmer wine-bottle silhouette.

Product layer:

- `/clients/alessa-vino/products/visner-di-pergola-2024/assets/product-shots/visner-di-pergola-cutout.png`
- White product-page square removed locally and cropped to bottle bounds.

Icon set:

- Source sheet: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/r01-feature-benefit/gpt-image-2-r01-icon-sheet-v1-source.png`
- Contact sheet: `/clients/alessa-vino/products/visner-di-pergola-2024/assets/icons/r01-feature-benefit/gpt-image-2-r01-icons-contact-sheet-v1.png`
- The editor exposes four variants per callout through `assetSet`:
  - `sour-cherry`
  - `wildflowers`
  - `marche-ritual`
  - `chocolate-pairing`

Arrow set:

- Reuses the accepted R01 generated arrow assets so source curve direction and callout-to-product connector behaviour remain consistent.

## Acceptance Criteria

Score before accepting:

- Source mechanism still visible: category reframe, tucked pill, product hero, four orbiting callouts.
- Product bottle is cut out, not placed inside a white square.
- Headline/subhead reads as one badge at thumbnail size.
- Callouts feel like compact product satellites, not disconnected facts.
- Arrowheads point back into the bottle/label area.
- 9:16 key text and callouts sit inside the Reels-safe working area where practical.
- Alcohol copy stays culinary and product-specific; no health, mood, confidence, or status promises.
