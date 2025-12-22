#!/usr/bin/env bash
set -euo pipefail

DIR="${1:-$HOME/Bilder/AEVO_Feb2026_Slideshow_DarkMode_Lerntyp}"

export DISPLAY="${DISPLAY:-:0}"
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

need(){ command -v "$1" >/dev/null 2>&1; }
need xwallpaper || { echo "FEHLER: xwallpaper fehlt"; exit 1; }

MODE="${AEVO_MODE:-passive}"
TEST_SEC="${AEVO_TEST_SEC:-}"

order_for_mode() {
  case "$MODE" in
    spaced)  echo "$DIR/_order_spaced.txt" ;;
    exam15)  echo "$DIR/_order_exam15.txt" ;;
    linear|passive|*) echo "$DIR/_order_base.txt" ;;
  esac
}

sec_for() {
  local f="$1" u
  u="$(printf '%s' "$f" | tr '[:lower:]' '[:upper:]')"
  if [ -n "${TEST_SEC:-}" ]; then printf '%s' "$TEST_SEC"; return; fi

  if [ "$MODE" = "exam15" ]; then
    case "$u" in
      *RECALL*) printf '18' ;;
      *CHECKLISTE*|*TECHNIK_AD*) printf '30' ;;
      *FACHPRAECH*ANTWORT*) printf '28' ;;
      *FACHPRAECH*|*PR_SENTATION*|*SICHERHEIT*|*METHODIK*|*UNTERWEISUNG*|*PR_FUNG*|*DIDAKTIK*) printf '24' ;;
      *FINISH*) printf '20' ;;
      *) printf '22' ;;
    esac
    return
  fi

  if [ "$MODE" = "spaced" ]; then
    case "$u" in
      0001_*|0002_*|0003_*) printf '120' ;;
      *RECALL*) printf '45' ;;
      *CHECKLISTE*|*TECHNIK_AD*) printf '75' ;;
      *FACHPRAECH*ANTWORT*) printf '60' ;;
      *FACHPRAECH*) printf '55' ;;
      *SICHERHEIT*|*METHODIK*|*UNTERWEISUNG*|*PR_SENTATION*|*PR_FUNG*|*DIDAKTIK*) printf '70' ;;
      *FINISH*) printf '50' ;;
      *) printf '65' ;;
    esac
    return
  fi

  case "$u" in
    0001_*|0002_*|0003_*) printf '150' ;;
    *RECALL*) printf '60' ;;
    *CHECKLISTE*|*TECHNIK_AD*) printf '90' ;;
    *FACHPRAECH*ANTWORT*) printf '75' ;;
    *FACHPRAECH*) printf '70' ;;
    *SICHERHEIT*|*METHODIK*|*UNTERWEISUNG*|*PR_SENTATION*|*PR_FUNG*|*DIDAKTIK*) printf '85' ;;
    *FINISH*) printf '60' ;;
    *) printf '80' ;;
  esac
}

ORDER="$(order_for_mode)"
[ -d "$DIR" ] || { echo "FEHLER: DIR nicht gefunden: $DIR"; exit 1; }
[ -s "$ORDER" ] || { echo "FEHLER: ORDER fehlt/leer: $ORDER"; exit 1; }

mapfile -t LIST < <(grep -v '^[[:space:]]*$' "$ORDER" || true)
[ "${#LIST[@]}" -gt 0 ] || { echo "FEHLER: ORDER hat keine Einträge: $ORDER"; exit 1; }

echo "AEVO LOOP START"
echo "MODE=$MODE"
echo "ORDER=$ORDER"
echo "COUNT=${#LIST[@]}"

i=0
while true; do
  name="${LIST[$i]}"
  img="$DIR/$name"
  if [ -f "$img" ]; then
    sec="$(sec_for "$name")"
    xwallpaper --zoom "$img" >/dev/null 2>&1 || true
    echo "SHOW $name $sec"
    sleep "$sec"
  fi
  i=$(( (i + 1) % ${#LIST[@]} ))
done
