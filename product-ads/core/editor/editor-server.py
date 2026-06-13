#!/usr/bin/env python3
"""Serve the shared product ad editor and persist a selected ad project."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any
from urllib.parse import parse_qs, urlencode, urlparse


PRODUCT_ADS_ROOT = Path(__file__).resolve().parents[2]
API_PROJECT_PATH = "/api/meta-image-ad-editor/project"
API_CONFIG_PATH = "/api/meta-image-ad-editor/config"
API_INVENTORY_PATH = "/api/meta-image-ad-editor/inventory"
EDITOR_PATH = "/core/editor/meta-image-ad-editor.html"
LEGACY_EDITOR_PATH = "/meta-image-ad-editor.html"
ADMIN_PATH = "/core/editor/meta-image-ad-admin.html"
LEGACY_ADMIN_PATH = "/meta-image-ad-admin.html"
MAX_BODY_BYTES = 12 * 1024 * 1024
SAFE_SLUG_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]*$")


def load_json(path: Path, default: Any) -> Any:
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def safe_slug(value: Any, label: str, required: bool = True) -> str | None:
    if value is None or value == "":
        if required:
            raise ValueError(f"Missing {label}")
        return None
    value = str(value)
    if not SAFE_SLUG_RE.fullmatch(value):
        raise ValueError(f"Invalid {label}: {value}")
    return value


def merge_asset_groups(*groups: dict[str, Any]) -> dict[str, Any]:
    merged: dict[str, Any] = {}
    for group in groups:
        for group_name, assets in group.items():
            if not isinstance(assets, dict):
                continue
            merged.setdefault(group_name, {})
            merged[group_name].update(assets)
    return merged


def background_from_stops(stops: Any) -> dict[str, Any]:
    if not isinstance(stops, list) or not stops:
        stops = ["#2079b8", "#184c94", "#123861"]
    return {
        "type": "linear",
        "angle": 180,
        "positionX": 50,
        "positionY": 50,
        "stops": stops,
    }


def build_context(args: argparse.Namespace) -> dict[str, Any]:
    client_slug = safe_slug(args.client, "client")
    product_slug = safe_slug(args.product, "product")
    template_slug = safe_slug(args.template, "template")
    angle_slug = safe_slug(args.angle, "angle", required=False)

    template_dir = PRODUCT_ADS_ROOT / "templates" / template_slug
    client_dir = PRODUCT_ADS_ROOT / "clients" / client_slug
    product_dir = client_dir / "products" / product_slug
    base_ad_dir = product_dir / "ads" / template_slug
    ad_dir = base_ad_dir / "angles" / angle_slug if angle_slug else base_ad_dir
    state_file = ad_dir / "editor-state.json"

    if not template_dir.is_dir():
        raise FileNotFoundError(f"Missing template: {template_slug}")
    if not client_dir.is_dir():
        raise FileNotFoundError(f"Missing client: {client_slug}")
    if not product_dir.is_dir():
        raise FileNotFoundError(f"Missing product: {product_slug}")

    template = load_json(template_dir / "template.json", {})
    brand = load_json(client_dir / "brand.json", {})
    product = load_json(product_dir / "product.json", {})
    template_assets = load_json(template_dir / "asset-groups.json", {})
    base_ad_assets = load_json(base_ad_dir / "asset-groups.json", {})
    ad_assets = load_json(ad_dir / "asset-groups.json", {})
    background_stops = product.get("backgroundStops") or template.get("defaultBackgroundStops") or ["#2079b8", "#184c94", "#123861"]
    background = product.get("background") or template.get("defaultBackground") or background_from_stops(background_stops)

    storage_key = f"{client_slug}:{product_slug}:{template_slug}"
    if angle_slug:
        storage_key = f"{storage_key}:{angle_slug}"
    config = {
        "client": client_slug,
        "product": product_slug,
        "template": template_slug,
        "angle": angle_slug,
        "storageKey": storage_key,
        "title": product.get("editorTitle") or f"{brand.get('name', client_slug)} - Meta Ad Editor",
        "subtitle": product.get("editorSubtitle") or "Edit the master creative, tune each ratio, then export all finished ad formats.",
        "referenceImage": template.get("referenceImage", ""),
        "referenceNote": template.get("referenceNote", ""),
        "exportPrefix": product.get("exportPrefix") or f"{client_slug}-{product_slug}-{template_slug}",
        "backgroundStops": background_stops,
        "background": background,
        "backgroundPresets": product.get("backgroundPresets") or template.get("backgroundPresets") or [],
        "brandColors": product.get("brandColors") or brand.get("brandColors") or [],
        "generatedAssetGroups": merge_asset_groups(template_assets, base_ad_assets, ad_assets),
        "paths": {
            "stateFile": str(state_file.relative_to(PRODUCT_ADS_ROOT)),
            "templateDir": str(template_dir.relative_to(PRODUCT_ADS_ROOT)),
            "clientDir": str(client_dir.relative_to(PRODUCT_ADS_ROOT)),
            "productDir": str(product_dir.relative_to(PRODUCT_ADS_ROOT)),
            "baseAdDir": str(base_ad_dir.relative_to(PRODUCT_ADS_ROOT)),
            "adDir": str(ad_dir.relative_to(PRODUCT_ADS_ROOT)),
        },
    }
    if product.get("galleryUrl"):
        config["galleryUrl"] = product["galleryUrl"]

    return {
        "template_dir": template_dir,
        "client_dir": client_dir,
        "product_dir": product_dir,
        "ad_dir": ad_dir,
        "state_file": state_file,
        "config": config,
    }


def relative_url(path: Path) -> str:
    return f"/{path.relative_to(PRODUCT_ADS_ROOT).as_posix()}"


def read_saved_at(state_file: Path) -> str | None:
    if not state_file.exists():
        return None
    payload = load_json(state_file, {})
    if isinstance(payload, dict) and isinstance(payload.get("savedAt"), str):
        return payload["savedAt"]
    return dt.datetime.fromtimestamp(state_file.stat().st_mtime, dt.timezone.utc).isoformat()


def find_preview_image(ad_dir: Path, product: dict[str, Any], template: dict[str, Any]) -> str:
    for filename in ("exports/9x16.png", "exports/4x5.png", "exports/1x1.png", "exports/landscape.png"):
        candidate = ad_dir / filename
        if candidate.exists():
            return relative_url(candidate)
    for key in ("primaryProductImage", "heroImage", "productImage", "image", "transparentImage"):
        value = product.get(key)
        if isinstance(value, str) and value:
            return value
    reference = template.get("referenceImage")
    return reference if isinstance(reference, str) else ""


def editor_url(client_slug: str, product_slug: str, template_slug: str, angle_slug: str | None = None) -> str:
    params = {
        "client": client_slug,
        "product": product_slug,
        "template": template_slug,
    }
    if angle_slug:
        params["angle"] = angle_slug
    return f"{LEGACY_EDITOR_PATH}?{urlencode(params)}"


def build_ad_record(
    client_slug: str,
    brand: dict[str, Any],
    product_slug: str,
    product: dict[str, Any],
    template_slug: str,
    template: dict[str, Any],
    ad_dir: Path,
    angle_slug: str | None = None,
) -> dict[str, Any]:
    state_file = ad_dir / "editor-state.json"
    docs = []
    for filename in ("adaptation-teardown.md", "callout-strategy.md", "asset-requirements.md", "template-pack.md"):
        doc_path = ad_dir / filename
        if doc_path.exists():
            docs.append({"label": filename.replace(".md", "").replace("-", " ").title(), "url": relative_url(doc_path)})

    return {
        "id": ":".join(filter(None, [client_slug, product_slug, template_slug, angle_slug])),
        "client": client_slug,
        "clientName": brand.get("name") or client_slug,
        "product": product_slug,
        "productName": product.get("name") or product.get("title") or product_slug,
        "template": template_slug,
        "templateName": template.get("name") or template_slug,
        "angle": angle_slug,
        "angleName": angle_slug.replace("-", " ").title() if angle_slug else "Base",
        "status": "Saved project" if state_file.exists() else "Needs setup",
        "savedAt": read_saved_at(state_file),
        "editorUrl": editor_url(client_slug, product_slug, template_slug, angle_slug),
        "previewImage": find_preview_image(ad_dir, product, template),
        "stateFile": relative_url(state_file) if state_file.exists() else None,
        "docs": docs,
    }


def build_inventory() -> dict[str, Any]:
    templates: list[dict[str, Any]] = []
    template_lookup: dict[str, dict[str, Any]] = {}
    templates_dir = PRODUCT_ADS_ROOT / "templates"
    for template_dir in sorted(path for path in templates_dir.iterdir() if path.is_dir()):
        template = load_json(template_dir / "template.json", {})
        if not template:
            continue
        template_slug = template_dir.name
        template_lookup[template_slug] = template
        templates.append(
            {
                "id": template_slug,
                "name": template.get("name") or template_slug,
                "referenceImage": template.get("referenceImage", ""),
                "referenceNote": template.get("referenceNote", ""),
                "forensicTeardownUrl": relative_url(template_dir / "forensic-teardown.md")
                if (template_dir / "forensic-teardown.md").exists()
                else None,
                "assetRequirementsUrl": relative_url(template_dir / "asset-requirements.md")
                if (template_dir / "asset-requirements.md").exists()
                else None,
            }
        )

    clients: list[dict[str, Any]] = []
    products: list[dict[str, Any]] = []
    ads: list[dict[str, Any]] = []
    clients_dir = PRODUCT_ADS_ROOT / "clients"
    if clients_dir.exists():
        for client_dir in sorted(path for path in clients_dir.iterdir() if path.is_dir()):
            brand = load_json(client_dir / "brand.json", {})
            if not brand:
                continue
            client_slug = client_dir.name
            client_ads = 0
            product_root = client_dir / "products"
            if product_root.exists():
                for product_dir in sorted(path for path in product_root.iterdir() if path.is_dir()):
                    product = load_json(product_dir / "product.json", {})
                    if not product:
                        continue
                    product_slug = product_dir.name
                    product_ads = 0
                    ads_root = product_dir / "ads"
                    if ads_root.exists():
                        for ad_dir in sorted(path for path in ads_root.iterdir() if path.is_dir()):
                            template_slug = ad_dir.name
                            template = template_lookup.get(template_slug, {})
                            ads.append(build_ad_record(client_slug, brand, product_slug, product, template_slug, template, ad_dir))
                            product_ads += 1
                            angles_root = ad_dir / "angles"
                            if angles_root.exists():
                                for angle_dir in sorted(path for path in angles_root.iterdir() if path.is_dir()):
                                    ads.append(
                                        build_ad_record(
                                            client_slug,
                                            brand,
                                            product_slug,
                                            product,
                                            template_slug,
                                            template,
                                            angle_dir,
                                            angle_dir.name,
                                        )
                                    )
                                    product_ads += 1
                    client_ads += product_ads
                    products.append(
                        {
                            "id": product_slug,
                            "client": client_slug,
                            "name": product.get("name") or product.get("title") or product_slug,
                            "sourceUrl": product.get("sourceUrl") or product.get("productUrl") or "",
                            "adCount": product_ads,
                        }
                    )
            clients.append(
                {
                    "id": client_slug,
                    "name": brand.get("name") or client_slug,
                    "adCount": client_ads,
                    "brandColors": brand.get("brandColors") or [],
                }
            )

    return {
        "generatedAt": dt.datetime.now(dt.timezone.utc).isoformat(),
        "counts": {
            "clients": len(clients),
            "products": len(products),
            "templates": len(templates),
            "ads": len(ads),
        },
        "clients": clients,
        "products": products,
        "templates": templates,
        "ads": ads,
    }


class EditorRequestHandler(SimpleHTTPRequestHandler):
    server_version = "ProductAdsEditor/2.0"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(PRODUCT_ADS_ROOT), **kwargs)

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def do_OPTIONS(self):
        if self._is_project_api() or self._is_config_api() or self._is_inventory_api():
            self.send_response(HTTPStatus.NO_CONTENT)
            self.send_header("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            return
        super().do_OPTIONS()

    def do_GET(self):
        if self._is_config_api():
            context = self._request_context()
            if not context:
                return
            self._send_json(context["config"])
            return

        if self._is_inventory_api():
            self._send_json(build_inventory())
            return

        if not self._is_project_api():
            path = urlparse(self.path).path
            if path == LEGACY_EDITOR_PATH:
                self.path = EDITOR_PATH
            elif path == LEGACY_ADMIN_PATH:
                self.path = ADMIN_PATH
            super().do_GET()
            return

        context = self._request_context()
        if not context:
            return
        state_file = context["state_file"]
        if not state_file.exists():
            self._send_json({"ok": False, "error": "No saved editor project file"}, HTTPStatus.NOT_FOUND)
            return

        try:
            payload = json.loads(state_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            self._send_json({"ok": False, "error": "Saved editor project file is invalid JSON"}, HTTPStatus.INTERNAL_SERVER_ERROR)
            return

        self._send_json(payload)

    def do_POST(self):
        self._write_project()

    def do_PUT(self):
        self._write_project()

    def _is_project_api(self) -> bool:
        return urlparse(self.path).path == API_PROJECT_PATH

    def _is_config_api(self) -> bool:
        return urlparse(self.path).path == API_CONFIG_PATH

    def _is_inventory_api(self) -> bool:
        return urlparse(self.path).path == API_INVENTORY_PATH

    def _request_context(self) -> dict[str, Any] | None:
        query = parse_qs(urlparse(self.path).query)
        default_args = self.server.default_args
        args = argparse.Namespace(
            client=query.get("client", [default_args.client])[0],
            product=query.get("product", [default_args.product])[0],
            template=query.get("template", [default_args.template])[0],
            angle=query.get("angle", [default_args.angle])[0],
        )
        try:
            return build_context(args)
        except ValueError as error:
            self._send_json({"ok": False, "error": str(error)}, HTTPStatus.BAD_REQUEST)
        except FileNotFoundError as error:
            self._send_json({"ok": False, "error": str(error)}, HTTPStatus.NOT_FOUND)
        return None

    def _write_project(self):
        if not self._is_project_api():
            self.send_error(HTTPStatus.NOT_FOUND)
            return

        context = self._request_context()
        if not context:
            return

        content_length = int(self.headers.get("Content-Length", "0"))
        if content_length <= 0 or content_length > MAX_BODY_BYTES:
            self._send_json({"ok": False, "error": "Invalid request body size"}, HTTPStatus.BAD_REQUEST)
            return

        try:
            raw_body = self.rfile.read(content_length)
            payload = json.loads(raw_body.decode("utf-8"))
        except (UnicodeDecodeError, json.JSONDecodeError):
            self._send_json({"ok": False, "error": "Request body must be JSON"}, HTTPStatus.BAD_REQUEST)
            return

        project = payload.get("project") if isinstance(payload, dict) else None
        if not isinstance(project, dict) or not isinstance(project.get("elements"), list):
            self._send_json({"ok": False, "error": "Payload must include project.elements"}, HTTPStatus.BAD_REQUEST)
            return

        record = {
            "version": payload.get("version", 1),
            "storageKey": payload.get("storageKey") or context["config"]["storageKey"],
            "savedAt": payload.get("savedAt") or dt.datetime.now(dt.timezone.utc).isoformat(),
            "project": project,
        }

        state_file = context["state_file"]
        state_file.parent.mkdir(parents=True, exist_ok=True)
        tmp_file = state_file.with_suffix(".json.tmp")
        tmp_file.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        tmp_file.replace(state_file)

        self._send_json({"ok": True, "path": str(state_file), "savedAt": record["savedAt"]})

    def _send_json(self, payload: dict, status: HTTPStatus = HTTPStatus.OK):
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


def main():
    parser = argparse.ArgumentParser(description="Serve the shared product ad editor with disk persistence.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8765)
    parser.add_argument("--client", default="get-rid-of-dad-bod")
    parser.add_argument("--product", default="chocolate-whey")
    parser.add_argument("--template", default="r01-feature-benefit-product-hero")
    parser.add_argument("--angle", default=None)
    args = parser.parse_args()

    context = build_context(args)
    if not context["state_file"].exists():
        raise SystemExit(f"Missing editor state file: {context['state_file']}")

    server = ThreadingHTTPServer((args.host, args.port), EditorRequestHandler)
    server.default_args = args
    server.context = context
    print(f"Serving ad editor at http://{args.host}:{args.port}{EDITOR_PATH}")
    print(f"Serving ad admin at http://{args.host}:{args.port}{ADMIN_PATH}")
    context_label = f"{args.client}/{args.product}/{args.template}"
    if args.angle:
        context_label = f"{context_label}/{args.angle}"
    print(f"Client/product/template: {context_label}")
    print(f"Persisting editor state to {context['state_file']}")
    server.serve_forever()


if __name__ == "__main__":
    main()
