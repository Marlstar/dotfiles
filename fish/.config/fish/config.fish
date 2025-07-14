set fish_greeting # Don't show the greeting message

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/themes/tokyonight_moon.fish

starship init fish | source # Shell prompt
zoxide init fish | source # Zoxide
alias ls="eza --icons -a --group-directories-first" # Eza
source ~/.config/fish/functions/dnf_custom.fish

source ~/.config/fish/abbr/*
