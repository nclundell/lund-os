setup-shell:
  # Create Shell distrobox (no install script needed - packages in base image)
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Shell

install-steam:
  # Install Steam in Shell distrobox
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-steam.sh

install-abcde:
  # Install abcde CD ripper in Shell distrobox
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-abcde.sh

install-handbrake:
  # Install HandBrake in Shell distrobox
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-handbrake.sh

install-makemkv:
  # Install MakeMKV in Shell distrobox
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-makemkv.sh

enter-shell:
  # Enter Shell distrobox
  @distrobox enter --name Shell
