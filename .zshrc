export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$PATH:$HOME/.local/bin"

export PNPM_HOME="/home/snowlire/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

setopt autocd
setopt interactivecomments
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zshcache_time="$(date +%s%N)"

source /usr/share/doc/pkgfile/command-not-found.zsh
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

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
