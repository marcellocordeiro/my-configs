set -gx XDG_NINJA_ROOT ~/.local/share/xdg-ninja

alias xdg-ninja=$XDG_NINJA_ROOT/xdg-ninja

function xdg-ninja-init
    git clone https://github.com/b3nj5m1n/xdg-ninja --depth 1 $XDG_NINJA_ROOT
end

function xdg-ninja-update
    git -C $XDG_NINJA_ROOT pull --depth 1
end

function xdg-ninja-clean
    git -C $XDG_NINJA_ROOT clean -dfxf
end
