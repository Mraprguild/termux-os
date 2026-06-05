# Termux OS

A modular setup and management toolkit for Termux on Android.

## Features

- Safe package installation and updates
- Developer environments for Python, Node.js, PHP, C/C++, Java, Go and Rust
- Git and GitHub CLI setup
- Storage access setup
- Ubuntu and Debian installation with `proot-distro`
- Backup and restore utilities
- System information dashboard
- Optional Zsh shell configuration
- Modular installer design

## Requirements

- Termux installed from F-Droid or the official Termux GitHub releases
- Android 7 or newer
- Internet connection

## Installation

```bash
pkg update -y
pkg install git -y
git clone https://github.com/Mraprguild/termux-os.git
cd termux-os
chmod +x install.sh update.sh uninstall.sh scripts/*.sh modules/*.sh
./install.sh
```

## Commands

```bash
termux-os
termux-os info
termux-os backup
termux-os restore
termux-os update
```

## Project Structure

```text
termux-os/
├── install.sh
├── update.sh
├── uninstall.sh
├── config/
├── scripts/
├── modules/
└── docs/
```

## Security

Review shell scripts before running them. This project does not require root access and does not bypass Android security protections.

## Author

Mraprguild  
GitHub: [Mraprguild](https://github.com/Mraprguild)

## License

MIT License
