#!/bin/bash

source ./functions.sh

flatpak_configure_flatpak_remote () {
  print_installing_message "Configuring flatpak remote..."
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

flatpak_install_steam () {
  print_installing_message "steam"
  flatpak install flathub com.valvesoftware.Steam
}

flatpak_install_heroic_games () {
  print_installing_message "heroic games"
  flatpak install flathub com.heroicgameslauncher.hgl
}
