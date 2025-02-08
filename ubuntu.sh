#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

install_git () {
  echo "Installing git..."
  sudo apt install git -y
}

install_curl () {
  echo "Installing curl..."
  sudo snap install curl
}

install_neovim () {
  echo "Installing neovim..."
  sudo apt install neovim -y
}

install_docker () {
  echo "Installing docker + docker-compose..."
  sudo snap install docker
}

configure_docker_group () {
  echo "Add grupo docker..."
  sudo groupadd docker
  echo "Add user $($USER) to the docker group..."
  sudo usermod -aG docker $USER
}


install_dbeaver () {
  echo "Installing dbeaver..."
  sudo snap install dbeaver-ce
}

install_pyenv_dependencies () {
  echo "Installing pyenv dependencies..."
  sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
  liblzma-dev libnss3-tools -y
}

install_pyenv () {
  echo "Installing pyenv..."
  curl https://pyenv.run | bash
}

configure_pyenv () {
  echo "Configuring pyenv..."
  echo "### PYENV ###" >> .bashrc
  echo 'export PATH="$USER_HOME/.pyenv/bin:$PATH"' >> .bashrc
  echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc
}

install_asdf () {
  echo "Installing and configuring ASDF..."
  sudo apt install curl git
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
  echo "### ASDF ###" >> ~/.bashrc
  echo ". '$USER_HOME/.asdf/asdf.sh'" >> ~/.bashrc
  echo ". '$USER_HOME/.asdf/completions/asdf.bash'"
}

install_asdf_plugin_dependencies () {
  echo "Intalling ASDF plugin dependencies..."
  install_curl
  sudo apt-get install dirmngr gpg gawk
}

install_asdf_nodejs_plugin () {
  echo "Installing ASDF NODEJS plugin..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
}

install_asdf_python_plugin () {
  echo "Installing ASDF PYTHON plugin..."
  asdf plugin-add python
}

install_slack () {
  echo "Installing slack..."
  sudo snap install slack --classic
}

install_vscode () {
  echo "Installing vscode..."
  sudo snap install code --classic
}

install_flatpak () {
  echo "Installing flatpak..."
  sudo apt install flatpak -y
}

configure_flatpak () {
  echo "Configurando flatpak..."
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

install_thunderbird() {
  echo "Installing thunderbird..."
  sudo snap install thunderbird
}

install_pass() {
  echo "Installing PASS..."
  sudo apt install pass -y
}


install_snap () {
  echo "Installing SNAP..."
  sudo apt install snapd
}

install_obsidian () {
  echo "Installing Obsidian..."
  sudo snap install obsidian --classic
}

install_pipx () {
  echo "Installing PIPX..."
  sudo apt install pipx
}

install_spotify () {
  echo "Installing Spotify..."
  sudo snap install spotify
}

install_htop () {
  echo "Installing Htop..."
  sudo snap install htop
}

install_surfshark () {
  echo "Installing Surfshark..."
  sudo curl -f https://downloads.surfshark.com/linux/debian-install.sh --output surfshark-install.sh
}


### INSTALL snap
install_snap
### INSTALL Git
install_git
### INSTALL curl
install_curl
### INSTALL neovim
install_neovim
### INSTALL docker + docker-compose
install_docker
### Configura grupo docker
configure_docker_group
### INSTALL DBEAVER
install_dbeaver
### INSTALL PYENV (client para ...)
install_pyenv_dependencies
install_pyenv
configure_pyenv
# INSTALL ASDF
install_asdf
### INSTALL VSCODE
install_vscode
### INSTALL FLATPAK
install_flatpak
configure_flatpak
### INSTALL PASS
install_pass
### INSTALL SLACK
install_slack
### INSTALL THUNDERBIRD
install_thunderbird
### INSTALL OBSIDIAN
install_obsidian
### INSTALL SPOTIFY
install_spotify
### INSTALL HTOP
install_htop
### INSTALL SURFSHARK
install_surfshark