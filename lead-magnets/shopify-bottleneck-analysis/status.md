# Shopify Bottleneck Analysis Status

Lead magnet: Shopify Bottleneck Analysis
App route: `next/app/shopify-bottleneck-analysis`
Current stage: live lead magnet, result scripts completed, Meta ad-video structure ready for script rewrite
Last updated: 2026-05-25

## Assets

- Ad video packet: `lead-magnets/shopify-bottleneck-analysis/ads/`
- Video packet: `lead-magnets/shopify-bottleneck-analysis/videos/`
- Conversion plan: `lead-magnets/shopify-bottleneck-analysis/conversion-plan.md`
- App architecture doc: `next/docs/report-lead-magnets.md`
- Shared ad video framework: `lead-magnets/_frameworks/lead-magnet-ad-videos.md`
- Video implementation doc: `next/docs/report-lead-magnet-videos.md`
- Shared video framework: `lead-magnets/_frameworks/diagnostic-result-videos.md`

## Decisions

- This is the canonical first report-style lead magnet.
- The report results page already has result-state video slots.
- The reusable diagnostic-video framework lives in `lead-magnets/_frameworks/`, not in this lead magnet folder.
- The reusable ad-video framework also lives in `lead-magnets/_frameworks/`, with Bottleneck-specific ad scripts in `ads/`.
- This lead magnet owns the Bottleneck-specific diagnosis, conversion plan, scripts, hooks, video IDs, and offer-alignment decisions.
- The add-to-cart, reach-checkout, checkout-completion, and healthy/no-major-bottleneck result scripts are complete enough to move into the acquisition ad-video layer.
- The Meta ad-video layer uses a three-ad set: checkout myth / belief reversal, more traffic trap / wasted effort, and quick first read / fast useful result.
- Ad scripts should sell the free analysis before signup, stay aligned to the same funnel-stage promise, and not sell the $295 diagnostic directly.

## Open Questions

- Which video host will be used for the result and ad videos?
- What UTM naming convention should be used for Meta ads?

## Next Action

- Rewrite the three Meta ad scripts using the approved result-video voice and the updated 45-75 second ad structure.
