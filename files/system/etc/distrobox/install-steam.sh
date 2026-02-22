#!/usr/bin/env bash
set -e

# Core packages (pacman)
core_packages=(
  base-devel
  gamemode
  lib32-gamemode
  lib32-mangohud
  lib32-openal
  lib32-pipewire
  lib32-pipewire-jack
  lib32-vulkan-mesa-layers
  lib32-vulkan-radeon
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

# Update system and install core packages
paru -Syu --noconfirm --needed "${core_packages[@]}"

# Patch steam.desktop and makepkg.conf for native optimizations
sudo sed -i 's@ (Runtime)@@g' /usr/share/applications/steam.desktop || true
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf || true

# Export Steam as desktop app
distrobox-export --app steam
