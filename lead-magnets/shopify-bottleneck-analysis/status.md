# Shopify Bottleneck Analysis Status

Lead magnet: Shopify Bottleneck Analysis
App route: `next/app/shopify-bottleneck-analysis`
Current stage: live lead magnet, video sales layer in script production
Last updated: 2026-05-22

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
- The add-to-cart, reach-checkout, and checkout-completion result videos are the approved script references for the remaining result videos and the reusable diagnostic-video framework.
- The healthy/no-major-bottleneck result video has a rewritten first draft ready for review. It treats a healthy funnel as a good result, then uses the business adolescence idea: momentum before full structure, owner time, scaling demands, and giving optimisation a clear lane.

## Open Questions

- Which video host will be used for the result videos?

## Next Action

- Review the healthy/no-major-bottleneck first script draft with John.
