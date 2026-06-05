#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

ARCHIVE="${1:-}"
if [[ -z "$ARCHIVE" || ! -f "$ARCHIVE" ]]; then
  echo "Usage: termux-os restore /path/to/backup.tar.gz"
  exit 1
fi

echo "Restoring $ARCHIVE into $HOME"
tar -xzf "$ARCHIVE" -C "$HOME"
echo "Restore completed."
