#!/bin/bash

source ./functions.sh
source ./snap.sh
source ./flatpak.sh

install_git () {
  print_installing_message "git"
  sudo dnf install git-core -y
}

install_neovim () {
  print_installing_message "neovim"
  sudo dnf install neovim.x86_64 -y
}

install_snapd () {
  print_installing_message "snapd"
  sudo dnf install snapd.x86_64 --setopt=install_weak_deps=False
}

enable_classic_snap_support () {
  print_installing_message "enabling classic snap support..."
  sudo ln -s /var/lib/snapd/snap /snap
}

install_pass () {
  print_installing_message "pass"
  sudo dnf install pass
}

configure_docker_repository () {
  echo "Configuring the docker RPM Repository..."
  sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
}

install_docker () {
  print_installing_message "docker"
  sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

enable_docker () {
  echo "Enabling the docker service..."
  sudo systemctl enable --now docker
}

install_and_configure_docker () {
  configure_docker_repository
  install_docker
  enable_docker
}

install_snapd
enable_classic_snap_support
install_git
install_neovim
install_pass
install_and_configure_docker
snap_install_curl
snap_install_dbeaver
snap_install_slack
snap_install_vscode
snap_install_thunderbird
snap_install_obsidian
snap_install_spotify
snap_install_htop
snap_install_steam
snap_install_multipass
flatpak_configure_flatpak_remote
flatpak_install_steam
flatpak_install_heroic_games
