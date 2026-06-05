#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

echo "Updating Termux packages..."
pkg update -y
pkg upgrade -y

if command -v git >/dev/null 2>&1 && [[ -d "$HOME/.termux-os/.git" ]]; then
  echo "Updating Termux OS repository..."
  git -C "$HOME/.termux-os" pull --ff-only
else
  echo "Project files are not a Git checkout. Package update completed."
fi

echo "Termux OS update completed."
