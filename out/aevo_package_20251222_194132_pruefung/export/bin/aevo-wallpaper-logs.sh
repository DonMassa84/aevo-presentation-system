#!/usr/bin/env bash
set -euo pipefail
SVC="aevo-wallpaper-loop.service"
exec bash -lc "journalctl --user -u '$SVC' -f"
