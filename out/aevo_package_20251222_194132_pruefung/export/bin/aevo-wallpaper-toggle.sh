#!/usr/bin/env bash
set -euo pipefail
SVC="aevo-wallpaper-loop.service"

notify() {
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "AEVO Slideshow" "$1"
  else
    echo "$1"
  fi
}

if systemctl --user is-active --quiet "$SVC"; then
  systemctl --user stop "$SVC"
  notify "Stop"
else
  systemctl --user daemon-reload
  systemctl --user reset-failed "$SVC" >/dev/null 2>&1 || true
  systemctl --user start "$SVC"
  notify "Start"
fi
