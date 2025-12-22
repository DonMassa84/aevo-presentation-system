#!/usr/bin/env bash
set -euo pipefail
DIR="${1:-}"
INTERVAL="${2:-120}"
test -n "${DIR:-}" || { echo "FAIL: usage: wallpaper-passive-slideshow.sh <dir> [interval]"; exit 1; }
test -d "$DIR" || { echo "FAIL: dir not found: $DIR"; exit 1; }

if [ -x "$HOME/.local/bin/aevo-wallpaper-loop.sh" ]; then
  nohup "$HOME/.local/bin/aevo-wallpaper-loop.sh" "$DIR" "$INTERVAL" >/dev/null 2>&1 &
  echo "OK: started aevo-wallpaper-loop.sh (DIR=$DIR INTERVAL=${INTERVAL}s)"
  exit 0
fi

echo "FAIL: missing ~/.local/bin/aevo-wallpaper-loop.sh"
exit 1
