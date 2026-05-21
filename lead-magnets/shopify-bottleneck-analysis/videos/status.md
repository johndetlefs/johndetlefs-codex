# Shopify Bottleneck Analysis Videos Status

Packet: `lead-magnets/shopify-bottleneck-analysis/videos`
Lead magnet: `next/app/shopify-bottleneck-analysis`
Reusable framework: `lead-magnets/_frameworks/diagnostic-result-videos.md`
App implementation doc: `next/docs/report-lead-magnet-videos.md`
Current stage: script drafting
Last updated: 2026-05-21

## Checklist

- [x] App variants inspected
- [x] Packet structure created
- [x] Reusable sales video system documented
- [x] Diagnostic-video structure imported from desktop strategy note
- [x] Hook options drafted
- [x] Hook tests approved
- [ ] Scripts ready
- [ ] Recording checklist ready
- [ ] Edit brief ready
- [ ] Retargeting cutdowns planned
- [ ] Videos recorded
- [ ] Videos uploaded
- [ ] Offer/CTA app copy aligned
- [ ] App video config updated
- [ ] Result states verified in browser

## Decisions

- Source strategy note: `/Users/johndetlefs/Desktop/sales-video-structure.md`.
- These videos are diagnostic videos, not generic founder-heavy VSLs.
- The setup video can be more instructional; the result videos should follow immediate reveal, diagnosis, cost of inaction, fix path, paid next step, close.
- Result videos should be roughly 4-6 minutes.
- Result videos should give real diagnostic value before the booking pitch.
- Each result video should focus on one bottleneck and one next step.
- Exact customer numbers should stay on the page. The pre-recorded videos should reference the pattern and tell the viewer how to interpret the report.
- Scripts belong in this packet, not in the Next.js app source.
- Offer strategy belongs in `lead-magnets/shopify-bottleneck-analysis/conversion-plan.md`.
- App wiring remains in `next/app/shopify-bottleneck-analysis/_components/BottleneckVideoSection.tsx`.
- Current result variant keys are `addToCart`, `reachCheckout`, `checkoutCompletion`, and `healthy`.
- The setup variant key is `reportSetup`.
- Target result-page offer language is "Book your $295 Shopify Fix-It Diagnostic".
- Do not call the paid step a discovery call on the result page.
- The $695/month coaching program should be seeded only as optional ongoing support after the paid diagnostic, not sold as the primary result-page CTA.
- Current public CTA in the app is still the Shopify Fix-It Call booking flow at `/booking`; this needs implementation alignment before publishing the videos.
- Approved hook selections: setup option 5, add-to-cart option 1, reach-checkout option 2, checkout-completion option 5, healthy option 2.
- Videos should be presenter-led talking-head diagnostics composited and enhanced in Remotion. Use generic funnel, store, cart, checkout, checklist, lower-third, caption, and CTA components for support. Use screen capture mainly for the setup video or exact Shopify/report-page process moments.
- Add-to-cart video brief approved by John and moved to full script draft on 2026-05-21.

## Open Questions

- Will these videos be hosted on YouTube, Wistia, or another player?
- Should the product name be exactly "Shopify Fix-It Diagnostic" or "Store Bottleneck Diagnostic"?

## Next Action

- Review the add-to-cart full script, then draft the reach-checkout script.
