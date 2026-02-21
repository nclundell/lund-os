#!/usr/bin/env bash
set -e

# Media tools and GPU drivers for HandBrake hardware encoding
media_packages=(
    base-devel
    git
    gst-libav
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    handbrake
    intel-media-driver
    libdvdcss
    libva-intel-driver
    libva-mesa-driver
    libva-utils
    mkvtoolnix-cli
    mkvtoolnix-gui
)

# Update system and install media packages
paru -Syu --noconfirm --needed "${media_packages[@]}"

# Skip if MakeMKV 1.17.7 is already installed
if pacman -Q makemkv &>/dev/null && makemkvcon --version 2>/dev/null | grep -q '1.17.7'; then
  echo "MakeMKV 1.17.7 is already installed."
  exit 0
fi

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

distrobox-export --app makemkv
distrobox-export --app handbrake
distrobox-export --app mkvtoolnix-gui
