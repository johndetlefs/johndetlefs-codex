# Product Ads Safe-Zone QA

Use this checklist before saving or exporting a product ad.

## Element Priority

- Decorative source-format chrome, such as fake phone navigation, app controls, browser bars, or UI framing, must sit inside the 5% edge guard.
- Important selling copy, checklist items, claims, price/offer copy, and CTA text should sit inside the 9:16 Reels safe rectangle where practical.
- Product-identifying imagery should sit inside the 9:16 Reels safe rectangle where practical. If the full product cannot fit without harming the source mechanism, keep the recognisable product face, label, or hero cue inside the safe rectangle and document the exception.

## 9:16 Checks

- Edge guard: 5% top, bottom, and sides.
- Stories safe area: 14% top, 20% bottom, 6% sides.
- Reels safe area: 14% top, 35% bottom, 6% sides.
- Decorative fake-device chrome may sit above the Stories/Reels safe rectangle, but not outside the edge guard.
- Important copy should not be under the top 14% or bottom 35% Reels UI areas.

## Flow

1. Classify each layer as decorative chrome, important copy, product-identifying image, or background.
2. Turn on `Edge guard` and confirm decorative chrome stays inside it.
3. Turn on `Reels safe` and confirm important copy and product-identifying image areas are inside it where practical.
4. Render the all-format preview and check that safe-zone changes did not break 4:5, 1:1, or 1.91:1.
5. Record any deliberate exception in the ad's adaptation teardown or task validation notes.
