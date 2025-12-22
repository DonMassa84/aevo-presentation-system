# Changelog (intern)

## Inhaltliche Erweiterungen
- Master-Datei eingeführt: `content/aevo_master.yaml`
- Schema hinzugefügt: `schemas/aevo_master.schema.json`

## Build/Orchestrierung
- Varianten-Generator: `bin/aevo-variants`
- Manifest-Generator: `bin/aevo-manifest` (deterministisch)
- Lint: `bin/aevo-lint` (Duration = meta.duration_sec, summiert nur `sec:`)
- Pack: `bin/aevo-pack`
- Safe-Sync: `bin/aevo-sync-export` (kein delete)
- Systemd-Installer: `bin/aevo-systemd-install`

## Tests
- `selftest/aevo-selftest` erweitert/angepasst

