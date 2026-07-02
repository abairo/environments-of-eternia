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

install_stow () {
  print_installing_message "stow"
  sudo dnf install stow -y
}

install_direnv () {
  print_installing_message "direnv"
  sudo dnf install direnv -y
}

install_powertop () {
  print_installing_message "powertop"
  sudo dnf install powertop -y
}

configure_vscode_repository () {
  print_installing_message "visual studio code repository"
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  printf '%s\n' \
    '[code]' \
    'name=Visual Studio Code' \
    'baseurl=https://packages.microsoft.com/yumrepos/vscode' \
    'enabled=1' \
    'autorefresh=1' \
    'type=rpm-md' \
    'gpgcheck=1' \
    'gpgkey=https://packages.microsoft.com/keys/microsoft.asc' \
    | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
}

install_vscode () {
  print_installing_message "visual studio code"
  sudo dnf makecache -y
  sudo dnf install code -y
}

install_and_configure_vscode () {
  configure_vscode_repository
  install_vscode
}

configure_docker_repository () {
  print_installing_message "docker repository"
  sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo -y
}

install_docker () {
  print_installing_message "docker"
  sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
}

enable_docker () {
  print_installing_message "enabling docker service"
  sudo systemctl enable --now docker
}

configure_docker_group () {
  print_installing_message "configuring docker group"
  sudo usermod -aG docker "${SUDO_USER:-$USER}"
}

verify_docker_installation () {
  print_installing_message "verifying docker installation"
  sudo docker run hello-world
}

verify_docker_group () {
  print_installing_message "verifying docker group"
  newgrp docker <<EOF
docker run hello-world
EOF
}

install_and_configure_docker () {
  configure_docker_repository
  install_docker
  enable_docker
  verify_docker_installation
  configure_docker_group
  verify_docker_group
}

install_git
install_neovim
install_pass
install_stow
install_direnv
install_powertop
install_and_configure_vscode
install_and_configure_docker
flatpak_configure_flatpak_remote
