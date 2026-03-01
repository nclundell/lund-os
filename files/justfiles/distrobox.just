install-steam:
  # Install Steam and gaming tools (Gamemode, Gamescope, Mangohud, etc.)
  @distrobox list | grep -q gaming-toolbox || distrobox create --name gaming-toolbox --image ghcr.io/ublue-os/arch-toolbox:latest
  @distrobox enter --name gaming-toolbox -- bash -s < /usr/etc/distrobox/install-steam.sh; exit

install-video-tools:
  # Install video tools (MakeMKV, HandBrake, etc)
  @distrobox list | grep -q media-toolbox || distrobox create --name media-toolbox --image ghcr.io/ublue-os/fedora-toolbox:latest
  @distrobox enter --name media-toolbox -- bash -s < /usr/etc/distrobox/install-video-tools.sh; exit
