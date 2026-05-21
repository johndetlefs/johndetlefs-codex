# Shopify Bottleneck Analysis Status

Lead magnet: Shopify Bottleneck Analysis
App route: `next/app/shopify-bottleneck-analysis`
Current stage: live lead magnet, video sales layer in script production
Last updated: 2026-05-21

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
- The add-to-cart result video is the approved script reference for the remaining result videos and the reusable diagnostic-video framework.

## Open Questions

- Which video host will be used for the result videos?

## Next Action

- Draft the reach-checkout result video using the approved add-to-cart script as the voice and structure reference.
