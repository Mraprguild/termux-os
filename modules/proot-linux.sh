#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail
pkg install -y proot-distro
cat <<'MENU'
Linux Distribution
1) Ubuntu
2) Debian
MENU
read -r -p "Select: " choice
case "$choice" in
  1) distro="ubuntu" ;;
  2) distro="debian" ;;
  *) echo "Invalid option"; exit 1 ;;
esac
proot-distro install "$distro"
echo "Installed. Login with: proot-distro login $distro"
