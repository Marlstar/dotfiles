export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# Colours
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	# zsh-autocomplete
	# zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# autocomplete settings
# minimum amount of characters before autocompletion shows
zstyle ':autocomplete:*' min-input 1
# how long without input before autocompletion shows
zstyle ':autocomplete:*' delay 0
# how many lines the history search shows
zstyle ':autocomplete:history-search-backward:*' list-lines 10

# Prompter
eval "$(starship init zsh)"

# Programs
eval "$(zoxide init zsh)"
alias ls="eza -a --icons"
eval "$(rbw gen-completions zsh)"
# throws an error: "_arguments:comparguments:327: can only be called from completion function"
# eval "$(zellij setup --generate-completion zsh)"

# Settings
# Disable beep on error
unsetopt beep

# environment
source ~/.env
. $HOME/.cargo/env # rust

# Custom aliases
source ~/utils.zsh

# pnpm
export PNPM_HOME="/home/themarlstar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export TYPST_INSTALL="/home/themarlstar/.typst"
export PATH="$TYPST_INSTALL/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
