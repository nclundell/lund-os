#!/usr/bin/env bash
set -e

# Check if paru is already installed
if command -v paru &> /dev/null; then
  echo "paru is already installed."
  exit 0
fi

# Install required build dependencies
sudo pacman -S --noconfirm --needed bat devtools

# Create and enter a temporary directory
tmpdir=$(mktemp -d)
pushd "$tmpdir"

# Clone paru from AUR
git clone https://aur.archlinux.org/paru.git

# Build and install paru
cd paru
makepkg -si

# Return to original directory and clean up
popd
rm -rf "$tmpdir"
