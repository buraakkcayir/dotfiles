# 🐧 CachyOS / Arch Linux Dotfiles & Scripts

A curated collection of my personal dotfiles, Zsh configurations, and custom automation scripts optimized for **KDE Plasma 6 (Wayland)** on **CachyOS**.

## 🛠️ Included Scripts

### 1. `audit-system.sh`
A powerful system-auditing tool for Arch-based distributions. It automatically scans and reports:
- Modified official package configurations (`pacman -Qii`).
- Unowned/custom system files in `/etc` and `/usr/local`.
- Overridden `systemd` services and masked units.
- Custom kernel module settings, sysctl, and udev rules.

### 2. `prime-java.sh`
A lightweight wrapper to force Java applications (like Minecraft) to run on the discrete NVIDIA GPU using `prime-run`.

## ⚙️ Core Configurations
- **Zsh:** Optimized `.zshrc` with `powerlevel10k` and custom aliases (including Cloudflare WARP and Docker RDP wrappers).

## 🚀 Installation
Clone the repository and symlink the files to your home directory:
```bash
git clone https://github.com/buraakkcayir/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

## 📜 License
MIT License
