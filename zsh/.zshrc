export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# Colours
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Prompter
eval "$(starship init zsh)"

# Programs
eval "$(zoxide init zsh)"
alias ls="eza --icons"

# Settings
# Disable beep on error
unsetopt beep

# environment
source ~/.env
. $HOME/.cargo/env # rust
