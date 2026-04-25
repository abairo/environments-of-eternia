install_opencode () {
  echo "Instalando OpenCode..."
  curl -fsSL https://opencode.ai/install | bash
}

configure_opencode () {
  echo "Configurando opencode..."
  echo "# OPENCODE" >> ~/.bashrc
  echo "export PATH=$HOME/.opencode/bin:$PATH" >> ~/.bashrc
}