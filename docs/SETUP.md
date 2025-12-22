# Setup

## Voraussetzungen
- Linux mit systemd user session
- `xwallpaper` installiert
- Node + npm für `AEVO_App` (optional)

## Lokale Ordnerstruktur
- Slides: `$HOME/Bilder/AEVO_Feb2026_Slideshow_DarkMode_Lerntyp`
- Orders: `_order_<mode>.txt` im Slides-Ordner
- Binaries: `$HOME/.local/bin/aevo-*`
- Systemd Unit: `$HOME/.config/systemd/user/aevo-wallpaper-loop.service`
- Drop-in Mode: `$HOME/.config/systemd/user/aevo-wallpaper-loop.service.d/mode.conf`

## Schnellstart
- Mode setzen: `aevo-set-mode exam15`
- Logs: `aevo-logs`
- Verify: `aevo-verify-order exam15 20`
- Mode GUI: `aevo-mode-choose`

## Troubleshooting
- Unit reload: `systemctl --user daemon-reload`
- Service restart: `systemctl --user restart aevo-wallpaper-loop.service`
- Status: `systemctl --user status aevo-wallpaper-loop.service --no-pager`
