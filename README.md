# LundOS (Custom Fedora Atomic) &nbsp; [![bluebuild build badge](https://github.com/blue-build/template/actions/workflows/build.yml/badge.svg)](https://github.com/blue-build/template/actions/workflows/build.yml)

## Variants

There are three variants available:
- **lundos-main**: Standard build with AMD/Intel GPU support
- **lundos-nvidia**: NVIDIA GPU variant with proprietary driver
- **lundos-nvidia-open**: NVIDIA GPU variant with open-source driver

## Base Image

Uses [blue-build base images](https://github.com/blue-build/base-images) which include:
- Distrobox, just, bootc
- Codecs and multimedia support (via Negativo17)
- Hardware support (libcamera, nvtop, libratbag, etc.)
- udev rules for peripherals
- Automatic updates via bootc-fetch-apply-updates.timer

## Installation

To rebase an existing atomic Fedora installation to the latest build:
(Replace `{version}` with `main`, `nvidia`, or `nvidia-open` depending on which variant you want.)

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/nclundell/lundos-{version}:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/nclundell/lundos-{version}:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in the recipe, so you won't get accidentally updated to the next major version.
