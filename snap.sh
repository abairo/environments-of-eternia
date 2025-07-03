#!/bin/bash

source ./functions.sh

snap_install_curl () {
  print_installing_message "curl"
  sudo snap install curl
}

snap_install_dbeaver () {
  print_installing_message "dbeaver"
  sudo snap install dbeaver-ce
}

snap_install_slack () {
  print_installing_message "slack"
  sudo snap install slack --classic
}

snap_install_vscode () {
  print_installing_message "vscode"
  sudo snap install code --classic
}

snap_install_thunderbird() {
  print_installing_message "thunderbird"
  sudo snap install thunderbird
}

snap_install_obsidian () {
  print_installing_message "obsidian"
  sudo snap install obsidian --classic
}

snap_install_spotify () {
  print_installing_message "spotify"
  sudo snap install spotify
}

snap_install_htop () {
  print_installing_message "htop"
  sudo snap install htop
}

snap_install_steam () {
  print_installing_message "steam"
  sudo snap install steam
}

snap_install_multipass () {
  print_installing_message "multipass"
  sudo snap install multipass
}
