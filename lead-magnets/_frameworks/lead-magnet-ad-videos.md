# Lead Magnet Ad Videos

Use this framework for short paid-social or organic acquisition videos that sell a report-style lead magnet before signup.

These are not the same as result-page diagnostic videos. Ad videos sell the free report. Result videos interpret the report and sell the paid diagnostic.

## Where Things Live

Reusable ad strategy lives here:

- `lead-magnets/_frameworks/lead-magnet-ad-videos.md`

Per-lead-magnet ad planning and scripts live here:

- `lead-magnets/<lead-magnet-slug>/ads/`

Per-lead-magnet result and setup videos live separately:

- `lead-magnets/<lead-magnet-slug>/videos/`

Do not put reusable ad-video strategy inside one lead magnet folder.

## Job Of The Ad

The ad should make the right merchant think:

```text
I have been guessing what is wrong with my store. This will show me where to look first.
```

The ad does not need to explain the whole report. It needs to sell one click:

- run the free report;
- find the likely leak;
- stop guessing which part of the funnel to fix first.

Keep the ad positive and useful. Do not sell fear, shame, or doom. It is acceptable to say guessing wastes effort or that the wrong fix can cost money, but the emotional frame should be: the merchant is doing a brave, difficult thing, the uncertainty is understandable, and the free report gives them a clearer next move.

## Default Format

Default format: presenter-led lead-magnet ad with Remotion motion-graphic overlays.

- Talking head is the A-roll.
- Remotion provides lower thirds, key phrase captions, funnel diagrams, simple mockups, stage highlights, and CTA cards.
- Use direct-to-camera energy. The ad should feel like a useful operator insight, not a polished explainer.
- Aim most primary scripts at 45-75 seconds. Keep 120 seconds as the hard ceiling.
- Later cutdowns can be 15-30 seconds once the main angle works.
- Make the first 3 seconds work without context.
- Assume mobile-first, sound-on and sound-off versions.

## Default Three-Ad Set

Every report lead magnet should start with three acquisition videos. They should feel like three angles on the same promise, not three different products.

1. **Belief reversal ad**
   - Job: stop the scroll by turning over a common assumption.
   - Pattern: "You probably think X. But the report may show Y."
   - For Shopify Bottleneck Analysis: "Most Shopify owners look at checkout first, but the leak may start earlier."
2. **Wasted-effort ad**
   - Job: show why guessing creates wasted time, spend, or margin.
   - Pattern: "Before you spend more on X, find out where the leak actually starts."
   - For Shopify Bottleneck Analysis: "More traffic, discounts, or redesigns can all miss the actual weak stage."
3. **Fast useful-result ad**
   - Job: make the lead magnet feel low-friction and tangibly useful.
   - Pattern: "Give us the key inputs, get a useful first read, then decide where to look first."
   - For Shopify Bottleneck Analysis: "Use the core funnel numbers to see whether the likely issue is product page, cart, checkout, or no obvious major leak."

Once those three exist, create additional scripts only when the angle is genuinely different: retargeting nudge, seasonal push, category-specific version, founder-story proof, or objection handling.

## Ad Structure

Use this structure for most primary ads:

| Segment | Timing | Job |
| --- | ---: | --- |
| Hook | 0:00-0:03 | State a belief and turn it over. |
| Problem | 0:03-0:15 | Name the guessing problem in the viewer's language. |
| Lead magnet promise | 0:15-0:35 | Show what the free report helps them find. |
| Specificity | 0:35-0:55 | Name the inputs, outputs, stages, or result states so it feels tangible. |
| Reassurance | 0:55-1:05 | Make the process feel achievable and useful, not technical or intimidating. |
| CTA | 1:05-1:15 | Tell them to run the free analysis. |

Shorter variants can compress this into hook, promise, CTA. Do not stretch a short ad just to fill time.

## Hook Rules

The hook must create a reason to watch. It should not merely announce the report.

Good hook shapes:

```text
Most Shopify owners think checkout is the problem. But for a lot of stores, the leak starts before checkout ever gets a chance.
```

```text
If your store gets traffic but not enough orders, more traffic may just be sending more people into the same leak.
```

```text
Before you pay someone to redesign your store, find out which part of the funnel is actually leaking.
```

Bad hook shapes:

```text
I built a free Shopify Bottleneck Analysis.
```

```text
Click the link to get your free report.
```

Those are announcements, not hooks.

## Ad Angle Families

Create scripts from a few repeatable angle families:

- **Myth reversal:** checkout is not always the real problem.
- **Wasted effort:** more traffic, discounts, and redesigns can miss the actual leak.
- **Diagnosis before fixes:** find the stage before choosing the tactic.
- **Fast useful result:** a short process gives a practical starting point.
- **Operator relief:** stop guessing and get a clearer next move.
- **Retargeting nudge:** if they visited but did not start or finish, remind them what they will learn.

## What To Sell

Sell the lead magnet outcome:

- "Find the likely leak in your Shopify funnel."
- "See whether the issue is product page, cart, checkout, or no obvious major leak."
- "Get a more useful starting point before changing the store."

Do not lead with the paid diagnostic. The paid diagnostic can be lightly implied as the deeper next step after the report, but the ad CTA should stay focused on the free analysis.

## Alignment Rules

The ad creates the first promise in the lead-magnet journey. The landing page, setup flow, result page, and result videos must pay that promise off.

Before approving an ad script, check:

- the hook matches a belief the target merchant already has;
- the ad sells the same outcome the landing page can immediately repeat;
- the report can actually deliver the promised output;
- the wording says "likely leak", "weak stage", or "where to look first" rather than pretending to find the exact root cause;
- the CTA is to run the free lead magnet, not book the paid diagnostic;
- the visual language matches the landing page and result videos: same presenter-led style, funnel rail, stage cards, captions, and CTA treatment;
- the result videos will feel like the natural continuation of the ad, not a different offer.

## Remotion Overlay Pattern

Useful reusable components:

- `PresenterFrame`: talking head with side panel or picture-in-picture.
- `LowerThird`: name, topic, or lead magnet name.
- `KeyPhraseCaption`: short highlighted phrases for sound-off viewing.
- `FunnelStageRail`: sessions, add to carts, reached checkout, completed purchases.
- `LeakQuestionMark`: animated uncertainty over the funnel stage.
- `StageRevealCards`: product page, cart, checkout, healthy.
- `GenericStorefrontMock`: abstract storefront, product page, cart, or checkout visual.
- `PromiseHandoffSplit`: useful when the ad itself introduces the idea that the click and destination page must feel continuous.
- `TrustDropMeter`: simple way to visualise uncertainty reducing trust.
- `LeadMagnetCtaCard`: "Run the free Shopify Bottleneck Analysis".

## Journey Continuity

Lead-generation ads should use the same visual language as the landing page and result videos. The viewer should see a smooth handoff from ad to landing page to report result.

Keep these consistent where possible:

- presenter-led talking-head style;
- lower thirds and section labels;
- key phrase caption treatment;
- funnel rail and stage-card design;
- generic store/page/cart/checkout mockups;
- CTA card style and wording;
- colour, typography, spacing, and animation tempo.

The ad can be faster and more compressed than the result video, but it should not look like a different brand or a different product.

The acquisition ad should create the first promise in that journey. Be careful not to promise one thing in the ad and deliver a different-feeling landing page, because that same dissonance is one of the trust problems the result videos are teaching merchants to avoid.

## Claims To Avoid

- Do not promise the report finds the exact cause. It finds the likely stage.
- Do not guarantee a revenue lift.
- Do not imply John has reviewed the viewer's store before signup.
- Do not say every store has a checkout problem.
- Do not sell the paid diagnostic as the primary ad CTA.
- Do not use real merchant examples unless explicitly approved.

## Packet Shape

Each lead magnet should have:

```text
lead-magnets/<lead-magnet-slug>/ads/
  status.md
  brief.md
  hooks.md
  video-manifest.md
  scripts/
    _template.md
    01-belief-reversal.md
    02-wasted-effort.md
    03-fast-useful-result.md
```

Create more ad scripts only when the angle is meaningfully different.
