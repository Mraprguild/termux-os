#!/data/data/com.termux/files/usr/bin/bash
set -u

echo "========== Termux OS System Information ==========
printf 'User: %s\n' "$(whoami 2>/dev/null || echo unknown)"
printf 'Android: %s\n' "$(getprop ro.build.version.release 2>/dev/null || echo unknown)"
printf 'Device: %s %s\n' "$(getprop ro.product.manufacturer 2>/dev/null)" "$(getprop ro.product.model 2>/dev/null)"
printf 'Architecture: %s\n' "$(uname -m)"
printf 'Kernel: %s\n' "$(uname -r)"
printf 'Shell: %s\n' "${SHELL:-unknown}"
printf 'Home: %s\n' "$HOME"
printf 'Prefix: %s\n' "$PREFIX"
printf 'Disk usage:\n'
df -h "$HOME" 2>/dev/null | tail -n 1
printf 'Memory:\n'
free -h 2>/dev/null || true
