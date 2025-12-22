# AEVO Presentation System

## Zweck
Ein lokales AEVO-Lern- und Präsentationssystem mit Wallpaper-Slideshow, Modi (Order-Sets), Desktop-Shortcuts, CLI-Tools und App-Anbindung.

## Kernkomponenten
- Wallpaper Loop Service: `aevo-wallpaper-loop.service` (systemd --user)
- Modes via Drop-in: `~/.config/systemd/user/aevo-wallpaper-loop.service.d/mode.conf`
- Order-Dateien: `_order_<mode>.txt` im Slides-Ordner
- CLI Tools: `aevo-*` in `~/.local/bin`
- Desktop Icons: `AEVO_*.desktop` für Maussteuerung

## Modes
Die Modes wählen primär eine Order-Datei. Der Loop zeigt in exakt dieser Reihenfolge.

- base: Voller Grundsatz-Loop (Order: `_order_base.txt`)
- default: Fallback-Loop (Order: `_order_default.txt` oder `_order.txt`)
- didaktik: Kurzloop Didaktik und Methodik (Order: `_order_didaktik.txt`)
- exam15: Prüfungstaktik 15-Minuten Fokus (Order: `_order_exam15.txt`)
- security: Technik und Least-Privilege Fokus (Order: `_order_security.txt`)
- spaced: Spaced-Repetition Loop mit längeren Zeiten (Order: `_order_spaced.txt`)
- final: Finaler Endspurt, Fehler, Abschluss (Order: `_order_final.txt`)

## Neue Addons
- `aevo-set-mode <mode>`: schreibt `mode.conf` und restarted Service.
- `aevo-mode-choose`: GUI Mode Picker (zenity fallback to terminal).
- `aevo-verify-order <mode> [K]`: verifiziert, ob die letzten K SHOWs zur Order des Modes passen.
- `aevo-api-test`: API-Healthcheck für Coach/LLM-Integration.
- Desktop Shortcuts: Start, Stop, Logs, Mode Switch, App, Drill.
