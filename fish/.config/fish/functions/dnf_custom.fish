# For doing --repo=copr:blah
abbr --add --position anywhere copr: copr:copr.fedorainfracloud.org:


function dnfi -d "dnf install" -w "dnf install"
	sudo dnf install $argv
end
function dnfif -d "dnf install (fedora repo only)" -w "dnf install"
	sudo dnf install $argv --repo=fedora
end

function dnfs -d "dnf search" -w "dnf search"
	dnf search $argv
end
function dnfs -d "dnf search (fedora repo only)" -w "dnf search"
	dnf search --repo=fedora $argv
end

function dnfr -d "dnf remove" -w "dnf remove"
	sudo dnf remove $argv
end

function dnfu -d "dnf upgrade" -w "dnf upgrade"
	sudo dnf upgrade $argv
end

function dnfl -d "dnf list" -w "dnf list"
	dnf list $argv
end
function dnfli -d "dnf list (installed)" -w "dnf list"
	dnf list installed
end
