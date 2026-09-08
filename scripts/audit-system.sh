#!/usr/bin/env bash

OUT_FILE="$HOME/System-Audit-Report.txt"
exec > >(tee "$OUT_FILE") 2>&1

COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_RESET="\033[0m"

header() {
    echo -e "\n${COLOR_BLUE}========================================================"
    echo -e "  $1"
    echo -e "========================================================${COLOR_RESET}"
}

header "1. MODIFIED OFFICIAL CONFIGURATION FILES (pacman -Qii)"
echo "Files manually modified after package installation:"
pacman -Qii 2>/dev/null | awk '/^MODIFIED/ {print "  -> " $2}'

header "2. UNOWNED CUSTOM FILES (/etc and /usr/local)"
find /etc /usr/local/bin /usr/local/share -type f -exec pacman -Qo {} + 2>&1 | grep "error: No package owns" | awk '{print "  [Custom File] -> " $NF}'

header "3. SYSTEMD OVERRIDES AND CUSTOM SETTINGS (systemd-delta)"
systemd-delta --type=extended,overridden,masked 2>/dev/null | head -n 30

header "4. KERNEL & HARDWARE CONFIGURATIONS"
echo -e "${COLOR_YELLOW}[/etc/modprobe.d/]:${COLOR_RESET}"
ls -la /etc/modprobe.d/ 2>/dev/null | grep -v "^total"
echo -e "${COLOR_YELLOW}[/etc/sysctl.d/]:${COLOR_RESET}"
ls -la /etc/sysctl.d/ 2>/dev/null | grep -v "^total"
echo -e "${COLOR_YELLOW}[/etc/udev/rules.d/]:${COLOR_RESET}"
ls -la /etc/udev/rules.d/ 2>/dev/null | grep -v "^total"

header "5. ENVIRONMENT VARIABLES"
if [ -f /etc/environment ]; then
    echo -e "${COLOR_YELLOW}[/etc/environment]:${COLOR_RESET}"
    cat /etc/environment
fi
if [ -d ~/.config/environment.d ]; then
    echo -e "${COLOR_YELLOW}[~/.config/environment.d/]:${COLOR_RESET}"
    head -n 20 ~/.config/environment.d/* 2>/dev/null
fi

header "6. DISK & BTRFS CONFIGURATION (/etc/fstab)"
grep -v "^#" /etc/fstab | grep -v "^$"

header "7. OTHER CUSTOM APPLICATION CONFIGURATIONS"
for app in gamemode.ini mpv/mpv.conf fastfetch easyeffects input-remapper-2 kitty alacritty; do
    if [ -e "$HOME/.config/$app" ]; then
        echo -e "  ✓ ${COLOR_GREEN}~/.config/$app${COLOR_RESET} exists."
    fi
done

header "8. ACTIVE TIMERS"
echo -e "${COLOR_YELLOW}[User Timers]:${COLOR_RESET}"
systemctl --user list-timers --no-pager 2>/dev/null | head -n 10

echo -e "\n${COLOR_GREEN}Report completed! Output saved to $OUT_FILE.${COLOR_RESET}\n"
