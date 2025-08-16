set -q RUSTFLAGS || set -gx RUSTFLAGS
set -a RUSTFLAGS "-C" "link-args=--ld-path=wild" # wild linker
