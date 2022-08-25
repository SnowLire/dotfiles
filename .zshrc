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

# ls
alias ls="ls --color=auto"
alias ll="ls -lAh"
alias la="ls -A"

# goodies
alias btw="fastfetch --logo redstar"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

eval $(starship init zsh)
