#!/usr/bin/env bash
set -e

handbrake_packages=(
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

paru -Syu --noconfirm --needed "${handbrake_packages[@]}"

distrobox-export --app handbrake
distrobox-export --app mkvtoolnix-gui
