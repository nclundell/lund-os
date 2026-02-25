setup-arch:
  # Create arch distrobox
  @distrobox-assemble create --file /usr/etc/distrobox/distrobox.ini --name arch

install-steam:
  # Install Steam in arch distrobox
  @distrobox enter --name arch -- bash -s < /usr/etc/distrobox/install-steam.sh

install-abcde:
  # Install abcde CD ripper in arch distrobox
  @distrobox enter --name arch -- bash -s < /usr/etc/distrobox/install-abcde.sh

install-handbrake:
  # Install HandBrake in arch distrobox
  @distrobox enter --name arch -- bash -s < /usr/etc/distrobox/install-handbrake.sh

install-makemkv:
  # Install MakeMKV in arch distrobox
  @distrobox enter --name arch -- bash -s < /usr/etc/distrobox/install-makemkv.sh
