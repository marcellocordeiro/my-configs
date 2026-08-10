if status is-interactive
    starship init fish | source
end

# Homebrew
/opt/homebrew/bin/brew shellenv | source

# Rust
source ~/.cargo/env.fish

# Custom $PATH
fish_add_path ~/.local/bin

# vcpkg
set -gx VCPKG_ROOT ~/.local/share/vcpkg

function vcpkg-init
    git clone https://github.com/microsoft/vcpkg --depth 1 $VCPKG_ROOT
end

function vcpkg-update
    git -C $VCPKG_ROOT pull --depth 1
end

function vcpkg-clean
    git -C $VCPKG_ROOT clean -dfxf
end
