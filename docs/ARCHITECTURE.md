# AEVO Presentation System – Architektur (Stand: Dez 2025)

## Ziel
Deterministisches AEVO-System zur Orchestrierung von Lern- und Ausspielartefakten.

## Single Source of Truth (SSOT)
- content/aevo_master.yaml
  - meta.duration_sec: Soll-Dauer
  - slides[].sec: Zeit pro Slide (Summe == duration_sec)
  - slides[].file: referenzierte Assets unter export/

## Qualität & Validierung
- schemas/aevo_master.schema.json
- bin/aevo-lint
  - liest duration_sec
  - summiert ausschließlich Zeilen "sec:"
  - Bedingung: Summe(sec) == duration_sec

## Order → Varianten → Manifest
- Orders: export/slides/orders/_order*.txt
- Varianten: bin/aevo-variants erzeugt u. a.
  - _order_15min.txt
  - _order_3min.txt
  - _order_fragen.txt
- Manifest: bin/aevo-manifest erzeugt export/slides/manifest.json (deterministisch)

## Pipeline (Kurzform)
1) bin/aevo-sync-export
2) bin/aevo-variants
3) bin/aevo-manifest
4) bin/aevo-lint
5) bin/aevo-pack  -> out/aevo_package_*.zip

## Selftest
- selftest/aevo-selftest führt die Kernpipeline aus.
- "passed" bedeutet: release-fähig.

## Systemd (optional)
- Installation: bin/aevo-systemd-install
- Aktivierung: systemctl --user enable --now aevo-slideshow.service
