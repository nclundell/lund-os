setup target:
  # Create distrobox and run setup: just setup shell|gaming|media
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name {{ target | capitalize }}
  @distrobox enter --name {{ target | capitalize }} -- bash -c 'bash /usr/etc/distrobox/{{ target }}-setup.sh; exit'

enter target:
  # Enter distrobox: just enter shell|gaming|media
  @distrobox enter --name {{ target | capitalize }}

