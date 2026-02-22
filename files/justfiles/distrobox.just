setup-shell:
  # Create Shell distrobox and run install script
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Shell
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-shell.sh

install-shell:
  # Re-run shell install script in existing box
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/install-shell.sh

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
