create-arch-box:
  @if ! distrobox list | grep -q ' Arch '; then \
      distrobox create --name Arch; \
  else \
      echo "Arch container already exists."; \
  fi

create-gaming-box:
  @if ! distrobox list | grep -q ' Gaming '; then \
      distrobox create --name Gaming; \
  else \
      echo "Gaming container already exists."; \
  fi

create-media-box:
  @if ! distrobox list | grep -q ' Media '; then \
      distrobox create --name Media; \
  else \
      echo "Media container already exists."; \
  fi

