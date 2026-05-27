# Product Ads Architecture

The product ad system is split by ownership so templates can be reused across brands without copying editor code or shared assets.

## Folder Ownership

- `core/`: shared editor UI, persistence server, and reusable tooling.
- `templates/`: source-ad templates, forensic teardowns, shared arrows/icons, and template-level asset manifests.
- `clients/`: brand, product, product-page analysis, product images, client-specific icons, editor states, and exports.
- `templates/legacy-reference-asset-requirements.md`: preserved first-pass notes for the wider R02-R11 template set until those templates are migrated into individual folders.

## Current Template

`templates/r01-feature-benefit-product-hero/` contains the reusable R01 system:

- `template.json`: editor-facing template metadata.
- `forensic-teardown.md`: source-ad teardown and layout rules.
- `asset-requirements.md`: reusable R01 asset requirements.
- `asset-groups.json`: shared arrow/icon library for the editor.
- `assets/`: shared generated arrows, icons, and icon sheets.
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

Run one shared server and select the brand/product/template by arguments:

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
```

The editor calls `/api/meta-image-ad-editor/config` to load the selected product's title, background, reference image, export prefix, and merged asset groups. Saves go to the selected product's `ads/<template>/editor-state.json`.

For a specific audience or offer angle, pass `--angle <angle-slug>`. The state path becomes:

```text
clients/<client>/products/<product>/ads/<template>/angles/<angle>/editor-state.json
```

Angle-level `asset-groups.json` files are merged after template and base-ad asset groups, so an angle can add or override icons without duplicating the template library.

## Preview Model

Preview should be layered the same way the files are layered:

- Current ad preview: inside the editor, the grid button renders the current ad across all Meta ratios. This is for layout QA before export.
- Product preview: a future product dashboard should show every template and angle for one product.
- Client preview: a future client dashboard should group products, templates, and angles for account-level review.
- Template preview: a future source-template gallery should show reusable template references and example applications across clients.

Do not make one flat gallery of every image once angles exist. It will become hard to answer simple questions like "show me Alessa Vino dessert-host ads" or "show me every R01 for this product." Preview URLs should always be filterable by `client`, `product`, `template`, and optional `angle`.

## Asset Rules

- Shared source-format assets live in `templates/`.
- Brand/product-specific assets live in `clients/`.
- Client product images must be no-background production layers unless a specific template calls for a generated scene or hand-held hero shot.
- Client-specific generated icons should be stored with the product, then exposed through that ad's `asset-groups.json`.
- Do not copy the shared editor, server, arrows, or common icon library into client folders.
