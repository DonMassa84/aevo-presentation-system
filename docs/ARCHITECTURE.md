# AEVO Presentation System – Architektur (Stand: Dez 2025)

## Ziel
Deterministisches AEVO-System zur Orchestrierung von Lern- und Ausspielartefakten.

## Single Source of Truth (SSOT)
- `content/aevo_master.yaml`
  - `meta.duration_sec`: Soll-Dauer
  - `slides[].sec`: Zeit pro Slide (Summe == duration_sec)
  - `slides[].file`: referenzierte Assets unter `export/`

## Qualität & Validierung
- `schemas/aevo_master.schema.json`
- `bin/aevo-lint`
  - liest `duration_sec`
  - summiert ausschließlich Zeilen `sec:`
  - Bedingung: Summe(sec) == duration_sec

## Order → Varianten → Manifest
- Orders: `export/slides/orders/_order*.txt`
- Varianten: `bin/aevo-variants` erzeugt u. a.:
  - `_order_15min.txt`
  - `_order_3min.txt`
  - `_order_fragen.txt`
- Manifest: `bin/aevo-manifest` erzeugt:
  - `export/slides/manifest.json` (deterministisch)

## Pipeline
```bash
bin/aevo-sync-export
bin/aevo-variants
bin/aevo-manifest
bin/aevo-lint
bin/aevo-pack
Selftest
selftest/aevo-selftest führt die Kernpipeline aus.

“passed” bedeutet: release-fähig.

Systemd (optional)
bash
Code kopieren
bin/aevo-systemd-install
systemctl --user enable --now aevo-slideshow.service
