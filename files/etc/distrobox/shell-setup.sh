#!/usr/bin/env bash
set -e

# Install paru (AUR helper) if not already installed
if ! command -v paru >/dev/null 2>&1; then
  bash /usr/etc/distrobox/paru-installer.sh
fi

# Core packages for development, CLI tools, and abcde dependencies
core_packages=(
    abcde
    abcde-musicbrainz-meta
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
    eza
    fd
    ffmpeg
    flac
    fzf
    git
    git-delta
    github-cli
    glow
    glyr
    id3v2
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
    mkcue
    mpd
    ncmpcpp
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
    sqlite
    starship
    stow
    tmux
    tree-sitter
    tree-sitter-cli
    unace
    unrar
    unzip
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

distrobox-export --bin abcde
distrobox-export --bin atuin
distrobox-export --bin bat
distrobox-export --bin bottom
distrobox-export --bin eza
distrobox-export --bin fd
distrobox-export --bin fzf
distrobox-export --bin jq
distrobox-export --bin just
distrobox-export --bin lazydocker
distrobox-export --bin lazygit
distrobox-export --bin mpd
distrobox-export --bin ncmpcpp
distrobox-export --bin neovim
distrobox-export --bin ripgrep
distrobox-export --bin starship
distrobox-export --bin tmux
distrobox-export --bin yazi
distrobox-export --bin yt-dlp
distrobox-export --bin zellij
distrobox-export --bin zoxide
