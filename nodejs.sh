#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg install -y nodejs-lts
printf 'Node.js: '; node --version
printf 'npm: '; npm --version
