#!/usr/bin/env bash
set -euo pipefail
DIR="${1:?dir missing}"
INTERVAL="${2:-180}"

mapfile -t OUTS < <(xrandr 2>/dev/null | awk '/ connected/{print $1}' || true)
[ "${#OUTS[@]}" -gt 0 ] || { echo "FEHLER: xrandr liefert keine Outputs (kein X11/Display?)."; exit 1; }

mapfile -t FILES < <(find "$DIR" -maxdepth 1 -type f -iname '*.jpg' -print | sort -V)
[ "${#FILES[@]}" -gt 0 ] || { echo "FEHLER: keine JPGs in $DIR"; exit 1; }

use_xwallpaper=0
command -v xwallpaper >/dev/null 2>&1 && use_xwallpaper=1

i=0
while true; do
  f="${FILES[$i]}"
  if [ "$use_xwallpaper" -eq 1 ]; then
    for o in "${OUTS[@]}"; do
      xwallpaper --output "$o" --zoom "$f" >/dev/null 2>&1 || true
    done
  else
    feh --no-fehbg --bg-fill "$f" >/dev/null 2>&1 || true
  fi
  sleep "$INTERVAL"
  i=$(( (i + 1) % ${#FILES[@]} ))
done
