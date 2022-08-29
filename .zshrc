if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# ls
alias ls="exa"
alias ll="exa -la"
alias la="exa -a"

# goodies
alias btw="fastfetch --logo redstar"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
