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
- **KDE Plasma 6:** Global shortcuts (`kglobalshortcutsrc`), KWin window rules (`kwinrulesrc`), and custom autostart desktop entries.
- **Konsole:** Main configuration (`konsolerc`), custom profiles, and `MaterialYou` color schemes.

## 🚀 Installation
Clone the repository and automatically symlink the files to your home directory:

```bash
# 1. Clone the repository
git clone https://github.com/buraakkcayir/dotfiles.git ~/dotfiles

# 2. Symlink Zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# 3. Symlink KDE & Konsole configs
ln -sf ~/dotfiles/kwinrulesrc ~/.config/kwinrulesrc
ln -sf ~/dotfiles/kglobalshortcutsrc ~/.config/kglobalshortcutsrc
ln -sf ~/dotfiles/konsolerc ~/.config/konsolerc

# 4. Symlink Folders (Konsole Profiles & Autostart Apps)
mkdir -p ~/.local/share/konsole ~/.config/autostart
ln -sf ~/dotfiles/konsole/* ~/.local/share/konsole/
ln -sf ~/dotfiles/autostart/* ~/.config/autostart/
```

## 📜 License
MIT License
