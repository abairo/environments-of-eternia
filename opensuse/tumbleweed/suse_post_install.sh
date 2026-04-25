#!/bin/bash
source ./functions.sh
USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

install_htop () {
  echo "Installing htop..."
  sudo zypper --no-confirm install htop
}

install_docker () {
  echo "Installing docker..."
  sudo zypper --no-confirm install docker
}


install_docker_compose () {
  echo "Installing docker-compose..."
  sudo zypper --no-confirm install docker-compose
}

install_pyenv () {
  echo "Installing pyenv..."
  sudo zypper --non-interactive install pyenv
}

install_curl () {
  echo "Installing curl..."
  sudo zypper --non-interactive install curl
}

install_git () {
  echo "Installing git..."
  sudo zypper --non-interactive install git 
}

install_asdf () {
  echo "Installing asdf..."
  sudo zypper --non-interactive install asdf
}

install_asdf_nodejs_plugin_dependency () {
  echo "Installing libatomic1 (asdf nodejs plugin dependency)"
  sudo zypper --non-interactive install libatomic1
}

install_nodejs_lts_asdf () {
  echo "Installing nodejs LTS via asdf..."
  asdf install nodejs latest
  asdf set -u nodejs lts
}

install_asdf_nodejs_plugin () {
  echo "Installing Node.js ASDF plugin..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
}

install_asdf_python_plugin () {
  echo "Installing Python ASDF plugin..."
  asdf plugin add python https://github.com/danhper/asdf-python.git
}

configure_input_history () {
echo -E '"\e[5~": history-search-backward
"\e[6~": history-search-forward
set enable-bracketed-paste off' > ~/.inputrc
}

install_asdf_python_dependencies () {
  echo "Installing dependencies required by the ASDF Python plugin..."
  sudo zypper --non-interactive install \
  gcc make patch tar xz gzip bzip2 \
  libopenssl-devel readline-devel zlib-devel libffi-devel \
  sqlite3-devel xz-devel tk-devel gdbm-devel libuuid-devel \
  libbz2-devel ncurses-devel
}

install_neovim () {
  sudo zypper --non-interactive install neovim
}

install_cargo () {
  echo "Installing cargo..."
  sudo zypper --non-interactive install cargo
}

install_lunar_vim_dependencies () {
  echo "Installing LunarVim dependencies..."
  sudo zypper --non-interactive install pattern devel_basis
}

install_pass_store() {
  echo "Installing pass-store..."
  sudo zypper --non-interactive install password-store
}

install_gimp() {
  echo "Installing gimp..."
  sudo zypper --non-interactive install gimp
}

configure_asdf () {
  echo "Configuring ASDF..."
  echo "# ASDF" >> ~/.bashrc
  echo ". ${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH" >> ~/.bashrc
}

install_vscode () {
  echo "Installing VS Code..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
  sudo zypper refresh
  sudo zypper --non-interactive install code
}

configure_input_history
install_pyenv
install_curl
install_git
install_asdf
configure_asdf
install_asdf_python_dependencies
install_neovim
install_pass-store
# AI CLIs
install_codex_cli
install_gemini_cli
install_opencode
configure_opencode
# CODE EDITORS
install_vscode
# DOCKER
install_docker
configure_docker_group
