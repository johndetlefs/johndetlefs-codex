# Product Ad Callout And Icon Process

Use this process before generating callout icons or placing callout lockups in a source-inspired ad. The goal is to make every callout earn its place: it must create desire, answer a real product question, and use a visual metaphor that is obvious in the ad context.

## 1. Intake

Collect enough context to avoid guessing:

- Product page URL.
- Brand/client.
- Product name and product image source.
- Source ad template or reference image.
- Target audience or angle, if known.
- User notes on what must be emphasized or avoided.
- Compliance limits, especially alcohol, health, finance, or regulated product claims.

If an angle is not supplied, propose one from the product page rather than inventing copy from the template alone.

## 2. Product-Page Diagnosis

Extract the product truth before writing callouts:

- Category and subcategory.
- Sensory cues: taste, smell, texture, finish, ritual, occasion.
- Proof or craft cues: origin, process, ingredients, production method, recognitions.
- Usage moment: when the buyer would use or serve it.
- Main anxieties: unfamiliarity, price, effort, sweetness, suitability, prep, credibility.
- Desire levers: novelty, rarity, convenience, confidence, indulgence, craft, status, relief.
- Banned claim territory.

Keep this diagnosis in the product `source/product-page-analysis.md` or an angle-specific source file.

## 3. Callout Strategy Matrix

Before image generation, create a matrix for the user to approve.

Each callout must include:

- `callout_text`: the visible ad text.
- `source_truth`: the product-page detail or approved brand truth behind it.
- `emotional_job`: the feeling or objection the callout addresses.
- `viewer_takeaway`: what the viewer should understand in one glance.
- `visual_role`: whether the icon clarifies taste, usage, origin, ritual, proof, or convenience.
- `recommended_metaphors`: concrete icon concepts that fit the callout.
- `banned_metaphors`: concepts that would be misleading, generic, or off-angle.
- `mismatch_risk`: the most likely way the icon could say the wrong thing.
- `asset_set`: the editor `assetSet` slug for the callout variants.
- `confidence`: high, medium, or low.
- `user_decision`: pending, approved, revise, or remove.

Do not generate icons from the callout text alone. Generate them from the approved meaning brief.

## 4. User Steering Checkpoint

Show the callout matrix before generating or regenerating icons.

The user can steer by saying:

- Keep, change, remove, or split a callout.
- Make the ad more premium, literal, playful, sensory, educational, founder-led, or proof-led.
- Add or reject a product-page detail.
- Ban specific metaphors.
- Ask for a different audience or offer angle.

User change path after seeing icons:

1. Identify the callout and variant if possible, such as `Chocolate pairing option 3`.
2. Capture the user's reason in plain language.
3. Classify the issue using the list below.
4. Decide whether the fix is a variant swap, a callout-row regeneration, a full-sheet regeneration, a copy change, or a layout/scale pass.
5. Update `callout-strategy.md` before generating new assets.
6. Generate with GPT Image 2.0 only after the revised brief is clear.

If the user rejects an icon after generation, capture the reason in the matrix. Classify it as one of:

- `wrong metaphor`: the visual says the wrong thing.
- `too generic`: the icon could belong to any product.
- `off-category`: the visual belongs to another category, such as coffee in a wine ad.
- `style mismatch`: stroke, density, or polish does not match the set.
- `scale problem`: the icon is correct but too small, thin, or low contrast in the layout.
- `copy/icon mismatch`: the callout text itself may need changing.

## 5. Icon Generation Rules

Production callout icons must be generated with GPT Image 2.0 as a cohesive system, then cut into transparent PNGs.

Preferred workflow:

1. Generate one approved 4 x 4 icon sheet, with four variants per callout.
2. Use a flat chroma-key background for removal.
3. Remove the background locally.
4. Slice into transparent PNGs.
5. Build a contact sheet for review.
6. Store the source sheet, slices, contact sheet, and prompt beside the client/product assets.
7. Expose the slices through the ad-level `asset-groups.json`.
8. Assign each icon layer an `assetSet` so the inspector only shows relevant variants.

Regeneration workflow:

- If one icon is wrong but the callout strategy is correct, regenerate that callout row or the full sheet using the same style prompt.
- If multiple callouts are wrong, revise the callout matrix before generating again.
- If the style is inconsistent, regenerate the full sheet rather than mixing unrelated one-off icons.
- Keep prior source sheets versioned until the replacement is accepted.

Prompt requirements:

- State the product category and ad purpose.
- State the exact callout rows and variant concepts.
- State the approved viewer takeaway for each callout.
- Include positive metaphor guidance and banned metaphor guidance.
- Require consistent stroke, padding, visual density, and polish.
- Require no text, labels, numbers, logos, watermarks, UI, shadows, or background texture.
- Require small-size legibility.

Bad metaphor examples:

- Do not use coffee cups or cocoa plants for `Chocolate pairing` in a wine ad unless the callout explicitly mentions coffee or cocoa origin.
- Do not use water drops for `Sour cherry nectar` if the desired meaning is wine richness, cherry preserve, aroma, or ruby depth.
- Do not use landscape-only hills for `Ritual` unless the callout is really about origin, vineyard, estate, or provenance.

## 6. Icon Size And Placement QA

Judge icon size by the visible alpha artwork, not by the PNG frame or editor box.

For every icon set:

- Check the transparent slice has an alpha bbox that fills enough of the frame.
- Crop or normalize excessive padding before using the slice in the editor.
- Thin or narrow motifs must be placed larger than compact square motifs.
- Export or preview at real ad size, then inspect at thumbnail size.

Layout checks per ratio:

- Record the icon frame size in the editor.
- Estimate or measure the scaled visible alpha bbox.
- Check the icon reads in under one second at thumbnail scale.
- Check the icon feels intentionally paired with its text, not floating above it.
- Check the icon has enough weight relative to the arrow stroke and callout text.
- Check icon, arrow, text, and product spacing as one lockup.
- Check safe-zone clearance after any size change.

R01 starting point:

- Story icons usually need to occupy roughly 8-12% of canvas width as an editor frame, but the actual target depends on alpha padding and stroke density.
- If the visible alpha bbox falls below roughly 6-7% of story canvas width, the icon will often feel too small beside bold callout text.
- Square and portrait feeds normally need larger callout/icon treatment than direct 9:16 proportional scaling.

## 7. Acceptance Gate

Do not mark a callout icon set as production-ready unless all are true:

- The callout text is product-true.
- The icon metaphor supports the specific callout, not just the broad category.
- The icon does not imply a different claim, occasion, or product category.
- Four variants exist for each callout.
- The set is stylistically cohesive.
- The selected icon is legible at final layout size.
- The user has had a clear chance to steer the callout and icon direction.

## 8. Required Files

For each client/product/template icon pass, keep:

- `callout-strategy.md`: approved matrix and review notes.
- `asset-groups.json`: editor asset manifest with `assetSet` metadata.
- `gpt-image-2-...-prompt.md`: exact generation prompt and production rules.
- `gpt-image-2-...-source.png`: generated source sheet.
- `gpt-image-2-...-contact-sheet.png`: review sheet.
- Final transparent PNG slices.
