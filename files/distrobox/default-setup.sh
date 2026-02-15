#!/usr/bin/env bash
set -e

# Install paru (AUR helper) if not already installed
if ! command -v paru >/dev/null 2>&1; then
  bash /usr/etc/distrobox/paru-installer.sh
fi

# Core packages for development, CLI tools, and abcde dependencies
core_packages=(
    abcde
    abcde-musicbrainz-tool
    atuin
    base-devel
    bash-completion
    bat
    bat-extras
    bottom
    cabextract
    cdparanoia
    cdrtools
    curl
    direnv
    eza
    eye-d3
    fd
    flac
    fzf
    git
    git-delta
    github-cli
    glow
    glyr
    id3
    id3v2
    jq
    just
    lame
    lazydocker
    lazygit
    libffi
    libyaml
    man-db
    man-pages
    mkcue
    mpd
    neovim
    openssh
    openssl
    p7zip
    pacman-contrib
    pandoc
    poppler
    resvg
    ripgrep
    rust
    shellcheck
    sshfs
    starship
    stow
    sqlite
    tmux
    tree-sitter
    tree-sitter-cli
    unace
    unrar
    unzip
    wget
    xdg-user-dirs
    xdg-utils
    xz
    yazi
    yt-dlp
    zellij
    zlib
    zoxide
)

# Update system and install core packages
paru -Syu --noconfirm --needed "${core_packages[@]}"

distrobox-export --bin mpd
