#!/bin/bash
source ./functions.sh
USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

install_htop () {
  echo "Installing htop..."
  sudo zypper --no-confirm install htop
}

install_docker () {
  echo "Installing docker and docker-compose..."
  sudo zypper --non-interactive install docker docker-compose docker-compose-switch
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

install_direnv() {
  echo "Installing direnv..."
  sudo zypper --non-interactive install direnv
}

install_strawberry() {
  echo "Installing strawberry..."
  sudo zypper --non-interactive install strawberry
}

install_fd() {
  echo "Installing fd..."
  sudo zypper --non-interactive install fd
}

install_ripgrep() {
  echo "Installing ripgrep..."
  sudo zypper --non-interactive install ripgrep
}

install_compsize() {
  echo "Installing compsize..."
  sudo zypper --non-interactive install compsize
}

install_fish() {
  echo "Installing fish..."
  sudo zypper --non-interactive install fish
}

install_mkvtoolnix() {
  echo "Installing mkvtoolnix..."
  sudo zypper --non-interactive install mkvtoolnix
}

install_stow() {
  echo "Installing stow..."
  sudo zypper --non-interactive install stow
}

install_starship() {
  echo "Installing starship..."
  sudo zypper --non-interactive install starship
}



install_ffmpeg() {
  echo "Installing ffmpeg and configuring packman..."
  sudo zypper addrepo -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
  sudo zypper refresh
  sudo zypper --non-interactive dup --from packman --allow-vendor-change
  sudo zypper --non-interactive install ffmpeg
}

install_podman() {
  echo "Installing podman..."
  sudo zypper --non-interactive install podman
}

install_mediainfo() {
  echo "Installing mediainfo..."
  sudo zypper --non-interactive install mediainfo
}

install_discord() {
  echo "Installing Discord..."
  sudo zypper --non-interactive install discord
}

install_flatpak() {
  echo "Installing flatpak..."
  sudo zypper --non-interactive install flatpak
}

configure_flatpak() {
  echo "Configuring flatpak..."
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}



install_vscode () {
  echo "Installing VS Code..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
  sudo zypper refresh
  sudo zypper --non-interactive install code
}

install_virt () {
  echo "Installing virtualization tools..."
  sudo zypper --non-interactive install qemu-kvm libvirt virt-manager
  echo "Configuring virtualization..."
  sudo usermod -aG libvirt $USER
  sudo systemctl enable --now libvirtd
}

install_flutter_dart () {
  echo "Installing Flutter/Dart..."
  sudo zypper --non-interactive install wget tar xz
  mkdir -p "$USER_HOME/development"
  (
    cd "$USER_HOME/development" || exit 1
    wget -c https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.44.0-stable.tar.xz
    tar -xf flutter_linux_3.44.0-stable.tar.xz
  )
  if [ -n "$SUDO_USER" ]; then
    chown -R "$SUDO_USER:" "$USER_HOME/development"
  fi
}

install_android_studio () {
  echo "Installing Android Studio..."
  sudo zypper --non-interactive install wget tar gzip libgtk-3-0 libgthread-2_0-0
  wget -c https://edgedl.me.gvt1.com/android/studio/ide-zips/2025.3.4.7/android-studio-panda4-patch1-linux.tar.gz -P /tmp
  sudo tar -xf /tmp/android-studio-panda4-patch1-linux.tar.gz -C /opt/
  rm -f /tmp/android-studio-panda4-patch1-linux.tar.gz
}


install_htop
install_curl
install_git
install_gimp
install_asdf
configure_asdf
install_asdf_python_dependencies
install_asdf_nodejs_plugin_dependency
install_asdf_python_plugin
install_asdf_nodejs_plugin
install_nodejs_lts_asdf
install_neovim
install_pass_store
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
# DISCORD
install_discord
# FLATPAK
install_flatpak
configure_flatpak

# ADDITIONAL TOOLS
install_direnv
install_strawberry
install_fd
install_ripgrep
install_compsize
install_fish
install_mkvtoolnix
install_stow
install_starship
install_ffmpeg
install_podman
install_mediainfo
install_uv
install_virt
install_flutter_dart
install_android_studio
