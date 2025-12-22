AEVO Presentation System (2026-ready)

Deterministisches AEVO-Orchestrierungssystem fuer Pruefungsvorbereitung und Ausspielung.

Features
- SSOT: content/aevo_master.yaml steuert Zeitbudget und Slide-Metadaten
- Qualitaet: bin/aevo-lint plus selftest/aevo-selftest
- Varianten: automatische Order-Varianten (15min, 3min, Prueferfragen)
- Manifest: export/slides/manifest.json als maschinenlesbare Ableitung
- Packaging: bin/aevo-pack erzeugt Pakete unter out
- Optional: systemd User-Units fuer Auto-Start

Quickstart
cd ~/aevo-presentation-system
selftest/aevo-selftest

Pipeline
bin/aevo-sync-export
bin/aevo-variants
bin/aevo-manifest
bin/aevo-lint
bin/aevo-pack

Systemd optional
bin/aevo-systemd-install
systemctl --user enable --now aevo-slideshow.service

Dokumentation
docs/ARCHITECTURE.md

Kontakt
Fuer Anpassungen oder Support: Issue eroeffnen oder Kontakt ueber GitHub-Profil.
