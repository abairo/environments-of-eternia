#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

install_git () {
  echo "Instalando git..."
  sudo apt install git -y
}

install_curl () {
  echo "Instalando curl..."
  sudo snap install curl
}

install_neovim () {
  echo "Instalando neovim..."
  sudo apt install neovim -y
}

install_docker () {
  echo "Intalando docker + docker-compose..."
  sudo snap install docker
}

configure_docker_group () {
  echo "Adiciona grupo docker..."
  sudo groupadd docker
  echo "Adiciona o user $($USER) para o grupo docker..."
  sudo usermod -aG docker $USER
}

add_extra_docker_permission () {
  echo "Adicionando permissões extras para instalações (docker) via snap"
  sudo chmod 666 /var/run/docker.sock
}

install_dbeaver () {
  echo "Instalando dbeaver..."
  sudo snap install dbeaver-ce
}

install_pyenv_dependencies () {
  echo "Instalando dependencias para pyenv..."
  sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
  liblzma-dev libnss3-tools -y
}

install_pyenv () {
  echo "Instalando pyenv..."
  curl https://pyenv.run | bash
}

configure_pyenv () {
  echo "Configurando pyenv..."
  echo "### PYENV ###" >> .bashrc
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> .bashrc
  echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc
}

install_asdf () {
  echo "Instalando asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
}

configure_asdf () {
  echo "Configurando ASDF..."
  echo "### ASDF ###" >> .bashrc
  echo ". $USER_HOME/.asdf/asdf.sh" >> .bashrc
  echo ". $USER_HOME/.asdf/completions/asdf.bash" >> .bashrc
}

install_slack () {
  echo "Instalando slack..."
  sudo snap install slack --classic
}

install_vscode () {
  echo "Instalando vscode..."
  sudo snap install code --classic
}

install_flatpak () {
  echo "Instalando flatpak..."
  sudo apt install flatpak -y
}

configure_flatpak () {
  echo "Configurando flatpak..."
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

install_thunderbird() {
  echo "Instalando thunderbird..."
  sudo snap install thunderbird
}

install_pass() {
  echo "Instalando pass..."
  sudo apt install pass -y
}

### Instala Git
install_git


### Instala curl
install_curl


### Instala neovim
install_neovim


### Instala docker + docker-compose
install_docker
### Configura grupo docker
configure_docker_group
#TODO review this level permission for snap installation
add_extra_docker_permission

### INSTALA DBEAVER
install_dbeaver

### INSTALA PYENV (client para ...)
install_pyenv_dependencies
install_pyenv
configure_pyenv


# INSTALA ASDF
install_asdf
configure_asdf


### INSTALA VSCODE 
install_vscode


### INSTALA FLATPAK
install_flatpak
configure_flatpak


### INSTALA PASS
install_pass


### INSTALA SLACK
#install_slack


### INSTALA THUNDERBIRD
#install_thunderbird
