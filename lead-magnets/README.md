# Lead Magnets

This folder owns strategy, production planning, and reusable frameworks for JohnDetlefs.com report-style lead magnets.

Use this area for lead magnet work that is bigger than one guide video and broader than one app component:

- report concepts and promises;
- diagnostic frameworks;
- result-video and sales-video structures;
- per-lead-magnet production packets;
- offer and conversion planning;
- recording, retargeting, and follow-up assets.

## Folder Shape

```text
lead-magnets/
  _frameworks/
    lead-magnet-ad-videos.md
    diagnostic-result-videos.md
  _templates/
    report-lead-magnet/
      status.md
      brief.md
      conversion-plan.md
      ads/
      videos/
  <lead-magnet-slug>/
    status.md
    brief.md
    conversion-plan.md
    ads/
      status.md
      brief.md
      hooks.md
      video-manifest.md
      scripts/
    videos/
      status.md
      brief.md
      hooks.md
      video-manifest.md
      scripts/
```

## Ownership

- `lead-magnets/_frameworks/` contains reusable systems that apply across multiple lead magnets.
- `lead-magnets/_templates/` contains reusable packet scaffolds for new lead magnets.
- `lead-magnets/<lead-magnet-slug>/` contains planning and assets for one specific lead magnet.
- `next/docs/` documents implementation architecture in the website app.
- `next/app/<lead-magnet-slug>/` contains production app code.
- `content-packets/` remains for guide-video and content-marketing packets.

Do not put reusable lead-magnet strategy inside a single lead magnet's folder. Specific packets can reference the framework, but they should only contain decisions, scripts, and assets for that lead magnet.

## Conversion Plans

Keep `conversion-plan.md` at the lead magnet root because it affects the whole journey: result page positioning, booking path, pricing, CTA language, follow-up emails, tracking, and any coaching bridge.

Video packets can reference the conversion plan, but should not own the offer strategy.

## Tone Frame

Lead magnets should be useful, direct, and positively focused. Do not sell fear. The report can name real costs, leaks, wasted effort, and consequences, but the emotional frame should be: the merchant made a brave choice by building an ecommerce business, their current situation is understandable, every problem is fixable, and the next step is clear.

This applies across lead magnet ads, landing pages, setup pages, result pages, videos, emails, and booking CTAs. The paid step should feel like John offering to become a useful partner on the journey, not like a scare tactic.

## Video Layers

Lead magnets have two different video jobs:

- `ads/`: acquisition videos that sell the lead magnet before signup.
- `videos/`: setup and result videos shown after signup, including diagnostic result videos that sell the paid next step.

Keep these separate. Ad videos create the click and lead capture. Result videos interpret the report and move qualified users toward the Shopify Fix-It Diagnostic.

## Visual Continuity

The whole lead-magnet journey should feel like one system:

1. Lead-generation ad.
2. Landing page.
3. Report setup page.
4. Result page.
5. Result diagnostic video.

Use the same Remotion visual language across acquisition and results: presenter-led talking head, lower thirds, key phrase captions, funnel rails, stage cards, generic store mockups, metric cards, and CTA cards. The user should not feel like they clicked an ad from one product and landed in a different experience.

For diagnostic result scripts, use `lead-magnets/shopify-bottleneck-analysis/videos/scripts/01-add-to-cart.md`, `lead-magnets/shopify-bottleneck-analysis/videos/scripts/02-reach-checkout.md`, and `lead-magnets/shopify-bottleneck-analysis/videos/scripts/03-checkout-completion.md` as the current quality references. The visuals should support the same style of argument: belief reversal, customer behaviour, cost of the wrong tactics, stage-specific fix-path psychology, a paid step that matches the result state, proof, and one booking action.

Remotion graphics should visualise the idea behind the words, not become a second checklist. Good reusable patterns include promise handoff splits, trust-loss moments, ownership builders, cart bridges, locked-checkout gates, trusted-payment panels, scale-opportunity maps, funnel-stage rails, text-only proof strips, and clear CTA cards.
