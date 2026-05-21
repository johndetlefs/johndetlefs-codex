# Shopify Bottleneck Analysis Videos Brief

## Working Angle

The Shopify Bottleneck Analysis report tells the merchant where the main leak is likely happening. The embedded video should make the result feel personal, useful, and commercially urgent, while making the next step clear: have John inspect the actual store and find the real cause through a paid diagnostic.

These are diagnostic videos, not generic founder-heavy VSLs. The viewer gets a practical diagnosis and first checks, while the script demonstrates that John understands the situation well enough to help.

## Target Viewer

- Shopify store owners, ecommerce managers, and operators.
- Mostly practical Australian merchants who want plain-English help.
- Current strongest traction is with middle-aged women running Shopify stores, so proof choices and examples should feel relevant to serious retail, apparel, health, lifestyle, and values-driven ecommerce operators where possible.
- They have just entered their own Shopify numbers and are already primed to care about the result.
- They may be frustrated by vague advice, agency retainers, or random app/theme tweaks that did not solve the real issue.

## Commercial Intent

Move qualified users from the report results page to one named paid next step without making the report feel like a thin pitch.

Target offer language:

- Offer: Shopify Fix-It Diagnostic
- Price: $295
- Page headline: "Book your $295 Shopify Fix-It Diagnostic"
- Button: "Book my $295 Shopify Fix-It Diagnostic"
- Promise: confirm the real bottleneck, prioritize the fastest fixes, and give the merchant an action plan.

The current app CTA is `/booking` with legacy "Book a Shopify Fix-It Call" language, and the current app code still has $249 AUD defaults. Before recording or publishing, the app copy, tracking label, booking price, and script CTA need to be aligned. See `../conversion-plan.md`.

## Video Set

1. **How To Get Your Report Details**
   - Variant key: `reportSetup`
   - Purpose: help users follow the guided setup flow: paste Shopify Admin URL, open generated report links, upload the funnel CSV, enter AOV, and submit.
   - Core message: "Follow along with this page open. Over the next five minutes, we’ll grab the data we need from Shopify so we can get you the most useful result possible. There’s nothing too technical here. You’ve got this. Let’s get started."

2. **Product Page / Add-To-Cart Bottleneck**
   - Variant key: `addToCart`
   - Purpose: explain why visitors are not becoming interested enough to add to cart.
   - Core message: "If people are not adding to cart, the first job is to make the offer clearer and more compelling."

3. **Cart / Reach-Checkout Bottleneck**
   - Variant key: `reachCheckout`
   - Purpose: explain why people add to cart but do not continue to checkout.
   - Core message: "They're interested. Now the job is to remove doubt and get them cleanly into checkout."

4. **Checkout Completion Bottleneck**
   - Variant key: `checkoutCompletion`
   - Purpose: explain why high-intent shoppers reach checkout but do not complete the purchase.
   - Core message: "These people were close to buying. Small checkout fixes can have a very direct revenue impact."

5. **Healthy / No Major Bottleneck**
   - Variant key: `healthy`
   - Purpose: explain that the top-line funnel is broadly okay, then shift the question to the highest-value growth lever.
   - Core message: "Nothing is obviously broken, so now we prioritise the highest-return improvement."

## Sales Letter Arc

Each result video should follow:

1. Immediate reveal: confirm the report is theirs and state the top-line diagnosis in the first 20 seconds.
2. Diagnosis: explain what this stage leak means in plain English.
3. Cost of inaction: translate the leak into missed revenue, wasted effort, or urgency without overclaiming.
4. Fix path: give the viewer one practical mental model for what needs to change, not a long checklist.
5. Paid next step: acknowledge the expertise gap, position John as the person who can be on their team, and invite them to book the $295 Shopify Fix-It Diagnostic.
6. Close: reassure them that the issue is fixable, then give one clear CTA.

Recommended timing:

- Immediate reveal: 0:00-0:20
- Diagnosis: 0:20-1:20
- Cost of inaction: 1:20-2:10
- Fix path: 2:10-3:20
- Paid next step: 3:20-4:30
- Close: 4:30-5:30

## Voice

- Direct, practical, experienced, and low-fluff.
- Warm enough that a small store owner feels safe asking basic questions.
- Specific enough that the viewer feels understood.
- Avoid broad agency language and generic ecommerce growth claims.
- Sound like an operator reading the numbers, not a marketer performing a sales script.
- Use contractions and short spoken sentences.
- Reduce hedging. If the pattern is clear, say it clearly.
- Do not overcook a good concept. If a section starts becoming its own lesson, compress it back to the job it needs to do.
- Use the add-to-cart script as the voice reference for future result scripts.

## Visual Direction

- Format name: presenter-led diagnostic video with Remotion motion-graphic overlays.
- The primary video is John's talking-head instruction. The viewer should feel like John is personally walking them through the result.
- Use Remotion as the production and compositing layer: lower thirds, captions, key phrase emphasis, stage highlights, funnel diagrams, metric cards, generic mockups, transitions, and CTA cards.
- Use full-screen Remotion graphics as short cutaways when a concept is easier to understand visually, then return to John.
- Use screen capture only where the viewer needs exact process guidance, especially the setup video and any Shopify export steps.
- Use generic Shopify-style mockups rather than real merchant examples for result videos: abstract product pages, cart drawers, checkout screens, funnel rails, metric cards, and checklist panels.
- Show the report state early, then use Remotion-built overlays and cutaways to explain the pattern.
- Visualise the mental model in each section: belief/reversal, cost stacking up, promise handoff, trust loss, imagined ownership, cart momentum, checkout friction, priority choice, or action plan.
- Use text-only proof strips for brand names unless approved logo assets are available.
- Match the lead-generation ad and landing page visual language so the viewer feels one continuous journey from click to report to result.
- Highlight one metric, stage, or user decision at a time.
- Use short on-screen labels, not dense slides.
- Keep graphics "everyman": practical, plain-English, and specific enough to teach without feeling like a case study of someone else's store.
- Use an inline player above the report detail, with no autoplay.
- Keep the CTA directly below the video and repeat the same CTA language later on the page where useful.

Reusable Remotion component ideas:

- `PresenterFrame`: talking-head layout with optional side panel or picture-in-picture graphic.
- `LowerThird`: name, result state, or section marker.
- `KeyPhraseCaption`: short spoken phrase highlighted without becoming full subtitles.
- `FunnelStageRail`: sessions, add to carts, reached checkout, completed purchases.
- `LeakHighlight`: animated red/orange stage emphasis for the flagged bottleneck.
- `VisitorDots`: small shopper dots moving through or dropping out of the funnel.
- `GenericStorefrontMock`: neutral product, collection, cart, and checkout layouts.
- `MetricCard`: stage metric, benchmark, and plain-English interpretation.
- `CauseChecklist`: short cause-category cards revealed one at a time.
- `PromiseHandoffSplit`: ad/email/search/social promise on one side, destination page first screen on the other.
- `TrustDropMeter`: simple visual for uncertainty reducing trust.
- `OwnershipBuilderMock`: product-page elements combining into "I can picture owning this."
- `BrandProofStrip`: text-only proof chips for approved brand/client names.
- `DiagnosticCtaCard`: final paid diagnostic offer matching the page CTA.

## Retargeting Direction

- Create 15-30 second vertical cutdowns after the main videos.
- Each cutdown should focus on one result line only.
- Assume sound off and use captions.
- Do not reuse the full result video as a paid social asset.

## Claims To Avoid

- Do not guarantee the estimated revenue gap is recoverable.
- Do not imply John has inspected the store before the call.
- Do not pretend the pre-recorded video knows exact numbers beyond the result state.
- Do not make checkout changes sound trivial when plan, app, payment, and platform constraints may apply.
- Do not sell the $695/month coaching program as the primary result-page CTA.
- Do not introduce large scoped project positioning unless the user has signalled that path.
