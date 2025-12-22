AEVO Presentation System Architektur Stand Dez 2025

Ziel
Deterministisches AEVO-System zur Orchestrierung von Lern- und Ausspielartefakten.

Single Source of Truth
- content/aevo_master.yaml
  - meta.duration_sec: Soll-Dauer
  - slides.sec: Zeit pro Slide, Summe gleich duration_sec
  - slides.file: referenzierte Assets unter export

Qualitaet und Validierung
- schemas/aevo_master.schema.json
- bin/aevo-lint
  - liest duration_sec
  - summiert nur sec Zeilen
  - Bedingung: Summe sec gleich duration_sec

Order Varianten Manifest
- Orders: export/slides/orders
- Varianten: bin/aevo-variants erzeugt Order-Dateien wie 15min, 3min, fragen
- Manifest: bin/aevo-manifest erzeugt export/slides/manifest.json deterministisch

Pipeline
1 bin/aevo-sync-export
2 bin/aevo-variants
3 bin/aevo-manifest
4 bin/aevo-lint
5 bin/aevo-pack erzeugt out Pakete

Selftest
- selftest/aevo-selftest fuehrt die Kernpipeline aus
- passed bedeutet release-faehig

Systemd optional
- Installation: bin/aevo-systemd-install
- Aktivierung: systemctl --user enable --now aevo-slideshow.service
