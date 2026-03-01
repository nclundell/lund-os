#!/usr/bin/env bash
set -e

echo "Enabling RPM Fusion repositories..."
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Refreshing package cache..."
sudo dnf makecache || true

echo "Installing video tools packages..."
VIDEO_PACKAGES=(
  autoconf
  automake
  gcc
  handbrake
  handbrake-gui
  libtool
  make
  expat-devel
  ffmpeg-devel
  openssl-devel
  qt5-qtbase-devel
  zlib-devel
)

sudo dnf install -y "${VIDEO_PACKAGES[@]}"

echo "Verifying VAAPI hardware acceleration..."
if command -v vainfo &>/dev/null; then
  vainfo || true
else
  echo "Note: vainfo not available, skipping VAAPI verification"
fi

BUILD_DIR="/tmp/makemkv-build"
MAKEMKV_VERSION="${1:-1.17.6}"

cleanup() {
  if [ -d "$BUILD_DIR" ]; then
    sudo rm -rf "$BUILD_DIR" || true
  fi
}

trap cleanup EXIT

mkdir -p "$BUILD_DIR"
pushd "$BUILD_DIR" > /dev/null

if command -v makemkvcon &>/dev/null; then
  INSTALLED_VERSION=$(makemkvcon --version 2>/dev/null | grep -oP '(?<=v)\d+\.\d+\.\d+' || true)
  if [ "$INSTALLED_VERSION" = "$MAKEMKV_VERSION" ]; then
    echo "MakeMKV $MAKEMKV_VERSION is already installed."
    popd > /dev/null
    exit 0
  fi
  echo "Replacing MakeMKV $INSTALLED_VERSION with $MAKEMKV_VERSION..."
fi

echo "Downloading MakeMKV $MAKEMKV_VERSION..."
curl -L -o "makemkv-oss-${MAKEMKV_VERSION}.tar.gz" "https://makemkv.com/download/old/makemkv-oss-${MAKEMKV_VERSION}.tar.gz"
curl -L -o "makemkv-bin-${MAKEMKV_VERSION}.tar.gz" "https://makemkv.com/download/old/makemkv-bin-${MAKEMKV_VERSION}.tar.gz"

echo "Extracting..."
tar -xzf "makemkv-oss-${MAKEMKV_VERSION}.tar.gz"
tar -xzf "makemkv-bin-${MAKEMKV_VERSION}.tar.gz"

echo "Building and installing makemkv-oss..."
pushd "makemkv-oss-${MAKEMKV_VERSION}" > /dev/null
./configure
make
sudo make install
popd > /dev/null

echo "Installing makemkv-bin..."
pushd "makemkv-bin-${MAKEMKV_VERSION}" > /dev/null
mkdir -p tmp
echo "yes" > tmp/eula_accepted
sudo make install
popd > /dev/null

if ! command -v makemkvcon &>/dev/null; then
  echo "ERROR: makemkvcon not found after installation."
  exit 1
fi

INSTALLED_VERSION=$(makemkvcon --version 2>/dev/null | head -n1)
echo "Successfully installed: $INSTALLED_VERSION"

popd > /dev/null

echo "Exporting applications to host..."
distrobox-export --app ghb
distrobox-export --app makemkv

echo "Video tools installation complete!"
