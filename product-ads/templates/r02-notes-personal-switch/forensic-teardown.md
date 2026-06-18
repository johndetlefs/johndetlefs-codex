# R02 - Notes / Personal Switch Forensic Teardown

Reference image: `reference/original.webp`

## Source Mechanism

R02 borrows the visual language of a personal notes app. The ad works because it feels like a saved decision note rather than a polished brand claim. The viewer reads a first-person reason, then a short checklist that makes the product choice feel simple and already considered.

## Emotional Job

- Curiosity: the viewer wants to know why someone is choosing this product.
- Borrowed confidence: the checklist suggests the decision has already been worked through.
- Ease: the notes-app interface makes the choice feel lightweight.
- Practicality: each bullet should be short enough to scan in one pass.

## Layout Rules

- Keep the fake phone chrome decorative and secondary.
- Fake phone chrome is a reusable R02 common element. It must stay inside the 5% edge guard, but it does not need to sit inside the stricter Stories/Reels safe rectangle.
- Start the headline below the phone chrome with enough whitespace to feel like a real note.
- Use one large first-person headline, then four short checklist items.
- Keep key text inside a 6% side guard for 9:16.
- Keep headline, checklist copy, and product-identifying image areas inside the 9:16 Reels safe rectangle where practical.
- Do not place CTA or discount copy in the bottom 35% of 9:16.
- Product sits below the checklist as the visual answer, not inside a product card.

## Copy Rules

- Headline uses first-person momentum: `Why I'm...`
- Bullets must be plain, short, and decision-supporting.
- Avoid feature dumps, exaggerated claims, or fake testimonial language.
- For alcohol products, keep the frame culinary and product-specific. Do not imply mood, health, confidence, romance, status, performance, or heavier consumption.

## Reusable Assets

The notes-app chrome is a reusable template system. The back label is a native text layer, and the top action controls are a shared transparent icon asset under `assets/icons/` so product-specific ads do not rebuild them with text glyphs.

Reusable notes chrome lives in `common-elements.json` and should be copied into every R02 editor state before product-specific copy and layout tuning.
