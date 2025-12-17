# 🎓 AEVO Presentation System 2025

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Slides](https://img.shields.io/badge/Slides-105-blue)](https://github.com/DonMassa84/aevo-presentation-system)
[![Formats](https://img.shields.io/badge/Formats-4-green)](https://github.com/DonMassa84/aevo-presentation-system)
[![Platform](https://img.shields.io/badge/Platform-Cross--Platform-orange)](https://github.com/DonMassa84/aevo-presentation-system)

Complete **AEVO (Ausbildereignungsprüfung)** exam preparation and presentation system with multi-format export capabilities and cross-platform desktop application.

![AEVO System](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

## ✨ Features

- 📊 **105 Professional Slides** (57 Strategy + 48 Passive Loop)
- 🎬 **Video Export** (MP4 with 5s/slide timing)
- 📄 **PDF Export** (High-quality print versions)
- 📊 **PowerPoint Export** (Fully editable PPTX)
- 🖥️ **Electron Desktop App** (Cross-platform GUI)
- 🚀 **25+ Bash Shortcuts** (Productivity tools)
- 💾 **USB-Ready** (Portable 168MB setup)
- 🧠 **Neuro-Didactic Framework** (Science-based teaching)

## 🎯 Content Overview

### Serie A: Neuro-Didactic Strategies (57 Slides)
Strategic learning approaches using neuroscience-based teaching methods for optimal knowledge retention.

### Serie B: Passive Learning Loop (48 Slides)
Comprehensive didactic framework for Active Directory user management training.

## 📦 Export Formats

| Format | Size | Use Case |
|--------|------|----------|
| **MP4** | 1.3-1.9 MB | Video presentations, auto-loop |
| **PDF** | 4.1-5.7 MB | Print-ready documents, handouts |
| **PPTX** | 3.2-4.5 MB | Editable presentations, customization |
| **ZIP** | 3.1-4.4 MB | Individual slide archives, backup |

## 🚀 Quick Start

### Desktop App

Install dependencies
cd AEVO_App
npm install

Start Electron app
npm start

Build for distribution
npm run build-linux

text

### Command Line Shortcuts
Slideshows
aevo-strategie # Open Serie A (57 slides)
aevo-passive # Open Serie B (48 slides)

Media
aevo-video # Play videos
aevo-pdf # Open PDFs

Utilities
aevo-count # Count slides
aevo-status # System status
aevo-export # List export files

text

## 📁 Project Structure

├── AEVO_Slideshow_Strategie_Lerntyp_JPG/ # 57 strategy slides
├── AEVO_Slideshow_Lerntyp_Rebuild_JPG/ # 48 passive slides
├── AEVO_Export/ # All export formats
│ ├── *.mp4 # Video files
│ ├── *.pdf # PDF documents
│ ├── *.pptx # PowerPoint files
│ └── *.zip # Slide archives
├── AEVO_App/ # Electron desktop app
│ ├── main.js # Main process
│ ├── index.html # UI
│ └── package.json # Dependencies
└── USB-STICK/ # Portable version

text

## 🎓 Use Cases

- ✅ AEVO exam preparation and certification
- ✅ Instructor training presentations
- ✅ Active Directory training courses
- ✅ Neuro-didactic teaching demonstrations
- ✅ Corporate training programs
- ✅ Educational workshops

## 📊 Statistics

- **Total Slides:** 105 (57 + 48)
- **Export Formats:** 4 (MP4, PDF, PPTX, ZIP)
- **Bash Aliases:** 25+
- **App Size:** ~70MB (installed)
- **Portable Size:** 168MB (USB)
- **Development Time:** Optimized workflow

## 🛠️ Tech Stack

- **Desktop App:** Electron 27.0+
- **Video Generation:** FFmpeg
- **PDF Export:** img2pdf, python-pptx
- **PowerPoint:** python-pptx
- **Automation:** Bash scripting
- **UI Framework:** Modern CSS with gradients

## 💻 System Requirements

### Desktop App
- Node.js 16+
- NPM 8+
- Linux (Ubuntu 24.04+)
- Windows 10/11
- macOS 10.15+

### Command Line Tools
- Bash 4.0+
- FFmpeg
- feh (image viewer)
- VLC media player

## 📥 Installation

Clone repository
git clone https://github.com/DonMassa84/aevo-presentation-system.git
cd aevo-presentation-system

Install Electron app
cd AEVO_App
npm install

Add bash shortcuts
cat >> ~/.bashrc << 'EOF'

AEVO Shortcuts
alias aevo-strategie='feh -F ~/path/to/AEVO_Slideshow_Strategie_Lerntyp_JPG/'
alias aevo-passive='feh -F ~/path/to/AEVO_Slideshow_Lerntyp_Rebuild_JPG/'
alias aevo-video='vlc ~/path/to/AEVO_Export/*.mp4'
EOF

source ~/.bashrc

text

## 📖 Documentation

- **User Guide:** See [docs/USER_GUIDE.md](docs/USER_GUIDE.md)
- **Developer Guide:** See [docs/DEVELOPER.md](docs/DEVELOPER.md)
- **Bash Aliases:** Complete list in `.bashrc` template

## 🤝 Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 👤 Author

**DonMassa84**
- GitHub: [@DonMassa84](https://github.com/DonMassa84)

## 🙏 Acknowledgments

- AEVO certification program
- Neuro-didactic research community
- Open-source contributors

## 📅 Version History

- **v1.0.0** (Dec 2025) - Initial release
  - 105 professional slides
  - 4 export formats
  - Electron desktop app
  - 25+ bash shortcuts

---

⭐ **Star this repo** if you find it useful!

📧 **Questions?** Open an issue or discussion.

🎓 **Good luck with your AEVO exam!**
