setup-media:
  # Create distrobox and run media setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Media
  @distrobox enter --name Media -- bash -c 'bash /usr/etc/distrobox/media-setup.sh; exit'

setup-gaming:
  # Create distrobox and run gaming setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Gaming
  @distrobox enter --name Gaming -- bash -c 'bash /usr/etc/distrobox/gaming-setup.sh; exit'

setup-shell:
  # Create distrobox and run shell setup
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name Shell
  @distrobox enter --name Shell -- bash -c 'bash /usr/etc/distrobox/shell-setup.sh; exit'

enter-media:
  # Enter media distrobox
  @distrobox enter --name Media

enter-gaming:
  # Enter gaming distrobox
  @distrobox enter --name Gaming

enter-shell:
  # Enter shell distrobox
  @distrobox enter --name Shell
