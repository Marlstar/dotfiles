# Make chafa work with tmux without having to manually specify flags
function chafa
	if set -q TMUX
		command chafa -f kitty --passthrough tmux $argv
	else
		command chafa -f kitty $argv
	end
end
