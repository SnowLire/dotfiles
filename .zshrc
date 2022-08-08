export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$PATH:$HOME/.local/bin"
export ZSH=$HOME/.oh-my-zsh

export PNPM_HOME="/home/snowlire/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

setopt autocd
setopt interactivecomments
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

COMPLETION_WAITING_DOTS="%F{blue}waiting...%"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

plugins=(
  git
  urltools
  bgnotify
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

# doas
alias sudoedit="doas rnano"

# interactive commands
alias cp="cp -i"
alias rm="rm -i"

# ls
alias ll="ls -lah"
alias la="ls -A"

# goodies
alias btw="fastfetch --logo redstar"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

eval "$(starship init zsh)"
