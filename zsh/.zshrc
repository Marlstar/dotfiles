export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

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
