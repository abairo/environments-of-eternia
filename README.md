# Environments of Eternia

Environments of Eternia is a collection of Bash scripts designed to automate the installation and configuration of standard development environments across various Linux distributions. The project heavily prioritizes modern, sandboxed package formats like **Snap** and **Flatpak** where possible, while falling back to native package managers (APT, DNF) for system-level dependencies.

## Compatible Distributions

- [x] Debian 12
- [x] Ubuntu 22.04 / 24.04
- [x] Fedora 43
- [ ] OpenSUSE Tumbleweed via standalone script (not wired into `gorpo_install.sh`)

## How It Works

The project uses a unified entry point script (`gorpo_install.sh` via the *Gorpo* CLI) to detect the target operating system and execute the corresponding installation scripts (`ubuntu.sh`, `debian.sh`, or `fedora.sh`).

For Debian, the flow runs both `debian.sh` and `ubuntu.sh`, so Debian reuses most of the Ubuntu installation steps plus Debian-specific setup. Fedora has its own native flow, and OpenSUSE currently lives in a separate standalone script.

These scripts aggregate the installation of packages and tools, categorizing them by the package manager used.

## Installed Packages & Tools

### Development Tools & Languages
- **Git** (Native)
- **Neovim** (Native)
- **Docker & Docker Compose** (Snap/Native, depending on distro)
- **Pyenv** & Python dependencies (Native/Curl)
- **ASDF** Version Manager & Plugins (Node.js, Python)
- **DBeaver CE** (Snap)
- **VS Code** (Snap)
- **Codex CLI**, **Gemini CLI**, **OpenCode** (OpenSUSE script)

### Communication & Productivity
- **Slack** (Snap)
- **Thunderbird** (Snap)
- **Obsidian** (Snap)

### Utilities & System
- **Curl**, **Htop** (Snap)
- **Pass** (Standard Unix Password Manager, Native)
- **Pipx** (Native)
- **Spotify** (Snap)
- **Surfshark VPN** (Debian/Ubuntu install script download)
- **Multipass** (Snap - Fedora)
- **Antigravity** (Debian/Fedora helper scripts)

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

OpenSUSE Tumbleweed currently uses a separate script:

```bash
./opensuse/tumbleweed/suse_post_install.sh
```

## Structure

- `gorpo_install.sh`: Main entry point that routes the execution based on the OS argument.
- `ubuntu.sh` / `debian.sh` / `fedora.sh`: Distribution-specific installation scripts used by the main entry point.
- `snap.sh` / `flatpak.sh`: Reusable functions for installing specific applications via Snap and Flatpak.
- `functions.sh`: Common utility functions.
- `debian/antigravity.sh` / `fedora/antigravity.sh`: Antigravity installation helpers.
- `opensuse/tumbleweed/suse_post_install.sh`: Standalone OpenSUSE Tumbleweed post-install script.
