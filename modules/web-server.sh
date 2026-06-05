#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg install -y php
WEBROOT="$HOME/www"
mkdir -p "$WEBROOT"
[[ -f "$WEBROOT/index.php" ]] || echo '<?php echo "Termux OS Web Server"; ?>' > "$WEBROOT/index.php"
echo "Starting PHP server at http://127.0.0.1:8080"
php -S 127.0.0.1:8080 -t "$WEBROOT"
