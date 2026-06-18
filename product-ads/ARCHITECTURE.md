# Product Ads Architecture

The product ad system is split by ownership so templates can be reused across brands without copying editor code or shared assets.

## Folder Ownership

- `core/`: shared editor UI, persistence server, and reusable tooling.
- `templates/`: source-ad templates, forensic teardowns, shared structural assets such as arrows, and template-level asset manifests.
- `clients/`: brand, product, product-page analysis, product images, client-specific icons, editor states, and exports.
- `templates/legacy-reference-asset-requirements.md`: preserved first-pass notes for the wider R02-R11 template set until those templates are migrated into individual folders.

## Current Template

`templates/r01-feature-benefit-product-hero/` contains the reusable R01 system:

- `template.json`: editor-facing template metadata.
- `forensic-teardown.md`: source-ad teardown and layout rules.
- `asset-requirements.md`: reusable R01 asset requirements.
- `asset-groups.json`: shared arrow library for the editor.
- `assets/`: shared generated arrows and other source-format assets.
- `reference/`: source reference image and URL.

## Current Clients

Get Rid Of Dad Bod:

- `clients/get-rid-of-dad-bod/brand.json`
- `clients/get-rid-of-dad-bod/products/chocolate-whey/product.json`
- `clients/get-rid-of-dad-bod/products/chocolate-whey/ads/r01-feature-benefit-product-hero/editor-state.json`

Alessa Vino:

- `clients/alessa-vino/brand.json`
- `clients/alessa-vino/products/visner-di-pergola-2024/product.json`
- `clients/alessa-vino/products/visner-di-pergola-2024/ads/r01-feature-benefit-product-hero/editor-state.json`

## Editor Runtime

Run one shared server. The startup arguments provide the default brand/product/template, and URL query parameters can select any other saved ad without restarting the server:

```bash
python3 product-ads/core/editor/editor-server.py \
  --client get-rid-of-dad-bod \
  --product chocolate-whey \
  --template r01-feature-benefit-product-hero \
  --port 8765
```

Open:

```text
http://127.0.0.1:8765/core/editor/meta-image-ad-editor.html
http://127.0.0.1:8765/meta-image-ad-editor.html?client=alessa-vino&product=visner-di-pergola-2024&template=r01-feature-benefit-product-hero
```

The editor calls `/api/meta-image-ad-editor/config` to load the selected product's title, background, reference image, export prefix, and merged asset groups. Saves go to the selected product's `ads/<template>/editor-state.json`, or the selected angle path when an `angle` query parameter is present.

The shared admin screen is:

```text
http://127.0.0.1:8765/meta-image-ad-admin.html
```

It calls `/api/meta-image-ad-editor/inventory`, scans `clients/` and `templates/`, then lists clients, products, templates, saved ads, angle variants, editor links, preview images, and related documentation. Use it as the account-level way to answer "show me every ad for this client/product/template" before opening a specific creative in the editor.

Backgrounds are part of the saved editor project. Product configs can provide:

- `background`: the default gradient object for new or legacy editor states.
- `backgroundPresets`: suggested gradient starting points shown in the editor.
- `brandColors` in `clients/<client>/brand.json`: reusable brand palette swatches shown beside the custom gradient colour stops.

Clicking a suggested background copies it into the project's editable custom background. The custom controls then save colour stops, gradient type, angle, and focal position with the rest of the editor state, so exports and previews use the same gradient as the canvas.

For a specific audience or offer angle, pass `--angle <angle-slug>`. The state path becomes:

```text
clients/<client>/products/<product>/ads/<template>/angles/<angle>/editor-state.json
```

Angle-level `asset-groups.json` files are merged after template and base-ad asset groups, so an angle can add or override icons without duplicating the template library.

Icon assets are filtered in the editor by `assetSet`. Each callout icon element should declare the specific set it belongs to, such as `sour-cherry`, `wildflowers`, `marche-ritual`, or `chocolate-pairing`. That keeps the inspector focused on valid variants for the selected callout instead of exposing every client or template icon.

Callout copy, icon metaphors, GPT Image 2.0 prompts, regeneration decisions, and icon sizing QA should follow:

- `CALLOUT_AND_ICON_PROCESS.md`

Safe-zone QA for all templates should follow:

- `SAFE_ZONE_QA.md`

Template-specific common elements, such as R01 arrows or R02 fake phone chrome, belong under the relevant `templates/<template-slug>/` folder and should be referenced by the template documentation.

## Preview Model

Preview should be layered the same way the files are layered:

- Current ad preview: inside the editor, the grid button renders the current ad across all Meta ratios. This is for layout QA before export.
- Admin inventory: `/meta-image-ad-admin.html` shows every client, product, template, saved ad, and angle variant that exists on disk.
- Product preview: filter the admin inventory by product to show every template and angle for one product.
- Client preview: filter the admin inventory by client to group products, templates, and angles for account-level review.
- Template preview: use the admin template tab to show reusable template references and source-template documentation.

Do not make one flat gallery of every image once angles exist. It will become hard to answer simple questions like "show me Alessa Vino dessert-host ads" or "show me every R01 for this product." Preview URLs should always be filterable by `client`, `product`, `template`, and optional `angle`.

## Asset Rules

- Shared source-format assets live in `templates/`.
- Brand/product-specific assets live in `clients/`.
- Client product images must be no-background production layers unless a specific template calls for a generated scene or hand-held hero shot.
- Client-specific generated icons should be stored with the product, then exposed through that ad's `asset-groups.json`.
- Production icon libraries should be generated as cohesive GPT Image 2.0 sheets, then cut into transparent PNGs and documented beside the final assets. Avoid one-off hand-coded or mixed-source icons for client callouts because inconsistent stroke, scale, and metaphor quality make the ad feel cheap.
- Product-specific callout icons must pass semantic QA before visual QA: the visual metaphor must support the callout's intended product truth, not merely contain a noun from the label.
- Do not copy the shared editor, server, arrows, or common icon library into client folders.
