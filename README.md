# AEVO Presentation System (2026-ready)

Deterministisches AEVO-Orchestrierungssystem für Prüfungsvorbereitung und Ausspielung.

## Features
- SSOT: content/aevo_master.yaml steuert Zeitbudget und Slide-Metadaten
- Qualität: bin/aevo-lint + selftest/aevo-selftest
- Varianten: automatische Order-Varianten (15min, 3min, Prüferfragen)
- Manifest: export/slides/manifest.json als maschinenlesbare Ableitung
- Packaging: bin/aevo-pack erzeugt Pakete unter out/
- Optional: systemd User-Units für Auto-Start

## Quickstart
cd ~/aevo-presentation-system
selftest/aevo-selftest

## Pipeline
bin/aevo-sync-export
bin/aevo-variants
bin/aevo-manifest
bin/aevo-lint
bin/aevo-pack

## Systemd (optional)
bin/aevo-systemd-install
systemctl --user enable --now aevo-slideshow.service

## Dokumentation
docs/ARCHITECTURE.md

## Kontakt
Für Anpassungen oder Support: Issue eröffnen oder Kontakt über GitHub-Profil.
