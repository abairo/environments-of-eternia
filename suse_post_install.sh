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


configure_docker () {
  echo "Configurando docker..."
  sudo systemctl enable docker
  sudo systemctl start docker
  sudo usermod -aG docker "$SUDO_USER"
  newgrp docker
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

install_asdf () {
  echo "Instalando asdf..."
  sudo zypper --non-interactive install asdf
}

install_asdf_nodejs_plugin_dependency () {
  echo "Instalando libatomic1 (asdf nodejs plugin dependência)"
  sudo zypper --non-interactive install libatomic1
}

install_asdf_nodejs_plugin () {
  echo "Instalando nodejs asdf plugin..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
}

install_asdf_python_plugin () {
  echo "Instalando python asdf plugin..."
  asdf plugin add python https://github.com/danhper/asdf-python.git
}

configure_input_history () {
echo -E '"\e[5~": history-search-backward
"\e[6~": history-search-forward
set enable-bracketed-paste off' > ~/.inputrc
}

install_asdf_python_dependencies () {
  echo "Instalando dependências para instalar versões python através do asdf python plugin..."
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
  echo "Instalando cargo..."
  sudo zypper --non-interactive install cargo
}

install_lunar_vim_dependencies () {
  echo "Instalando lunar vim dependencies..."
  sudo zypper --non-interactive install pattern devel_basis
}

install_pass_store() {
  echo "Instalando pass-store..."
  sudo zypper --non-interactive install password-store
}

install_gimp() {
  echo "Instalando gimp..."
  sudo zypper --non-interactive install gimp
}

install_opencode () {
  echo "Instalando OpenCode..."
  curl -fsSL https://opencode.ai/install | bash
}

configure_opencode () {
  echo "Configurando opencode..."
  echo "# OPENCODE" >> ~/.bashrc
  echo "export PATH=$HOME/.opencode/bin:$PATH" >> ~/.bashrc
}

configure_asdf () {
  echo "Configurando asdf..."
  echo "# ASDF" >> ~/.bashrc
  echo ". ${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH" >> ~/.bashrc
}

install_codex_cli () {
  echo "Instalando Codex CLI..."
  npm i -g @openai/codex
}

install_gemini_cli () {
  echo "Instalando Gemini CLI..."
  npm install -g @google/gemini-cli
}

install_vscode () {
  echo "Instalando vscode..."
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
install_opencode
configure_opencode
install_codex_cli
install_gemini_cli
install_vscode