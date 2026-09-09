# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -r /usr/share/cachyos-zsh-config/cachyos-config.zsh ]]; then
  source /usr/share/cachyos-zsh-config/cachyos-config.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LC_MESSAGES=C.UTF-8

# Cloudflare WARP Shortcuts
alias warp-on='warp-cli connect'
alias warp-off='warp-cli disconnect'
alias warp-st='warp-cli status'
win-stop() {
  if command -v docker >/dev/null 2>&1 && docker container inspect WinBoat >/dev/null 2>&1; then
    docker stop WinBoat >/dev/null || return
    echo 'Windows (WinBoat) has been successfully stopped.'
  else
    echo 'The WinBoat container is not available.' >&2
    return 1
  fi
}
