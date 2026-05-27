# Get Rid Of Dad Bod - Ad Production Process

## Source-Faithful Workflow

The target for source-inspired templates is not "same ad category." The target is a reusable template that preserves the source advertisement's selling mechanism and visual signature while swapping in the client's product, claims, and brand-safe language.

Do not start layout or asset generation from a source ad until the source has a forensic teardown.

Required sequence:

1. **Forensic teardown**: create `reference-ads/<reference-folder>/forensic-teardown.md` using `reference-ads/forensic-teardown-template.md`.
2. **Source-faithfulness decision**: identify which source elements are mandatory to preserve, which can be adapted, and which must change for compliance, product truth, or client brand fit.
3. **Asset manifest update**: update `reference-ads/asset-requirements.md` from the teardown. Every required background, product hero, prop, icon, sticker, shadow, texture, or typography choice must be named before layout begins.
4. **Asset pass**: generate, cut, or source the missing visual assets before building the final layout. CSS placeholders are allowed only for rough diagnosis, not production.
5. **Template build**: compose the ad with the approved product layer and generated/source-matched assets.
6. **Side-by-side QA**: compare the template against the source using the scorecard in the teardown. Iterate until the critical source elements are visibly present and safe-zone compliant.
7. **Manual correction capture**: if the editor is used to correct placement, immediately record the exact asset, x/y, width/height, rotation, mirror/flip, and visible connection intent in the teardown, then copy those values into the editor seed and renderer.

The forensic teardown must cover:

- canvas, aspect ratio, and visible safe-zone risks;
- source copy, line breaks, hierarchy, and emotional job;
- composition map using percentage positions, not only descriptive language;
- headline, subhead, badge, and CTA lockup maps, including combined bounding box, plaque/pill width ratio, vertical gap or overlap, text fill ratio, line breaks, radius style, thumbnail legibility, downstream whitespace to the product/scene, and whether the source treats the text as one connected badge or separate blocks;
- connector map for every arrow, line, UI pointer, or visual guide, including tail position, head position, direction, curve/bow direction, asset orientation, mirror/flip state, rotation, the callout/element it starts from, and the product/scene element it ends by pointing to;
- callout lockup map for every icon/text/arrow/product cluster, including the combined cluster bounding box, cluster anchor against the product, icon-to-text gap, arrow-to-text gap, arrow-to-icon gap, arrowhead-to-product gap, product-to-callout distance, overlap exclusions, relative scale against the product, and whether the source intentionally uses tight, medium, or loose spacing;
- background colour, texture, lighting, and depth;
- product scale, crop, angle, shadow, and relationship to text;
- typography style, casing, weight, and contrast;
- icon, arrow, sticker, UI, prop, or image asset style;
- what the source ad makes the viewer feel before it asks them to buy;
- exact requirements for a client/product adaptation;
- acceptance criteria for deciding whether the template is close enough.

For client work, this teardown is the reusable speed layer. Once it exists, future products can be slotted into the same diagnosed mechanism quickly without guessing from the reference image again.

## Editor Persistence

The editable ad canvas must be served through the local editor server when persistence matters:

```bash
python3 product-ads/get-rid-of-dad-bod/scripts/editor-server.py --port 8765
```

The Save button writes the full editor project to `meta-image-ad-editor-state.json` through `/api/meta-image-ad-editor/project`. The browser-local copy remains only as a fallback cache for static-file mode or emergency recovery.

When a saved editor change becomes the accepted template state, copy the relevant implementation values into the source seed, renderer, and forensic teardown. The saved editor state is the working file, not a substitute for documenting the reusable template contract.

Arrow/connector QA rule:

- Treat arrows as connectors, not decoration.
- The tail must visually originate from the callout, icon, quote, UI bubble, or label it belongs to.
- The arrowhead must visually land on, point into, or terminate beside the product, ingredient, feature, UI region, or scene object being described.
- Do not accept an arrow because its general direction is correct. It must also connect the correct source element to the correct target element and curve in the same visual pattern as the source.
- Record and reproduce the curve handedness: whether the arrow bows above, below, left, or right of the implied connector line. If the arrowhead is correct but the curve bows the wrong way, it fails QA.
- Record and reproduce spacing intent. Arrows should not crowd or overlap their text/icon unless the source clearly does so, and they should not float so far from the product that the target relationship weakens.
- For callout clusters, check three distances in the final render: text-to-arrow clearance, icon-to-arrow clearance, and arrowhead-to-product clearance. Any one of these can make a correctly curved arrow feel wrong.
- For transparent PNG arrows/icons, do not rely only on the asset bounding box. Record the visible stroke/drawn mark position as well, because transparent padding can make a mathematically overlapping box look visually correct or the reverse.
- Verify arrow head/tail placement in the rendered export, not only in the layer inspector or asset filename.
- When a manually adjusted arrow is accepted, lock the exact implementation values in the teardown so future builds can reproduce the same curve, not a loose approximation.

Callout lockup QA rule:

- Treat each icon, text block, and arrow as one callout lockup before tuning individual layers.
- Place the product first, then block in the combined callout lockup boxes around the product, then tune icon/text scale, then place arrows last.
- Match the source's overall lockup footprint before judging micro-spacing. A callout can have technically correct internal spacing and still fail if the whole lockup is too large, too far from the product, or too spread out.
- Record the lockup anchor: top-left, top-right, lower-left, lower-right, or another product-relative anchor. The lockup should read as orbiting the product, not as independent text floating in the safe zone.
- Compare the rendered export at thumbnail size. If the callouts do not read as compact satellites around the product at a glance, the layout fails even if the inspector numbers look plausible.

Headline/subhead badge QA rule:

- Treat a stacked headline, subhead, offer pill, proof pill, or CTA plaque as one lockup before tuning individual text layers.
- Measure the source's combined lockup footprint, then measure each internal layer: headline plaque, headline text, subhead/CTA pill, and subhead/CTA text.
- Record whether the smaller pill overlaps, touches, or floats away from the larger plaque. A source that uses a tucked pill should not be rebuilt as two separated horizontal bands.
- Match the text fill ratio, not only the text box. If source headline type fills most of its plaque height, a smaller font inside the same plaque will read as the wrong format.
- Record the relative widths. A 60% subhead pill under a 90% headline plaque should remain a centred compact badge unless the ratio adaptation explicitly changes it.
- Recheck the lockup after client copy is inserted. A longer or more practical product subhead may need a taller pill and larger type than the source, as long as the visual role remains the same.
- Measure the vertical dead space from the bottom of the text lockup to the product/hero cluster. In adapted ratios, especially 1:1, leaving source-like micro-proportions can create an unintentional empty band that weakens the ad.
- Prefer optical continuity over raw source percentages when a ratio change alters the canvas. The subhead should still feel attached to the headline while helping lead the eye down to the product.
- Verify at thumbnail size that the headline/subhead reads as one visual idea before accepting the composition.

Full-composition balance QA rule:

- After individual element sizing and lockup spacing are accepted, measure the full visible creative block against the canvas and relevant safe zone.
- In feed formats, compare top and bottom breathing room for the whole block, not only the product. A layout can have correct product/callout spacing but still feel top-heavy if the bottom gap is larger.
- When sizes are already accepted, fix symmetry by translating the full creative block as a group before resizing any individual layer.
- Keep the translated group inside the active safe-zone overlay and record the final group shift in the teardown.
- For 4:5 feed adaptations from an accepted 1:1 layout, start by preserving accepted element scale and lockup relationships, then centre the full visible creative block within the taller canvas before making any per-layer exceptions.
- Do not leave legacy ratio layouts in place when another ratio has been manually accepted. Rebuild the ratio from the accepted implementation lock, then verify the source mechanism, feed edge guard, and visual balance together.
- For 1.91:1 link/feed adaptations, expect a redesign rather than a proportional transfer. Preserve the source's selling mechanism and asset language, then choose a wide composition that still makes the product the hero.
- In wide ratios, keep the headline/subhead badge readable at thumbnail size, keep product scale large enough to be inspectable, and rebuild callouts as compact satellites around the product. Do not let callouts become disconnected left/right decorations.
- Verify the eye path in wide ratios: headline badge first, product second, proof callouts third. If the viewer reads the callouts before understanding the product, the redesign has lost the source intent.
- After the first wide-ratio pass, do a product-gravity pass: judge whether the product is visually centred within the callout orbit, not merely centred in the canvas. Small downward product shifts can make the product feel anchored while still preserving safe space.
- For wide callout satellites, prioritise shoulder/base relationships to the pack over even grid rows. Upper callouts should point into the upper product shoulders; lower callouts should tuck into the base corners without creating a bottom-heavy row.
- Tune arrow rotation after moving the callout text/icon, not before. In wide ratios, a correct arrow often needs a stronger diagonal than the vertical/source layout because the callout sits beside the product rather than above or below it.
- Keep the subhead pill compact and legible. If a wide headline badge dominates the top band, shorten the pill height and increase the subhead text slightly so the pill reads as a crisp bridge rather than a second heavy bar.

## Product Image Standard

Production templates must use a no-background product layer unless the reference format explicitly requires a full-scene product photograph.

Current approved product layer:

- `generated/assets/product-shots/whey-pack-3quarter-ai-transparent.png`

Do not use `source/whey_protein_concentrate_chocolate.png` as a production layer in ad templates. It is retained as a source/reference file only.

When a reference ad requires a new product angle, hand-held product, table-grounded product, or kit-style product hero, use GPT Image 2.0 for the supporting shot, but protect product accuracy:

1. Prefer generating the background, hand, props, or surface without product text.
2. Composite the approved transparent product layer into that scene.
3. If GPT Image 2.0 generates a new product-facing asset, inspect and manually correct label text before treating it as production artwork.
4. Store approved product hero variants under `generated/assets/product-shots/` or `generated/assets/hero-shots/`.

## Required Workflow For Asset-Based Ads

Any ad format that uses hand-drawn arrows, icons, stickers, badges, scribbles, product callouts, illustrated labels, photoreal backgrounds, lifestyle scenes, hand-held shots, tabletop scenes, props, or similar reusable visual assets must start with a dedicated asset pass before layout work.

Do not hand-code final icons or arrows as placeholder SVG paths and do not rely on emojis for production creative.

Required sequence:

1. Choose the reference ad and document the visual language.
2. Generate or source a dedicated asset sheet for the format.
3. Store the original sheet under `generated/assets/icon-sheets/`.
4. Cut usable assets into individual transparent files under `generated/assets/icons/<style-name>/`.
5. Create a contact sheet for quick visual review.
6. Wire the editor/template to use those assets as editable layers.
7. Use the editor for layout only: move, resize, rotate, mirror, swap assets, and export ratios.
8. If the format will be reused heavily, trace the selected winners into cleaned SVGs so colour and stroke width remain fully editable.

Never keep a flawed support asset just because the layout is close. If an icon or arrow has stray dots, bad crops, awkward linework, or the wrong metaphor, fix the source PNG or regenerate that asset family before continuing layout polish.

## GPT Image Asset Pass

Use GPT Image 2.0 for the first visual asset pass when the target style is illustrative, hand-drawn, marker-like, sticker-like, painterly, photographic, textured, lifestyle, tabletop, hand-held, or otherwise not a simple native UI shape.

The prompt must request:

- one coherent asset sheet;
- generous spacing between assets;
- a flat removable chroma-key background;
- no labels or text unless text is part of the final asset;
- assets that read clearly at mobile ad sizes;
- original assets inspired by the reference style, not copied from it.

For backgrounds and hero scenes, the prompt must also request:

- no product packaging unless the asset is explicitly a concept-only product render;
- no generated text, claims, logos, badges, or watermarks;
- clear empty space where the approved product layer and editable copy will be composited;
- lighting and perspective that match the reference advertisement.

Template-specific asset requirements live in `reference-ads/asset-requirements.md`. Treat CSS gradients, CSS props, emoji, and simple HTML mock elements in the gallery as layout scaffolding unless that manifest explicitly says native shapes are acceptable for final production.

For the feature/benefit product hero format, the required asset families are:

- at least four short arrow variants for each direction needed by the layout;
- at least four product-benefit icon variants for each feature/benefit callout;
- optional utility marks such as checkmarks, sparkles, scoops, and ingredient cues.

For the current feature/benefit template, the minimum icon set is:

- `31g protein`: four protein/muscle support icons.
- `Low sugar chocolate`: four low-sugar or reduced-sugar icons.
- `Grass fed whey`: four grass-fed, leaf, pasture, or ingredient-clean icons.
- `No messy prep`: four shaker, scoop, cup, or prep-ease icons.

Asset regeneration workflow:

1. Generate the replacement sheet with GPT Image on a flat chroma-key background.
2. Copy the chosen sheet into `generated/assets/icon-sheets/` with a versioned name.
3. Cut and review the assets using `scripts/build-feature-benefit-asset-pack.mjs` or a template-specific equivalent.
4. Remove specks by editing the source asset PNG, not by hiding them behind layout elements.
5. Rebuild the contact sheet.
6. Add only the acceptable candidates to the editor dropdowns.
7. If a candidate is rejected later, leave it archived in the asset folder but remove it from the editor map so it cannot be picked by mistake.

## Editor Rules

The editor should treat these assets as image or SVG layers. Each layer must support:

- select/deselect;
- move;
- resize;
- rotate;
- mirror;
- visibility toggle;
- lock toggle;
- per-ratio positioning;
- export into all required ratios.

PNG/image layers should default to locked aspect ratio. The ratio lock can be turned off per layer when distortion is intentional.

Clicking on empty canvas space should deselect the active layer.

Safe-zone overlays are required for placement-aware exports. The editor must provide non-exporting toggles for:

- Stories: keep key text, logos, product claims, CTAs, and faces out of the top 14% and bottom 20% of the creative. Use a 6% side buffer for practical device variance.
- Reels: use the stricter working area: top 14%, bottom 35%, and 6% on each side. If one 9:16 creative may run across both Stories and Reels, design to the Reels overlay.
- Edge guard: keep feed-format essentials inside a 5% inset unless a deliberate full-bleed product/background crop is being used.

Before exporting `9:16`, switch on the Reels overlay and confirm the main headline, core product view, feature labels, logos, and CTA-style copy sit inside the safe rectangle. Before exporting `4:5`, `1:1`, or `1.91:1`, switch on Edge guard and confirm text and logos are not riding the canvas edges.

Research references checked on 2026-05-25:

- Meta Instagram Help: `https://www.facebook.com/help/instagram/192168966243613` documents the Stories CTA sticker guidance to leave roughly 14% top and 20% bottom clear.
- Meta for Business Reels Ads: `https://www.facebook.com/business/ads/facebook-instagram-reels-ads` documents Reels safe-zone checking and the need to keep key creative elements in the safe zone.
- Meta safe-zone implementation reference: `https://adsuploader.com/blog/meta-ads-safe-zones` gives the current working Reels clearance as 14% top, 35% bottom, and 6% sides.

## Quality Bar

An ad is not production-ready until the asset style looks intentionally designed at final export size. If the arrows or icons look like rough code sketches, emojis, generic line icons, or accidental placeholders, the asset pass has failed and must be redone before layout polish.
