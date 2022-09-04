export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PNPM_HOME="$HOME/.local/share/pnpm"

typeset -U path PATH
path=(~/.local/bin ~/.cargo/bin ~/.local/share/pnpm $path)
export PATH
