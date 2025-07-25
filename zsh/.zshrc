export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

export EDITOR=nvim

# Colours
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


plugins=(
	# ZSH core stuff
	zsh-autosuggestions
	fast-syntax-highlighting
	# Program plugins
	git
	gitfast # faster git completion & completion descriptions
	git-commit # aliases for conventional commit messages
	gh
	github # more github stuff
	starship
	zoxide
	tmux
	rbw
	eza
	rust # for cargo/rustc/rustup
	brew
	gpg-agent # auto-starts gpg-agent
	fzf
	pip
	rclone

	# System commands
	dnf
	systemd
	yum

	# Useful commands
	aliases # sorted listing of aliases

	# Useful functionality
	fancy-ctrl-z # Focus background jobs with Ctrl+z again
	history-substring-search # cyle history with any part of commands
	sudo # press esc twice to prefix with sudo
	zsh-interactive-cd # use fzf for cd completion

	# Automatic stuff
	dotenv # autload .env when cd'ing into a dir

	# Other
	colored-man-pages
)
source $ZSH/oh-my-zsh.sh

# Misc custom aliases
alias hce="hyprctl dispatch exec"
alias :q="exit"
alias lsg="ls | rg"

# Custom dnf aliases
alias dnfif="sudo dnf install --repo=fedora"
alias dnfsf="sudo dnf search --repo=fedora"

# Plugin configs
# eza
zstyle ":omz:plugins:eza" "dirs-first" yes
zstyle ":omz:plugins:eza" "icons" yes
zstyle ":omz:plugins:eza" "show-group" no 
alias ls="eza --icons -a --group-directories-first"

# Settings
# Disable beep on error
unsetopt beep

# environment
source ~/.env
. $HOME/.cargo/env # rust
export PATH=$PATH:$(go env GOPATH)/bin # binaries from 'go install'

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

# Use neovim as a manpager
export MANPAGER="nvim +Man!"

# Commit, tag, and push for dist releases
cargo_release() { gc -m "build(release): v$1" && git tag "v$1"; }

function tas() {
	tmux attach -t $(tmux ls | awk '{print $1}' | sed 's/://' | fzf)
}

# Make chafa work with tmux without having to manually specify flags
alias chafa="chafa -f kitty --passthrough tmux"

export GPG_TTY=$(tty)

# Use fish
if [[ -o interactive ]] && [[ "$SHLVL" -eq 1 ]]; then
  exec fish
fi
if [[ -o interactive ]] && [[ "$SHLVL" -eq 2 ]] && [[ "$INSIDE_NEOVIM_FISH" -eq 1 ]]; then
	exec fish
fi
