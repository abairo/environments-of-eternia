#!/bin/bash

source ./functions.sh
source ./flatpak.sh

install_git () {
  print_installing_message "git"
  sudo dnf install git-core.aarch64 -y
}

install_codex () {
  print_installing_message "codex"
  curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh
}

install_neovim () {
  print_installing_message "neovim"
  sudo dnf install neovim.aarch64 -y
}

install_pass () {
  print_installing_message "pass"
  sudo dnf install pass -y
}

install_docker () {
  print_installing_message "docker"
  sudo dnf install moby-engine.aarch64 docker-compose -y
}

enable_docker () {
  print_installing_message "enabling docker service"
  sudo systemctl enable --now docker
}

configure_docker_group () {
  print_installing_message "configuring docker group"
  sudo usermod -aG docker "${SUDO_USER:-$USER}"
}

install_and_configure_docker () {
  install_docker
  enable_docker
  configure_docker_group
}

install_git
install_neovim
install_pass
install_and_configure_docker
flatpak_configure_flatpak_remote
