#!/usr/bin/env bash
set -euo pipefail

# Fix driver hang
rpm-ostree kargs --append-if-missing="usb-storage.quirks=0b05:1aec:u"
# Fix power management hang
rpm-ostree kargs --append-if-missing="usbcore.autosuspend=-1"
