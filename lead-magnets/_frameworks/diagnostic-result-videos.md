# Report Lead Magnet Diagnostic Videos

Use this pattern for videos embedded in report-style lead magnets. These are not generic founder-led VSLs. They are diagnostic videos: personal, specific, instructional, positively focused, and explicit about the next paid step.

The job of the video is to move the viewer from curiosity to recognition, then to controlled concern, then to relief, then to action. The viewer should feel, "This is exactly what is happening in my store," before they are asked to book.

Do not sell fear. It is fine to explain costs, missed revenue, wasted effort, and operational consequences, but never use shame, doom, or exaggerated negativity as the sales engine. The frame is: building an ecommerce business is brave, the current situation is understandable, every problem is fixable, and now there is a clear next step.

## Where Things Live

Keep the repeatable system in this doc:

- `lead-magnets/_frameworks/diagnostic-result-videos.md`

Keep scripts and production planning in a lead magnet packet:

- `lead-magnets/<lead-magnet-slug>/videos/`

Keep app implementation notes in the website repo:

- `next/docs/report-lead-magnet-videos.md`

Keep app wiring in the lead magnet implementation:

- video component config;
- route-local video ID config;
- tracking for results viewed, video engagement, and booking clicks where available;
- result variant keys used by the calculator.

Do not put long scripts directly in app components. App components should only know which result variant maps to which video ID, title, supporting copy, and CTA.

## Default Packet Shape

For each report lead magnet, create a video packet:

```text
lead-magnets/<lead-magnet-slug>/
  status.md
  brief.md
  conversion-plan.md
  videos/
    status.md
    brief.md
    hooks.md
    video-manifest.md
    scripts/
      _template.md
      00-report-setup.md
      01-<result-variant>.md
      02-<result-variant>.md
      03-<result-variant>.md
      04-healthy.md
    recording-checklist.md
    edit-brief.md
    retargeting-cutdowns.md
```

Create only the files needed for the current stage, but keep the lead magnet `status.md`, root `conversion-plan.md`, and video `video-manifest.md` current.

## Video Roles

Most report lead magnets need two classes of videos:

1. **Setup video**: helps the user enter or import the numbers correctly. It should be instructional, calm, and specific.
2. **Result videos**: one video per result state. These are diagnosis-led sales letters. They explain the single most important result, why it matters, what likely causes it, and why the paid diagnostic is the next rational step.

For result videos, keep the video useful even if the viewer never books. The authority comes from the diagnosis, not from withholding the useful part.

## Result Video Structure

Use this structure for result videos:

| Segment | Rough timing | What it must do |
| --- | ---: | --- |
| Immediate reveal | 0:00-0:20 | Confirm the report is theirs and state the top-line diagnosis fast. |
| Diagnosis | 0:20-1:20 | Explain the bottleneck in plain English. |
| Cost of inaction | 1:20-2:10 | Translate the issue into missed revenue, wasted effort, or leakage. Keep it conservative. |
| Fix path | 2:10-3:20 | Give one clear mental model for what needs to change and what to inspect first. |
| Paid next step | 3:20-4:30 | Position the paid diagnostic as the way to get the missing expertise on the team. |
| Close | 4:30-5:30 | Reassure, give one specific CTA, and remove ambiguity. |

Healthy/no-major-bottleneck result videos can compress this structure. If the diagnosis already lands the useful idea, such as "conversion is now one important lane inside a growing business", do not force separate cost-of-inaction or fix-path sections. Move directly into the paid next step.

The viewer should get the main reveal in the first minute. Do not meander into backstory, broad context, or founder credibility before stating the result.

## Sales Letter Arc

The structure above should still feel like a story:

1. **Immediate reveal**: "Here is the single bottleneck."
2. **Diagnosis**: "Here is what that means in plain English, including the customer behaviour behind it."
3. **Controlled concern**: "Here is what this may be costing or wasting."
4. **Relief**: "Here is the mental model for fixing this, so this is not random."
5. **Paid next step**: "Here is the most natural next commercial step for this specific result."

Do not add a standalone recognition-story section by default. If a viewer-recognition moment is useful, fold it into the diagnosis in one or two sharp lines. The result videos should move quickly from reveal to diagnosis to consequence.

Use a but/therefore arc. Avoid list-shaped scripts where each section merely adds another point.

## Retention Loop Discipline

The video should earn attention all the way to the booking CTA by making each section resolve one question and open the next one.

Use this progression:

1. **Hook opens the contradiction**: "I thought the problem was X, but the result says Y."
2. **Diagnosis answers what Y means**: translate the metric into customer behaviour.
3. **Cost of inaction answers why it matters**: show why obvious tactics waste money or miss the real issue.
4. **Fix path answers what the real job is**: give one practical mental model, not a checklist.
5. **Paid next step answers what happens next**: make the diagnostic feel like the natural way to apply the mental model to their actual store, whether that means getting expertise on the team or keeping conversion sharp while the business scales.

Do not let sections end flat. Each section should either create concern, resolve concern, or make the next question feel inevitable. The viewer should receive genuinely useful information, but the information should culminate in the obvious conclusion that expert inspection is the next rational step.

## Current Reference Standard

Use these scripts as the current reference for how a strong result script should feel:

- `lead-magnets/shopify-bottleneck-analysis/videos/scripts/01-add-to-cart.md`
- `lead-magnets/shopify-bottleneck-analysis/videos/scripts/02-reach-checkout.md`
- `lead-magnets/shopify-bottleneck-analysis/videos/scripts/03-checkout-completion.md`

The useful lessons from those scripts:

- Write for John's mouth, not for a strategy document. Use contractions, short spoken sentences, and concrete language.
- Remove hedging unless the claim genuinely needs it. Prefer "this is costing you money" over "this might be costing you money."
- Keep the tone constructive. The viewer should not feel blamed for the result or expected to already be an ecommerce expert. The cost section can create urgency, but it should never become fear-based selling.
- Do not over-explain a good point. If a section starts becoming its own mini-video, compress it back to the job it needs to do in the arc.
- Hooks need dissonance and an open loop. The hook can reveal the flagged stage, but it should not list causes or fixes.
- The diagnosis should translate the metric into customer behaviour. Example: "People are looking, but they're not committing."
- The cost-of-inaction section should show why the obvious tactics can make the problem worse or more expensive.
- The fix path should name the practical mental model, not just list checks. For add-to-cart, the model is promise continuity, trust, imagined ownership, and making Add to Cart feel inevitable.
- The fix path must match the stage psychology. For add-to-cart, the buyer is still deciding whether they want the product from this store. For reach-checkout, product desire is already solved; the buyer is now judging the vendor and looking for risk reversal.
- Checkout completion is a different stage again. Do not re-run the reach-checkout delivery/returns risk-reversal script. By checkout, Shopify has done much of the heavy technical work; the useful diagnosis is what the merchant, settings, or apps are doing to get in the way of the final payment step.
- Avoid social-post cadence in spoken scripts. Do not stack repeated lines like "X creates risk, Y creates risk, Z creates risk" unless John explicitly asks for that rhythm. Prefer one clean spoken idea that names the job and why it matters.
- Do not turn planning notes into spoken inventory. Sections like "Likely Causes", "First Checks", and "Likely Growth Levers" are for thinking, not phrasing. Avoid comparison ladders such as "if add-to-cart is weak...", "if reach-checkout is weak...", or "you could work on..." unless John explicitly asks for that structure. They read like a strategy memo or LinkedIn post, not a result video.
- Cost-of-inaction should not loop back through the same metaphor repeatedly. It should show why obvious tactics are short-term or band-aid fixes, then create a clean reason to move into the fix path.
- For checkout completion, be honest that the immediate settings fixes are simple. Do not inflate complexity. The commercial bridge is that a store with checkout completion as the main leak is probably starting to work, so the next value is optimisation, scale, and keeping conversion sharp while the operator focuses on growth.
- For healthy/no-major-bottleneck scripts, do not force the "problem" section to feel negative. This result should feel positive and fun. Use the business adolescence idea, explicitly referencing Michael Gerber's `The E-Myth` where useful: the store has momentum and is big enough to need structure before all the structure exists. The tension is not panic or failure; it is owner attention. The store is moving into optimisation and scale, so conversion becomes one important lane among stock, fulfilment, hiring, customer service, cash flow, ads, margins, and other growth work.
- The paid next step should follow the emotional setup. If the section has already established the expertise gap, move into why John belongs on the team. If the section has established that the store is already working, move into conversion oversight while the business scales. Do not leave old generic paid-step scaffolding in a script after the premise changes.
- Close with one action. Keep it warm, specific, and matched to the result state; do not add broad reassurance if the viewer's result suggests the business is already working.

## Hook Rules

Create five hook options before writing the full script. A hook is not just a clear opening. A hook creates dissonance.

For result videos, use this structure:

1. **Belief**: state what the viewer probably believed before seeing the report.
2. **Reversal**: turn that belief over using their result.
3. **Curiosity gap**: open a question without answering it yet.
4. **Bridge**: point into the diagnosis.

The curiosity gap is the missing "why", not the result itself. It is acceptable to reveal the flagged funnel stage, because the page is already showing the result. It is not acceptable to reveal the likely causes in the hook. If the hook says "this is probably your imagery, price support, trust, shipping, payment methods, or discount behaviour", the hook has already spent the curiosity.

Use this test:

- **Pass:** the viewer thinks, "Hang on, if that is true, what is causing it?"
- **Fail:** the viewer thinks, "Okay, I know the answer now."

The belief should be something a real merchant would recognise, such as:

- "I thought checkout was the problem."
- "I thought I needed more traffic."
- "I thought people were abandoning because of price."
- "I thought no major leak meant there was nothing to fix."

The reversal should be specific to the result state:

- "But your biggest issue is earlier than checkout."
- "But these shoppers already showed interest and still did not continue."
- "But checkout is where high-intent shoppers are falling away."
- "But a healthy funnel changes the question from fixing a leak to business adolescence, owner time, optimisation, and scale."

Good hook shape:

```text
When you got here, I bet you thought checkout was gonna be the problem. And if so, you're in good company. That's where everyone looks first. But your result isn't pointing at checkout. It's pointing earlier than that. According to the Shopify Golden Ratio, roughly 10% of sessions should become add-to-carts. But that's not happening here. So the question isn't, "why aren't they finishing?" It's, "why aren't they even starting?"
```

Bad hook shape:

```text
Your report is ready. In this video, I will explain your add-to-cart bottleneck and what to do next.
```

That is an opening, not a hook. It gives information, but it does not create tension or curiosity.

Another bad hook shape:

```text
Before you ran this report, I would not be surprised if you thought checkout was the problem. But your result is add-to-cart, which means your product page, imagery, price support, trust signals, and traffic match are probably the issue.
```

That creates dissonance and then immediately kills it by answering the question. Save the explanation for the diagnosis section.

Do not confuse a hook with a summary. The hook should create an open question. The diagnosis section answers it.

Setup videos are different. If the viewer is already mid-process and just needs instructions, do not force a sales hook. Orient them, reassure them, and get them through the steps.

## One Bottleneck, One Next Step

Each result video should stay focused on one bottleneck and one next step. Do not turn the video into a buffet of insights, unrelated offers, or "you might also" advice.

The page below the video can show supporting details. The video should frame the result, create urgency, and make the paid step feel obvious.

## Fix Path Rules

The fix path should make the viewer feel relieved because the problem has a shape. It should not become a long tactical audit.

For each bottleneck, find the one job that stage must do:

- add-to-cart: make the buyer feel they are in the right place, trust the offer, imagine owning the product, and see Add to Cart as the natural next step;
- reach-checkout: recognise that product desire is already there, then remove vendor risk: delivery fees, delivery timing, returns, refunds, total price clarity, and any visibility or layout issue that makes the checkout path less obvious;
- checkout completion: protect the final payment step after high intent is already there; for most Shopify stores, focus on the few checkout levers that matter most: guest checkout, trusted single-click payment methods, and an app-friction check. Treat abandoned checkout emails as recovery that can feed shoppers back into the same stuck point, not as the fix;
- healthy funnel: move from "find the leak" to business adolescence: momentum before full structure, with conversion as one lane inside the scaling business. This variant may not need standalone cost-of-inaction or fix-path sections if the diagnosis already lands on "conversion is now one important lane inside a growing business."

For healthy/no-major-bottleneck scripts, do not recap the other bottleneck videos as a list. The viewer does not need "if add-to-cart, then product page; if reach-checkout, then cart; if checkout, then payment." Start from the actual result state: this is good news, the store is broadly working, and the work now shifts into business adolescence, owner attention, trustworthy partners, optimisation, and scale.

For healthy scripts, avoid strategy-document phrasing such as "baseline", "constraint", and repeated "one lever / one reason / one number" beats in the spoken script. If separate cost-of-inaction or fix-path sections start feeling forced, remove them and move directly into the paid step: conversion is now one important lane inside a growing business, and John can own that lane while the merchant focuses on scale.

The add-to-cart reference pattern is:

```text
Within the first few seconds, they need to understand three things:

Am I in the right place?

Is this what I'm after?

Why should I buy this from you?
```

The first question is about continuity. There needs to be continuity between what the buyer clicked and where they ended up. Dissonance creates uncertainty, uncertainty removes trust, and once the customer loses trust, they leave.

The next questions are about ownership. The product page needs to put a picture in the buyer's head of already owning the product. Images, copy, proof, delivery details, price, and every other page element should increase comfort, build trust, and make the next buying action feel inevitable.

The reach-checkout reference pattern is:

```text
Because at this point, the customer has already said, "yes."

They've made it clear they want to own the product.

And this is where they start judging you, the vendor.
```

For reach-checkout, do not keep selling product desire. The product page has already moved the buyer toward ownership. The cart must now answer the vendor-trust question: "Am I going to get what I ordered, when I expect it, without hidden costs or hassle if something goes wrong?"

That is why risk reversal is the main fix-path idea. Delivery fees, delivery timing, returns, refunds, and total price clarity are not random cart checks; they are the evidence that the vendor can be trusted. The technical note comes after that: the checkout button must be clear, simple, obvious, and unambiguous.

The checkout-completion reference pattern is:

```text
At this stage, checkout issues generally fall into one of two buckets: technical failure or added friction.

Technical failure is the form not working, the button not pressing, or the payment option failing.

This is where Shopify is different.
```

For checkout completion, the product and cart have already done their jobs. Do not make the fix path about product desire, cart trust, or broad reassurance. Shopify has spent years making checkout secure, reliable, and hard to break, so the script should focus on the places merchants still get in the way: forced account creation, missing single-click payment options, mobile card-entry friction, and apps that add friction.

Single-click payments should be framed in two layers: they remove mobile friction, and they reduce the customer's perceived credit-card risk because sensitive card details stay inside a trusted payment system. Be careful not to claim fraud is impossible or that the merchant has no PCI obligations.

The paid step for checkout completion is not "this is all complicated." It is: these fixes are pretty simple, the store is probably starting to work, and now the merchant needs to keep conversion sharp while scaling into new markets, stock, 3PL, hiring, and team expansion.

## Length

Aim for:

- setup video: 2-4 minutes;
- bottleneck result videos: 4-6 minutes;
- healthy/no-major-bottleneck result videos: roughly 3 minutes if the diagnosis flows directly into the paid step;
- retargeting cutdowns: 15-30 seconds.

Result videos can be longer than a normal explainer because the viewer is warm, self-selected, and waiting for their result. The first minute still has to carry the reveal and value proposition.

## Offer And CTA Rules

The result page should sell one thing: a named, transparent paid diagnostic.

Default offer-language pattern:

- **Offer name:** `<Specific Diagnostic Name>`
- **Page headline:** Book your `<price>` `<Specific Diagnostic Name>`
- **Subhead:** We'll confirm the real bottleneck, prioritize the fastest fixes, and give you an action plan.
- **Microproof:** `<duration>`. Recording included. Prioritized recommendations. Optional ongoing support if relevant.
- **Button:** Book my `<price>` `<Specific Diagnostic Name>`

Do not call this a discovery call on the result page. "Discovery call" sounds sales-coded and does not name the deliverable.

Keep the spoken CTA, page headline, and button text as close to verbatim as possible. The viewer should hear and see the same action.

The paid next step should usually move through this sequence:

1. Acknowledge the work is not trivial.
2. Reassure the viewer that this is not expertise they are expected to already have.
3. Explain that someone on the team still needs that expertise.
4. Position John as that missing expertise.
5. Use relevant proof: major ecommerce brands, agencies, and examples that resonate with the target audience.
6. Invite them to book in a call or diagnostic.
7. State the concrete output: what to fix first, why it matters, and how to move the relevant metric.

Do not restart the report explanation in the paid-next-step section if the script has already established the expertise gap. Move forward into John's role and the booking action.

Avoid:

- broad agency language;
- promising a guaranteed revenue lift;
- hiding the price;
- asking the viewer to choose between multiple equal-weight offers;
- making the report sound worthless without the paid diagnostic;
- introducing the larger coaching offer as the main page CTA.

## Coaching Bridge

The result page sells the paid diagnostic. It can lightly seed ongoing support, but it should not sell the monthly coaching or mentoring program directly unless that is explicitly the lead magnet's primary conversion goal.

On the diagnostic call, the bridge can follow this pattern:

```text
Based on today's diagnostic, you've got two realistic paths. You can take this action plan and implement it yourself, or if you want ongoing help prioritizing and improving this month by month, I can stay involved through the ongoing program. You do not need to decide that on the result page. The purpose of today's diagnostic is to confirm whether ongoing support would actually be useful for you.
```

## Dynamic Result Language

These videos are usually pre-recorded, so do not pretend to know the viewer's exact numbers in the recording.

Use phrases like:

- "Your numbers below this video show..."
- "If this stage is the one flagged in your report..."
- "The exact dollar figure depends on your traffic and AOV, but the pattern is what matters..."
- "The report tells us where to look. The diagnostic is where we inspect the actual store."

Let the page handle exact metrics, revenue gap, and landing page breakdowns.

## Visual And Page Rules

Use a presenter-led diagnostic format:

- John's talking-head recording is the A-roll and should carry the authority, tone, and instruction;
- Remotion is the production and compositing layer for lower thirds, captions, callouts, diagrams, generic mockups, transitions, and CTA cards;
- full-screen Remotion graphics should be short cutaways when a concept is easier to understand visually;
- build supporting diagnostic visuals with reusable React components;
- use generic store/page/cart/checkout mockups rather than real merchant examples unless explicitly approved;
- use screen capture only where an exact platform process matters;
- show report state early, then use generated overlays and cutaways that explain the pattern;
- keep the visual language practical and "everyman", not polished agency case-study theatre.

Useful Remotion component families:

- presenter frame;
- lower thirds;
- key phrase captions;
- funnel stage rail;
- animated leak highlight;
- visitor dots moving through or dropping out of the funnel;
- metric cards and benchmark comparisons;
- business lifecycle and owner-focus maps for healthy/no-major-bottleneck results;
- conversion-lane and optimisation-partner visuals for scale-stage results;
- generic storefront, cart, and checkout mockups;
- cause-category checklist cards;
- promise handoff split screens that compare ad/email/search/social promise with the first screen of the destination page;
- trust meters or trust-drop moments for mismatch, friction, or surprise;
- ownership-builder mockups that show page elements combining to make the buyer imagine owning the product;
- text-only proof strips for brand/client names where logos are not approved;
- final diagnostic CTA card.

Remotion should make the argument easier to understand. It should not add a second script on top of John's script. If a visual note reads like a checklist, compress it into one visual idea.

For result scripts, keep Remotion notes tied to the current spoken mental model:

- add-to-cart visuals should show promise continuity, trust, imagined ownership, and Add to Cart becoming inevitable;
- reach-checkout visuals should show the cart bridge, band-aid fixes that miss the real issue, vendor judgement, risk reversal, and a clear checkout path;
- checkout-completion visuals should not automatically reuse reach-checkout risk reversal; use a final-payment model where Shopify checkout is deliberately constrained, so guest checkout, trusted single-click payments, app-friction checks, and the post-fix scale opportunity become the highest-leverage visuals.
- healthy/no-major-bottleneck visuals should stay calm and positive: healthy funnel state, good-result card, `The E-Myth` lifecycle, business adolescence, owner focus map, conversion lane, optimisation partner lane, proof strip, and CTA. Do not add red leak graphics, band-aid fix stacks, baseline/test-loop graphics, or a parallel growth-tactics audit.

Do not use Remotion to introduce causes John has not spoken about. Do not turn the visual plan into a parallel audit checklist. The strongest visual notes usually name one object, one transformation, and one takeaway.

## Journey Continuity

Result videos should feel like the natural continuation of the lead-generation ad and landing page. Use the same visual system, but slow it down and make it more diagnostic.

Keep these consistent where possible:

- presenter-led talking-head style;
- lower thirds and section labels;
- key phrase caption treatment;
- funnel rail and stage-card design;
- generic store/page/cart/checkout mockups;
- CTA card style and wording;
- colour, typography, spacing, and animation tempo.

The result video can be calmer and more detailed than the ad, but it should not feel like a different product experience.

Use screen share or platform capture where useful:

- face on screen as the main source of explanation;
- actual report visible early;
- one metric or stage highlighted;
- cursor-led explanation;
- short labels, not dense slides.

The video should sit inline and above the main report detail. Do not use autoplay. Use a thumbnail with John's face plus the result or report state, not a generic logo or deck preview.

The strongest CTA should appear:

- at the end of the video;
- directly below the video;
- again after the report detail where useful.

Keep the page sparse around the video:

- personalized headline;
- inline diagnostic video;
- one primary CTA;
- brief proof or reassurance;
- booking/payment flow.

Avoid full navigation, unrelated links, and secondary offers on the result page.

## Retargeting Assets

The on-page result video and retargeting clips should not be the same asset.

Create 15-30 second vertical cutdowns for Meta/Instagram retargeting. Each cutdown should focus on one result line only, assume sound off, use captions, and get the key message in within the first few seconds.

## Email Support

Results-ready and recovery emails should support the page rather than replace it.

When possible, use a video thumbnail that links back to the result page and restates the single diagnosis in the subject line or preview text.

## Tracking

Track the video funnel the same way the report tracks the store funnel:

- play rate;
- 25%, 50%, and 75% watch rate where the player supports it;
- CTA click rate;
- paid diagnostic booking rate;
- paid diagnostic purchase rate;
- show rate;
- conversion from paid diagnostic to coaching.

At minimum, keep the existing result-viewed and booking-click events intact.

## Tests To Prioritize

Start with tests that affect attention and clarity:

- opening line: loss-framed versus control-framed;
- CTA noun: Fix-It Diagnostic versus Store Bottleneck Diagnostic versus Discovery Call;
- price visible in video and page versus page only;
- proof by category similarity versus proof by business-size similarity;
- result-specific headline versus generic results headline.

## Script Template

Each script file should use this structure:

```markdown
# <Video Title>

## Metadata

- Lead magnet:
- Variant key:
- App location:
- Target length:
- Primary viewer state:
- Offer:
- CTA:
- App video config key:

## Purpose

## Reference Standard

Use `lead-magnets/shopify-bottleneck-analysis/videos/scripts/01-add-to-cart.md`, `lead-magnets/shopify-bottleneck-analysis/videos/scripts/02-reach-checkout.md`, and `lead-magnets/shopify-bottleneck-analysis/videos/scripts/03-checkout-completion.md` as the current quality bar for voice, stage psychology, Remotion notes, paid-step bridge, and close.

## Five Hook Options

1.
2.
3.
4.
5.

## Hook Discipline

- Belief:
- Reversal:
- Open question:
- What this hook deliberately does not answer yet:

## Selected Hook

## Diagnostic Arc

- Hook:
- Immediate reveal:
- Diagnosis:
- Cost of inaction:
- Fix path:
- Paid next step:
- Close:

## Retention Loop Notes

- Hook opens:
- Diagnosis answers:
- Cost section creates:
- Fix path resolves:
- Paid step converts by:

## Scriptwriting Notes

- Main belief/reversal:
- Customer behaviour behind the metric:
- Stage psychology:
- One mental model for the fix path:
- Obvious tactics that are only band-aid fixes:
- Paid-step bridge / expertise gap:
- Proof to use:
- CTA wording:

## Diagnosis Notes

## Likely Causes

## First Checks

## Remotion Visual Plan

- Production approach:
- Presenter/A-roll role:
- Core Remotion components:
- Suggested scene flow:
- Mental model to visualise:
- Screen capture needs:
- Continuity notes:
- Avoid:

Remotion should make the argument easier to understand. It should not add a second script on top of John's talking head. If a visual note becomes a long checklist, compress it into one visual idea: one object, one transformation, and one takeaway.

## Screen Beats

## On-Screen Callouts

## Full Script

## Retargeting Cutdown Lines

## Claims To Avoid
```

## Production Workflow

1. Create or update the packet brief.
2. Confirm variant keys against the code.
3. Confirm the offer name, price, duration, and CTA in the app.
4. Write five belief/reversal hooks for each result video, and a simple orienting opening for setup videos.
5. Pick the strongest hook per video.
6. Write the scripts using the diagnostic arc.
7. Create recording notes and screen beats.
8. Record and upload the videos.
9. Add video IDs to the route-local component config.
10. Verify every result state renders the correct video and CTA tracking.
11. Create 15-30 second retargeting cutdowns for each result state.

## Current Reference Implementation

Use each lead magnet packet for implementation-specific details such as:

- app route;
- video component;
- setup and result variant keys;
- video ID config keys;
- offer name, price, CTA, and booking path;
- follow-on coaching or mentoring bridge.
