#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg install -y python python-pip
python -m pip install --upgrade pip
printf 'Python: '; python --version
