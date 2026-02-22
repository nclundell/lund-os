#!/usr/bin/env bash
set -e

abcde_packages=(
    abcde
    cdparanoia
    cdrtools
    curl
    flac
    glyr
    imagemagick
    lame
    libdiscid
    metaflac
    mp3gain
    opus-tools
    python-eyed3
    vorbis-tools
    vorbisgain
)

paru -Syu --noconfirm --needed "${abcde_packages[@]}"

distrobox-export --bin abcde
