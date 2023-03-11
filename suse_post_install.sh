#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

install_htop () {
  echo "Instalando htop..."
  sudo zypper --no-confirm install htop
}

install_docker () {
  echo "instalando docker..."
  sudo zypper --no-confirm install docker
}


install_docker_compose () {
  echo "instalando docker-compose..."
  sudo zypper --no-confirm install docker-compose
}

install_pyenv () {
  echo "instalando pyenv..."
  sudo zypper --non-interactive install pyenv
}

install_curl () {
  echo "instalando curl..."
  sudo zypper --non-interactive install curl
}

install_git () {
  echo "instalando git..."
  sudo zypper --non-interactive install git 
}

configure_asdf () {
  echo "configurando asdf..."
  echo '. "$HOME/.asdf/asdf.sh"' >> .bashrc
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> .bashrc
}

install_asdf () {
  echo "instalando asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2
  configure_asdf
}

configure_input_history () {
echo -E '"\e[5~": history-search-backward
"\e[6~": history-search-forward
set enable-bracketed-paste off' > ~/.inputrc
}

install_asdf_python_dependencies () {
  echo "Instalando dependências para instalar versões python através do asdf python plugin..."
  sudo zypper --non-interactive install gcc make zlib-devel libbz2-devel libncurses6 libopenssl-devel
}

install_neovim () {
  sudo zypper --non-interactive install neovim
}

install_cargo () {
  echo "Instalando cargo..."
  sudo zypper --non-interactive install cargo
}

install_lunar_vim_dependencies () {
  echo "Instalando lunar vim dependencies..."
  sudo zypper --non-interactive install pattern devel_basis
}

install_pass-store() {
  echo "Instalando pass-store..."
  sudo zypper --non-interactive install password-store
}

install_spotify () {
  echo "Instalando spotify..."
  sudo snap install spotify
}

configure_input_history
install_pyenv
install_curl
install_git
install_asdf
install_asdf_python_dependencies
install_neovim
install_pass-store
install_spotify
