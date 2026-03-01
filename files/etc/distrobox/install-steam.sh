#!/usr/bin/env bash
set -e

# Gaming packages
packages=(
  gamescope
  gamemode
  lib32-gamemode
  lib32-mangohud
  lib32-openal
  lib32-vulkan-mesa-layers
  lib32-vulkan-radeon
  mangohud
  openal
  steam
  vulkan-mesa-layers
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# Patch steam.desktop for native optimizations
sudo sed -i 's@ (Runtime)@@g' /usr/share/applications/steam.desktop || true
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf || true

# Export Steam
distrobox-export --app steam

echo "Gaming tools installation complete!"
