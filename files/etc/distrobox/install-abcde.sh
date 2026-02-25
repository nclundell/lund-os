#!/usr/bin/env bash
set -e

abcde_packages=(
    abcde
    cdrtools
    flac
    glyr
    imagemagick
    lame
    libdiscid
    opus-tools
    vorbis-tools
)

paru -Syu --noconfirm --needed "${abcde_packages[@]}"

distrobox-export --bin /usr/bin/abcde
