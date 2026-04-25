#!/bin/bash

print_installing_message() {
    local program_name="$1"
    echo "Installing $program_name..."
}

configure_docker_group () {
  echo "Add grupo docker..."
  sudo groupadd docker
  echo "Add user $($USER) to the docker group..."
  sudo systemctl enable docker
  sudo systemctl start docker
  sudo usermod -aG docker $USER
  newgrp docker
}

install_codex_cli () {
  echo "Instalando Codex CLI..."
  npm install -g @openai/codex
}

install_gemini_cli () {
  echo "Instalando Gemini CLI..."
  npm install -g @google/gemini-cli
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