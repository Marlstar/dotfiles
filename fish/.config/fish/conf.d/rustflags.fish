set -q RUSTFLAGS || set -gx RUSTFLAGS
set -p RUSTFLAGS "-C" "link-args=--ld-path=wild" # wild linker
