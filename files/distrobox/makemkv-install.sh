#!/usr/bin/env bash
set -e

# Build and install MakeMKV 1.17.7 from AUR
BUILD_DIR="/tmp/makemkv-build"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"
git clone https://aur.archlinux.org/makemkv.git
cd makemkv
git checkout 256a507d6ad5263b01bb8b3bbf8c9c176564f28f

# Verify PKGBUILD version
if ! grep -q '^pkgver=1.17.7' PKGBUILD; then
  echo "ERROR: PKGBUILD version is not 1.17.7. Aborting."
  exit 1
fi

makepkg -si
cd ~
rm -rf "$BUILD_DIR"

# Lock MakeMKV version in pacman.conf
if ! grep -q '^IgnorePkg *=.*makemkv' /etc/pacman.conf; then
  echo 'IgnorePkg = makemkv' | sudo tee -a /etc/pacman.conf
fi
