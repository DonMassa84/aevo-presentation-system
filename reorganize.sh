#!/bin/bash
set -euo pipefail

BASE="$HOME/Bilder/AEVO_Unterweisung_Active_Directory_Nutzer_anlegen"
cd "$BASE"

echo "Erstelle neue Struktur..."
mkdir -p active/{serie_a_strategie_57,serie_b_passive_48,export}
mkdir -p archive/{v1_combined_18,v2_diashow_18,pdf_pages_78,all_zips}
mkdir -p source/{pdf_documents,scripts,images}

# Produktiv verschieben
[ -d "AEVO_Slideshow_Strategie_Lerntyp_JPG" ] && \
  mv AEVO_Slideshow_Strategie_Lerntyp_JPG active/serie_a_strategie_57
[ -d "AEVO_Slideshow_Lerntyp_Rebuild_JPG" ] && \
  mv AEVO_Slideshow_Lerntyp_Rebuild_JPG active/serie_b_passive_48
[ -d "AEVO_Export" ] && \
  mv AEVO_Export active/export

# Archive verschieben
[ -d "AEVO_Diashow_Combined_JPG" ] && \
  mv AEVO_Diashow_Combined_JPG archive/v1_combined_18
[ -d "AEVO_Diashow_JPG" ] && \
  mv AEVO_Diashow_JPG archive/v2_diashow_18
[ -d "AEVO_Diashow_Lerntyp_AD_User" ] && \
  mv AEVO_Diashow_Lerntyp_AD_User archive/v2_diashow_18_backup
[ -d "AEVO_Passive_Slideshow_JPG" ] && \
  mv AEVO_Passive_Slideshow_JPG archive/pdf_pages_78

# ZIPs archivieren
mv *.zip archive/all_zips/ 2>/dev/null || true

# Quellen verschieben
[ -d "AEVO_Unterweisung_Active_Directory_Nutzer_anlegen" ] && \
  mv AEVO_Unterweisung_Active_Directory_Nutzer_anlegen source/pdf_documents
[ -d "angepasstes Fachgespräch-Skript" ] && \
  mv "angepasstes Fachgespräch-Skript" source/scripts/fachgespraech
[ -f "ChatGPT Image"*.png ] && \
  mv "ChatGPT Image"*.png source/images/ 2>/dev/null || true

# Master (defekt) löschen
rm -rf AEVO_Master_Slideshow_JPG

# README erstellen
cat > README.txt << 'README'
╔════════════════════════════════════════════════════════════╗
║  AEVO SLIDESHOW - DATENSTRUKTUR                           ║
╚════════════════════════════════════════════════════════════╝

📁 active/
   ├── serie_a_strategie_57/  → 57 Slides (Neuro-Strategien)
   ├── serie_b_passive_48/    → 48 Slides (Didaktik-Loop)
   └── export/                → PDFs, Videos, ZIPs

📁 archive/
   └── Alte Versionen & Backups

📁 source/
   └── Originaldokumente & Scripts

🚀 VERWENDUNG:
   aevo-mode-strategie   → Serie A (57 Slides)
   aevo-mode-rebuild     → Serie B (48 Slides)
   aevo-status           → Status anzeigen

📊 EXPORT-FORMATE:
   active/export/*.pdf   → Druckversionen
   active/export/*.mp4   → Video-Loops
   active/export/*.zip   → Einzelne Slides
README

echo "✅ Reorganisation komplett!"
echo "Neue Struktur:"
tree -L 2 -d "$BASE" 2>/dev/null || find "$BASE" -type d -maxdepth 2
