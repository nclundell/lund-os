#!/usr/bin/env bash
set -e

# Update system
sudo pacman -Syu --noconfirm

# Install media tools
sudo pacman -S --noconfirm --needed handbrake mkvtoolnix-cli mkvtoolnix-gui

# Ensure base-devel and git are installed
sudo pacman -S --noconfirm --needed base-devel git

# Download and build MakeMKV 1.17.7 from AUR
mkdir -p /tmp/makemkv-build
cd /tmp/makemkv-build
git clone https://aur.archlinux.org/makemkv.git
cd makemkv
git checkout 256a507d6ad5263b01bb8b3bbf8c9c176564f28f

# Verify PKGBUILD version
if ! grep -q '^pkgver=1.17.7' PKGBUILD; then
  echo "ERROR: PKGBUILD version is not 1.17.7. Aborting."
  exit 1
fi

makepkg -si --noconfirm
cd ~
rm -rf /tmp/makemkv-build



# Lock MakeMKV version in pacman.conf
if ! grep -q '^IgnorePkg *=.*makemkv' /etc/pacman.conf; then
  echo 'IgnorePkg = makemkv' | sudo tee -a /etc/pacman.conf
fi
