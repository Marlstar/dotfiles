if set -q __RUSTFLAGS_SET
	exit
end

set -q RUSTFLAGS || set -gx RUSTFLAGS

set -p RUSTFLAGS "-C" "link-args=--ld-path=wild" # wild linker

set -gx __RUSTFLAGS_SET
