# Dedupe new entries from $PATH
typeset -U path

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust
. "$HOME/.cargo/env"

# vcpkg
export VCPKG_ROOT=~/.local/share/vcpkg
path=($VCPKG_ROOT $path)

path=(~/.local/bin $path)

export PATH
