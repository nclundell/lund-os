setup-media:
  # Create distrobox and run media setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Media
  @distrobox enter --name Media -- bash -s < /usr/etc/distrobox/media-setup.sh

setup-gaming:
  # Create distrobox and run gaming setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Gaming
  @distrobox enter --name Gaming -- bash -s < /usr/etc/distrobox/gaming-setup.sh

setup-shell:
  # Create distrobox and run shell setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Shell
  @distrobox enter --name Shell -- bash -s < /usr/etc/distrobox/shell-setup.sh

enter-media:
  # Enter media distrobox
  @distrobox enter --name Media

enter-gaming:
  # Enter gaming distrobox
  @distrobox enter --name Gaming

enter-shell:
  # Enter shell distrobox
  @distrobox enter --name Shell
