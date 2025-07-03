#!/bin/bash

print_installing_message() {
    local program_name="$1"
    echo "Installing $program_name..."
}

configure_docker_group () {
  echo "Add grupo docker..."
  sudo groupadd docker
  echo "Add user $($USER) to the docker group..."
  sudo usermod -aG docker $USER
}