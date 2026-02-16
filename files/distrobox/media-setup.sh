#!/usr/bin/env bash
set -e

# Install paru (AUR helper) if not already installed
if ! command -v paru >/dev/null 2>&1; then
  bash /usr/etc/distrobox/paru-installer.sh
fi

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
    mesa
    mesa-vdpau
    mkvtoolnix-cli
    mkvtoolnix-gui
)

# Update system and install media packages
paru -Syu --noconfirm --needed "${media_packages[@]}"

# Install MakeMKV 1.17.7
bash /usr/etc/distrobox/makemkv-install.sh
