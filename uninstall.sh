#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

rm -f "$PREFIX/bin/termux-os"
rm -rf "$HOME/.termux-os"

if [[ -f "$HOME/.bashrc" ]]; then
  sed -i '/# Termux OS/,+2d' "$HOME/.bashrc"
fi

echo "Termux OS files removed. Installed packages were kept."
