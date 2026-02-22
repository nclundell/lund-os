#!/usr/bin/env bash
set -e

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
    eza
    fd
    fzf
    git
    git-delta
    github-cli
    glow
    imagemagick
    jq
    just
    lame
    lazydocker
    lazygit
    libffi
    libyaml
    man-db
    man-pages
    mise
    mpd
    ncmpcpp
    neovim
    opencode
    openssh
    openssl
    p7zip
    pandoc
    poppler
    resvg
    ripgrep
    rust
    shellcheck
    sshfs
    sqlite
    starship
    stow
    tmux
    tree-sitter
    tree-sitter-cli
    unace
    unrar
    unzip
    usage
    w3m
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

distrobox-export --bin /usr/bin/atuin
distrobox-export --bin /usr/bin/bat
distrobox-export --bin /usr/bin/btm
distrobox-export --bin /usr/bin/eza
distrobox-export --bin /usr/bin/fd
distrobox-export --bin /usr/bin/fzf
distrobox-export --bin /usr/bin/jq
distrobox-export --bin /usr/bin/just
distrobox-export --bin /usr/bin/lazydocker
distrobox-export --bin /usr/bin/lazygit
distrobox-export --bin /usr/bin/mpd
distrobox-export --bin /usr/bin/mise
distrobox-export --bin /usr/bin/ncmpcpp
distrobox-export --bin /usr/bin/nvim
distrobox-export --bin /usr/bin/opencode
distrobox-export --bin /usr/bin/rg
distrobox-export --bin /usr/bin/starship
distrobox-export --bin /usr/bin/tmux
distrobox-export --bin /usr/bin/yazi
distrobox-export --bin /usr/bin/yt-dlp
distrobox-export --bin /usr/bin/zellij
distrobox-export --bin /usr/bin/zoxide
