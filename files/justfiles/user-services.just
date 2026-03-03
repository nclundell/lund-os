# User services management

enable-mpd:
  systemctl --user enable --now mpd.service
  systemctl --user enable --now mpDris2.service

disable-mpd:
  systemctl --user disable --now mpd.service
  systemctl --user disable --now mpDris2.service
