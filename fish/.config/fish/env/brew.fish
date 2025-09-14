set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"

fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin";
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;
