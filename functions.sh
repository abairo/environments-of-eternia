#!/bin/bash

print_installing_message() {
    local program_name="$1"
    echo "Installing $program_name..."
}

configure_docker_group () {
  echo "Adding docker group..."
  sudo groupadd docker
  echo "Adding user $USER to the docker group..."
  sudo systemctl enable docker
  sudo systemctl start docker
  sudo usermod -aG docker $USER
  newgrp docker
}

install_codex_cli () {
  echo "Installing Codex CLI..."
  npm install -g @openai/codex
}

install_gemini_cli () {
  echo "Installing Gemini CLI..."
  npm install -g @google/gemini-cli
}

install_opencode () {
  echo "Installing OpenCode..."
  curl -fsSL https://opencode.ai/install | bash
}

configure_opencode () {
  echo "Configuring OpenCode..."
  echo "# OPENCODE" >> ~/.bashrc
  echo "export PATH=$HOME/.opencode/bin:$PATH" >> ~/.bashrc
}

install_uv () {
  print_installing_message "uv"
  curl -LsSf https://astral.sh/uv/install.sh | sh
}
