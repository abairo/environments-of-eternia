#!/bin/bash

ensure_prerequisites() {
  if ! command -v curl >/dev/null 2>&1 || ! command -v gpg >/dev/null 2>&1; then
    echo "Installing required dependencies (curl, gnupg)..."
    sudo apt update
    sudo apt install -y curl gnupg
  fi
}

install_antigravity() {
  echo "Installing antigravity..."
  ensure_prerequisites
  sudo tee /etc/yum.repos.d/antigravity.repo << EOL
  [antigravity-rpm]
  name=Antigravity RPM Repository
  baseurl=https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm
  enabled=1
  gpgcheck=0
  EOL
  sudo dnf makecache
  sudo dnf install antigravity
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_antigravity
fi
