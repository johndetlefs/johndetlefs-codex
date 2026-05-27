# Reference Ad Production Asset Requirements

This file is the production asset manifest for the `9:16` reference-format templates.

Legacy note: this document preserves the pre-refactor R01-R11 asset planning language. Paths inside it are historical packet-local paths until each reference ad is promoted into its own `templates/<template-slug>/` folder.

The gallery HTML can use native CSS shapes while a template is still being roughed in, but production ads should follow the asset requirements below. The target is to get as close as practical to each supplied source advertisement while keeping product accuracy, claim safety, and Meta safe zones intact.

Asset requirements should be derived from the source forensic teardown, not guessed during layout. Each reference folder should use `forensic-teardown.md` to identify mandatory source elements before this manifest is treated as final.

## Common Product Image Rule

Use the no-background product layer by default:

- `generated/assets/product-shots/whey-pack-3quarter-ai-transparent.png`

Do not use `source/whey_protein_concentrate_chocolate.png` as a production layer in templates. It is a flat source/reference image and should be kept for source inspection only.

If a template needs a new product angle, hand-held product, product on a bench, product in a kit, or any other hero shot to match the reference more closely, generate the shot with GPT Image 2.0 as a compositing asset, then verify the label manually. For final production, prefer compositing the approved transparent pack into generated backgrounds rather than asking GPT Image to redraw the product packaging text from scratch.

Transparent or isolated generated assets should use the chroma-key workflow documented in `../ad-production-process.md`:

1. Generate the asset with GPT Image 2.0 on a flat removable chroma-key background.
2. Remove the key colour locally.
3. Save the transparent result under `generated/assets/`.
4. Inspect edges, label text, and mobile-size readability before wiring it into the editor.

## Common Background Rule

Any photoreal, textured, lifestyle, tabletop, hand, prop, ingredient, or sensory background required to match a source ad should be generated with GPT Image 2.0. Keep generated backgrounds free of text, logos, badges, watermarks, and product packaging unless the background is a non-final concept. Add all final ad copy, claims, UI bubbles, buttons, labels, and badges in the editor or renderer.

Recommended folders:

- `generated/assets/backgrounds/`
- `generated/assets/hero-shots/`
- `generated/assets/props/`
- `generated/assets/icons/<template-slug>/`
- `generated/assets/icon-sheets/`

## Template Asset Matrix

### R01 - Feature / Benefit Product Hero

Reference folder: `001-features-benefits/`
Forensic teardown: `001-features-benefits/forensic-teardown.md`
Current production render: `generated/9x16/001-feature-benefit-product-hero.png`

Product hero:

- Use `generated/assets/product-shots/whey-pack-3quarter-ai-transparent.png`.

Background:

- Native brand-colour gradient or subtle generated brand texture.
- No GPT background required unless the reference is revised toward a textured surface.

Icon set:

- Active generated set: `generated/assets/icons/feature-benefit-v2/`
- Source sheets: `generated/assets/icon-sheets/feature-benefit-line-icons-v2-green.png`
- Contact sheet: `generated/assets/icons/feature-benefit-v2/asset-contact-sheet-blue.png`
- Required families: protein, low sugar, grass fed, no prep, short hand-drawn arrows.

Production note:

- Use real icon PNG/SVG layers from the generated set. Do not ship emoji or rough hand-coded icons as the final support artwork.

### R02 - Notes / Personal Switch

Reference folder: `002-notes/`

Product hero:

- Use `generated/assets/product-shots/whey-pack-3quarter-ai-transparent.png`.
- Product should sit below the checklist without a white image box.

Background:

- Native white notes-app style UI is acceptable because the source ad is a UI mimic.
- If a device or paper texture is added, generate that background with GPT Image 2.0 without text.

Icon set:

- Native check-circle UI marks are acceptable.
- If the check marks become hand-drawn or sticker-like, generate `generated/assets/icons/r02-notes/` as a small chroma-key asset sheet.

Hero/background assets to generate only if moving past native UI:

- `generated/assets/backgrounds/r02-notes-paper-ui-v1.png`

GPT Image 2.0 prompt brief if needed:

> Clean white smartphone notes-app style background with subtle paper/screen texture, no readable text, no icons, no product, generous blank centre area for editable headline, checklist, and product layer.

### R03 - Lifestyle Benefit Scene

Reference folder: `003-lifestyle-benefits/`

Product hero:

- Use the transparent product pack composited into the scene.
- If the product needs to feel physically grounded on the bench, generate a shadow/contact plate separately rather than regenerating the label.

Background:

- Required GPT Image 2.0 background: dark blue night-routine tabletop scene with soft side light, mug/shaker/clock style props, empty centre-lower space for the product, and no text.
- Target path: `generated/assets/backgrounds/r03-night-routine-bench-v1.png`

GPT Image 2.0 prompt brief:

> Photoreal vertical 9:16 dark-blue routine tabletop scene, quiet evening or early morning mood, soft side light, cup/mug, shaker, small clock or kitchen prop at the edges, empty lower-centre tabletop space for a protein pouch to be composited, no product packaging, no labels, no text, no watermark.

Icon set:

- Benefit pills are native editor shapes.
- If matching the source star badges more closely, generate a small star/badge sticker sheet:
  - `generated/assets/icon-sheets/r03-benefit-stars-v1.png`
  - `generated/assets/icons/r03-lifestyle-benefits/`

Production note:

- The emotional job is relief and calm control. The background should feel like a repeatable evening or early-morning routine, not a clinical supplement ad.

### R04 - Measured Serve Comparison

Reference folder: `004-comparison/`

Product hero:

- Use the transparent product pack on the preferred side.

Background:

- Native split background and table lines are acceptable.
- If the table needs a richer studio look, generate a split pastel comparison backdrop with no text:
  - `generated/assets/backgrounds/r04-split-comparison-studio-v1.png`

Props:

- Required if matching the source more closely: generic unbranded black tub/container or "whatever's handy" prop as an isolated transparent object.
- `generated/assets/props/r04-generic-container-transparent-v1.png`

GPT Image 2.0 prompt brief for prop:

> Isolated generic matte black supplement tub/container on flat chroma-key background, no branding, no label, no text, front-facing studio lighting, crisp edge, generous padding for background removal.

Icon set:

- Native check/cross marks are acceptable if used.
- Do not use named competitor logos or product marks.

### R05 - Quote Proof Product Hero

Reference folder: `005-review/`

Product hero:

- Use the transparent product pack.
- Place on a warm neutral surface with a soft shadow.

Background:

- Required GPT Image 2.0 background for final production: warm minimal studio surface, soft beige gradient, faint tabletop horizon, no product, no text.
- Target path: `generated/assets/backgrounds/r05-warm-quote-studio-v1.png`

GPT Image 2.0 prompt brief:

> Minimal warm beige studio backdrop for a product testimonial ad, soft tabletop horizon and subtle product shadow area, elegant restrained lighting, no product, no packaging, no typography, no watermark, vertical 9:16.

Icon set:

- None required.

Review asset rule:

- Do not create a fake customer review. Use a brand-proof line until a verified customer quote, name, and permission exist.

### R06 - Editorial Ingredient Hero

Reference folder: `006-editorial-hero/`

Product hero:

- Use the transparent product pack on the right.

Background:

- Required GPT Image 2.0 background or prop scene if matching the source: light green editorial studio with a clean surface and space for an ingredient cue.
- Target path: `generated/assets/backgrounds/r06-light-green-editorial-studio-v1.png`

GPT Image 2.0 prompt brief for background:

> Soft light-green editorial product studio background, clean surface, gentle gradient, fresh but not medical, empty right-side area for product and left-side area for ingredient cue, no product packaging, no text, no logos.

Ingredient/prop asset:

- Required GPT Image 2.0 prop if matching the source more closely: glass/cup or neat macro ingredient stack suggesting chocolate whey ingredients, with no claims and no text.
- Target path: `generated/assets/props/r06-ingredient-cue-transparent-v1.png`

GPT Image 2.0 prompt brief for ingredient cue:

> Isolated transparent-background ingredient cue for chocolate whey: neat glass or scoop arrangement with cocoa/chocolate powder and simple neutral ingredients, no fruit-health exaggeration, no product packaging, no text, no logo.

Icon set:

- Generate a hand-drawn arrow asset if the arrow remains part of the final layout:
  - `generated/assets/icon-sheets/r06-editorial-arrow-v1.png`
  - `generated/assets/icons/r06-editorial-hero/`

Production note:

- Do not imply the powder replaces whole foods. The ingredient cue supports product belief, not meal-replacement positioning.

### R07 - DM Routine Reply

Reference folder: `007-dm-story-reply/`

Product hero:

- Use the transparent product pack inside the story preview card, or composite it into a generated story thumbnail.

Background:

- Native DM/story UI is acceptable because the source ad is a UI mimic.

Story thumbnail asset:

- Optional GPT Image 2.0 thumbnail if matching the source more closely: casual phone-story image of a shaker/product routine on a kitchen bench, no person required, no text.
- Target path: `generated/assets/backgrounds/r07-story-thumbnail-routine-v1.png`

GPT Image 2.0 prompt brief:

> Casual vertical phone-story thumbnail image, Australian kitchen bench, shaker and simple morning routine props, soft natural light, no person needed, no product packaging, no readable text, designed to sit inside a DM story preview card.

Icon set:

- None required unless using custom reactions/stickers.

Production note:

- Do not fake a real customer DM. Keep the copy framed as a dramatized product conversation unless verified.

### R08 - Hand-Held Product Desire

Reference folder: `008-hand-showcase/`

Product hero:

- Final production needs a real hand-held composition.
- Preferred safe workflow: generate hand and background separately with GPT Image 2.0, then composite the approved transparent pack into the hand pose.

Background:

- Required GPT Image 2.0 background: soft colourful gradient backdrop similar to the source, no text and no product.
- Target path: `generated/assets/backgrounds/r08-gradient-studio-v1.png`

GPT Image 2.0 prompt brief for background:

> Vertical 9:16 soft colourful studio gradient backdrop inspired by a premium supplement hand-showcase ad, blue, yellow, teal, and muted violet glow, subtle photographic texture, no product, no hand, no text, no watermark.

Hand/hero asset:

- Required GPT Image 2.0 transparent hand asset: hand posed as if holding a pouch/canister, with fingers placed to allow the approved product layer to be composited, no product label, no text.
- Target path: `generated/assets/hero-shots/r08-hand-hold-transparent-v1.png`

GPT Image 2.0 prompt brief for hand:

> Realistic adult hand isolated on flat chroma-key background, fingers posed to hold a small pouch/canister from below and side, natural skin texture, no jewellery distraction, no product, no label, no text, crisp edges and generous padding for background removal.

Icon set:

- None required.

Production note:

- The hand is part of the desire mechanism. A CSS hand cue is only a layout stand-in and must not ship.

### R09 - Chocolate Sensory Hero

Reference folder: `009-ai-freestyle/`

Product hero:

- Use the transparent product pack centred in the lower safe area.

Background:

- Required GPT Image 2.0 background: teal/turquoise studio backdrop with subtle photographic grain and sensory lighting, no text, no product.
- Target path: `generated/assets/backgrounds/r09-teal-sensory-studio-v1.png`

GPT Image 2.0 prompt brief:

> Vertical 9:16 teal/turquoise studio product backdrop, subtle grain, rich summer-like light, clean central stage for a product pouch, premium sensory mood, no product packaging, no labels, no text, no watermark.

Optional prop/sensory asset:

- Optional GPT Image 2.0 chocolate/cocoa atmosphere or ribbon-like chocolate element behind the pack, no text.
- Target path: `generated/assets/props/r09-chocolate-sensory-accent-v1.png`

GPT Image 2.0 prompt brief for accent:

> Isolated chocolate/cocoa sensory accent on chroma-key background, smooth chocolate ribbon or cocoa splash shape, premium and appetising, no product packaging, no text, no watermark, generous padding.

Icon set:

- None required.
- Diagonal ribbon can be native editor shape unless a printed-tape texture is desired.

### R10 - Protein Routine Kit

Reference folder: `010-product-collection/`

Product hero:

- Use the transparent product pack as the centre item.

Background/kit:

- Required GPT Image 2.0 background: bright product-kit tabletop scene with shaker, scoop, spoon, cup, or bottle accessories arranged around an empty centre product space; no text, no logo, no pack.
- Target path: `generated/assets/backgrounds/r10-routine-kit-tabletop-v1.png`

GPT Image 2.0 prompt brief:

> Bright vertical 9:16 protein routine kit tabletop scene, clean warm/yellow studio palette, shaker, scoop, spoon, cup or bottle arranged around an empty centre space for a pouch product, no product packaging, no brand marks, no text, no watermark.

Icon set:

- None required.
- Stars/review marks must not be used unless verified.

Production note:

- Keep CTA and proof line as editor layers so they stay Reels-safe and editable.

### R11 - Wing It VS One Scoop

Reference folder: `011-comparison-playful/`

Product hero:

- Use the transparent product pack on the `one scoop` side.

Background:

- Native split background is acceptable.
- Optional GPT Image 2.0 split paper/studio texture:
  - `generated/assets/backgrounds/r11-playful-split-texture-v1.png`

GPT Image 2.0 prompt brief for background:

> Vertical 9:16 playful split background, left side light grey and right side warm brand yellow, subtle paper or studio texture, no products, no text, no logos, clear areas for comparison headline and proof cards.

Props:

- Optional GPT Image 2.0 "wing it" side prop, such as an unbranded messy snack/food-choice cue or empty fridge cue, isolated and transparent:
  - `generated/assets/props/r11-wing-it-prop-transparent-v1.png`

GPT Image 2.0 prompt brief for prop:

> Isolated playful routine-chaos prop on chroma-key background, unbranded messy snack/food-choice cue or simple empty-fridge cue, no body-shaming, no product packaging, no text, crisp edges for background removal.

Icon/sticker set:

- If the proof cards use icons, generate a simple sticker icon set. Do not use emoji as production artwork.
  - `generated/assets/icon-sheets/r11-playful-stickers-v1.png`
  - `generated/assets/icons/r11-comparison-playful/`

Production note:

- Keep the joke on routine chaos, not the viewer's body.
