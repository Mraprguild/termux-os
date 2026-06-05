#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

BACKUP_DIR="$HOME/backups/termux-os"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="$BACKUP_DIR/termux-home-$TIMESTAMP.tar.gz"
mkdir -p "$BACKUP_DIR"

echo "Creating backup: $ARCHIVE"
tar --exclude='./backups' --exclude='./.cache' -czf "$ARCHIVE" -C "$HOME" .
echo "Backup completed: $ARCHIVE"
