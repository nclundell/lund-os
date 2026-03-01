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
  intel-media-driver
  libva-mesa-driver
  mangohud
  openal
  steam
  vulkan-mesa-layers
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# Patch steam.desktop for native optimizations and Wayland/CEF fix
sudo sed -i 's@ (Runtime)@@g' /usr/share/applications/steam.desktop
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf
sudo sed -i 's/steam %U/steam %U -cef-disable-gpu/g' /usr/share/applications/steam.desktop

# Export Steam
distrobox-export --app steam

echo "Gaming tools installation complete!"
