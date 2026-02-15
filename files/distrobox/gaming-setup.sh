#!/usr/bin/env bash
set -e

# Update system
sudo pacman -Syu --noconfirm

# Core packages (pacman)
core_packages=(
    gamemode
    lib32-gamemode
    lib32-mangohud
    lib32-openal
    lib32-pipewire
    lib32-pipewire-jack
    lib32-vulkan-mesa-layers
    lib32-vulkan-radeon
    lutris
    mangohud
    openal
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    steam
    vulkan-mesa-layers
    xdg-user-dirs
    wine
    winetricks
)

sudo pacman -S --noconfirm --needed "${core_packages[@]}"


# Patch steam.desktop and makepkg.conf for native optimizations
sudo sed -i 's@ (Runtime)@@g' /usr/share/applications/steam.desktop || true
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf || true

# Export Steam and Lutris as desktop apps
distrobox-export --app steam
distrobox-export --app lutris

