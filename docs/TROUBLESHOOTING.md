# Troubleshooting

## Permission denied

```bash
chmod +x install.sh update.sh uninstall.sh scripts/*.sh modules/*.sh
```

## Storage access

```bash
termux-setup-storage
```

Then allow the Android storage permission.

## Package not found

```bash
pkg update
termux-change-repo
```

Select a working mirror and retry.

## Reset a Proot distribution

```bash
proot-distro remove ubuntu
proot-distro install ubuntu
```
