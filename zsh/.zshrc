export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

export EDITOR=nvim

# Colours
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


plugins=(
	git
	zsh-autosuggestions
	fast-syntax-highlighting
	rust
)

source $ZSH/oh-my-zsh.sh

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

export GPG_TTY=$(tty)
