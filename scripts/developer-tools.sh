#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

cat <<'MENU'
Developer Tool Groups
1) Python
2) Node.js
3) PHP
4) C/C++
5) Java
6) Go
7) Rust
8) Install all
MENU
read -r -p "Select an option: " choice
case "$choice" in
  1) pkg install -y python python-pip ;;
  2) pkg install -y nodejs-lts ;;
  3) pkg install -y php composer ;;
  4) pkg install -y clang cmake make gdb ;;
  5) pkg install -y openjdk-21 ;;
  6) pkg install -y golang ;;
  7) pkg install -y rust ;;
  8) pkg install -y python python-pip nodejs-lts php composer clang cmake make gdb openjdk-21 golang rust ;;
  *) echo "Invalid option"; exit 1 ;;
esac
