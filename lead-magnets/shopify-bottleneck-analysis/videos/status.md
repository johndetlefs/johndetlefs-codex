# Shopify Bottleneck Analysis Videos Status

Packet: `lead-magnets/shopify-bottleneck-analysis/videos`
Lead magnet: `next/app/shopify-bottleneck-analysis`
Reusable framework: `lead-magnets/_frameworks/diagnostic-result-videos.md`
App implementation doc: `next/docs/report-lead-magnet-videos.md`
Current stage: add-to-cart, reach-checkout, and checkout-completion scripts approved; healthy rewritten first draft ready
Last updated: 2026-05-22

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
- Approved hook selections: setup option 5, add-to-cart option 1, reach-checkout option 2, checkout-completion option 5. Healthy has been reset to option 1 for the rewritten first draft and needs review.
- Videos should be presenter-led talking-head diagnostics composited and enhanced in Remotion. Use generic funnel, store, cart, checkout, lower-third, caption, mental-model, proof-strip, and CTA components for support. Use screen capture mainly for the setup video or exact Shopify/report-page process moments.
- Add-to-cart video brief approved by John and moved to full script draft on 2026-05-21.
- Add-to-cart full script approved by John as the first reference standard on 2026-05-21. Future result scripts should follow its voice, pacing, fix-path mental model, paid-step bridge, close, and Remotion-note discipline.
- Reach-checkout full script approved by John on 2026-05-22. Future result scripts should also follow its stage-psychology discipline: product desire may already be solved, so the fix path must identify the new buyer question instead of reusing a generic checklist.
- Current approved references are `scripts/01-add-to-cart.md`, `scripts/02-reach-checkout.md`, and `scripts/03-checkout-completion.md`.
- Checkout-completion script approved by John on 2026-05-22. Future result scripts should follow its lesson that the paid next step must match the result state: if the simple fix puts the business into optimisation and scale mode, sell conversion oversight and the next growth lever rather than inflating the complexity of settings changes.
- Healthy/no-major-bottleneck script draft rewritten on 2026-05-22. It starts from the good result, then moves into business adolescence, owner time, scaling demands, and giving optimisation a clear lane.
- Drafting guardrail added on 2026-05-22: do not turn planning notes into spoken inventory. Avoid repeated "if X..." or "you could..." ladders; compress likely causes, first checks, and growth levers into one spoken mental model.

## Open Questions

- Will these videos be hosted on YouTube, Wistia, or another player?
- Should the product name be exactly "Shopify Fix-It Diagnostic" or "Store Bottleneck Diagnostic"?

## Next Action

- Review the healthy/no-major-bottleneck first script draft with John.
