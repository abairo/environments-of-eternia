# Environments of Eternia

Environments of Eternia is a collection of Bash scripts designed to automate the installation and configuration of standard development environments across various Linux distributions. The project heavily prioritizes modern, sandboxed package formats like **Snap** and **Flatpak** where possible, while falling back to native package managers (APT, DNF) for system-level dependencies.

## Compatible Distributions

- [x] Debian 12
- [x] Ubuntu 22.04 / 24.04
- [x] Fedora 43

## How It Works

The project uses a unified entry point script (`gorpo_install.sh` via the *Gorpo* CLI) to detect the target operating system and execute the corresponding installation scripts (`ubuntu.sh`, `debian.sh`, or `fedora.sh`).

These scripts aggregate the installation of numerous packages and tools, categorizing them by the package manager used.

## Installed Packages & Tools

### Development Tools & Languages
- **Git** (Native)
- **Neovim** (Native / Binary via `nvim.sh`)
- **Docker & Docker Compose** (Snap/Native)
- **Pyenv** & Python dependencies (Native/Curl)
- **ASDF** Version Manager & Plugins (Node.js, Python)
- **DBeaver CE** (Snap)
- **VS Code** (Snap)

### Communication & Productivity
- **Slack** (Snap)
- **Thunderbird** (Snap)
- **Obsidian** (Snap)

### Utilities & System
- **Curl**, **Htop** (Snap)
- **Pass** (Standard Unix Password Manager, Native)
- **Pipx** (Native)
- **Spotify** (Snap)
- **Surfshark VPN** (Binary script)
- **Multipass** (Snap - Fedora)

### Gaming (Fedora specific)
- **Steam** (Snap / Flatpak)
- **Heroic Games Launcher** (Flatpak)

## Usage

To initiate the installation process, execute the `gorpo_install.sh` script, passing your OS name as an argument.

```bash
# For Ubuntu
./gorpo_install.sh ubuntu

# For Debian
./gorpo_install.sh debian

# For Fedora
./gorpo_install.sh fedora
```

## Structure

- `gorpo_install.sh`: Main entry point that routes the execution based on the OS argument.
- `ubuntu.sh` / `debian.sh` / `fedora.sh`: OS-specific installation scripts.
- `snap.sh` / `flatpak.sh`: Reusable functions for installing specific applications via Snap and Flatpak.
- `functions.sh`: Common utility functions.
- `nvim.sh`: Custom script to download and install the latest Neovim standalone binary.
