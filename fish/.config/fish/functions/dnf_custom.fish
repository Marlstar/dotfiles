# For doing --repo=copr:blah
abbr --add --position anywhere copr: copr:copr.fedorainfracloud.org:


function dnfi -d "dnf install"
	sudo dnf install $argv[1]
end
function dnfif -d "dnf install (fedora repo only)"
	sudo dnf install $argv[1] --repo=fedora
end

function dnfs -d "dnf search"
	dnf search $argv[1]
end
function dnfs -d "dnf search (fedora repo only)"
	dnf search $argv[1] --repo=fedora
end

function dnfr -d "dnf remove"
	sudo dnf remove $argv[1]
end

function dnfu -d "dnf upgrade"
	sudo dnf upgrade $argv[1]
end

function dnfl -d "dnf list"
	dnf list
end
function dnfli -d "dnf list (installed)"
	dnf list installed
end
