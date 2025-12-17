#!/bin/bash
# Erstelle einfaches SVG-Icon
cat > icon.svg << 'SVG'
<svg width="512" height="512" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#667eea;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#764ba2;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="512" height="512" rx="100" fill="url(#grad)"/>
  <text x="256" y="350" font-size="300" text-anchor="middle" fill="white">🎓</text>
</svg>
SVG

# Konvertiere zu PNG (falls inkscape installiert ist)
if command -v inkscape &> /dev/null; then
  inkscape -w 512 -h 512 icon.svg -o icon.png
  echo "✅ Icon erstellt: icon.png"
else
  echo "⚠️  Inkscape nicht installiert. SVG-Icon erstellt: icon.svg"
fi
