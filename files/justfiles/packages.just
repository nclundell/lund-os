# Build and install a pinned version of MakeMKV from source
# Uses a temporary Fedora container so no build deps pollute the host
# Usage: just install-makemkv        (installs 1.17.6)
#        just install-makemkv 1.17.3 (installs a specific version)
install-makemkv version='1.17.6':
    @sudo /usr/local/bin/build-makemkv {{version}}

# Remove MakeMKV binaries and data installed by install-makemkv
uninstall-makemkv:
    @sudo rm -f /usr/local/bin/makemkv /usr/local/bin/makemkvcon
    @sudo rm -rf /usr/local/lib/makemkv /usr/local/share/MakeMKV
    @echo "MakeMKV uninstalled."
