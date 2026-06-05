#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

PROJECT_NAME="Termux OS"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.termux-os"
BIN_DIR="$PREFIX/bin"
LOG_FILE="$HOME/termux-os-install.log"

trap 'echo "Installation failed on line $LINENO. Check $LOG_FILE" >&2' ERR
exec > >(tee -a "$LOG_FILE") 2>&1

printf '\n========================================\n'
printf ' %s Installer\n' "$PROJECT_NAME"
printf '========================================\n\n'

if [[ -z "${PREFIX:-}" || "$PREFIX" != *"com.termux"* ]]; then
  echo "This installer must be run inside Termux."
  exit 1
fi

pkg update -y
pkg upgrade -y

while IFS= read -r package; do
  [[ -z "$package" || "$package" == \#* ]] && continue
  echo "Installing: $package"
  pkg install -y "$package" || echo "Warning: could not install $package"
done < "$PROJECT_DIR/config/packages.txt"

mkdir -p "$INSTALL_DIR" "$HOME/bin" "$HOME/backups/termux-os"
cp -R "$PROJECT_DIR"/* "$INSTALL_DIR"/

echo "1.0.0" > "$INSTALL_DIR/VERSION"

cat > "$BIN_DIR/termux-os" <<'SCRIPT'
#!/data/data/com.termux/files/usr/bin/bash
set -e
BASE="$HOME/.termux-os"
COMMAND="${1:-help}"
case "$COMMAND" in
  info) "$BASE/scripts/system-info.sh" ;;
  backup) "$BASE/scripts/backup.sh" ;;
  restore) "$BASE/scripts/restore.sh" "${2:-}" ;;
  update) "$BASE/update.sh" ;;
  dev) "$BASE/scripts/developer-tools.sh" ;;
  linux) "$BASE/modules/proot-linux.sh" ;;
  help|*)
    cat <<'HELP'
Termux OS Commands
  termux-os info       Show system information
  termux-os backup     Create a backup
  termux-os restore    Restore a backup archive
  termux-os update     Update packages and project files
  termux-os dev        Install developer tools
  termux-os linux      Install Ubuntu or Debian
HELP
    ;;
esac
SCRIPT
chmod +x "$BIN_DIR/termux-os"
chmod +x "$INSTALL_DIR"/*.sh "$INSTALL_DIR"/scripts/*.sh "$INSTALL_DIR"/modules/*.sh

if ! grep -q 'TERMUX_OS_HOME' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'EOF_BASHRC'

# Termux OS
export TERMUX_OS_HOME="$HOME/.termux-os"
export PATH="$HOME/bin:$PATH"
EOF_BASHRC
fi

printf '\n%s installed successfully.\n' "$PROJECT_NAME"
printf 'Run: termux-os help\n'
printf 'Log: %s\n' "$LOG_FILE"
