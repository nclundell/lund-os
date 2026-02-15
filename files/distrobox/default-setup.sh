#!/usr/bin/env bash
set -e

# Update system
sudo pacman -Syu --noconfirm

# Core packages for development and CLI tools
core_packages=(
    atuin
    base-devel
    bash-completion
    bat
    bat-extras
    bottom
    cabextract
    curl
    direnv
    eza
    fd
    fzf
    git
    git-delta
    github-cli
    glow
    jq
    just
    lazydocker
    lazygit
    libffi
    libyaml
    man-db
    man-pages
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

sudo pacman -S --noconfirm --needed "${core_packages[@]}"

distrobox-export --app mpd


