set -gx VCPKG_ROOT ~/.local/share/vcpkg

alias vcpkg=$VCPKG_ROOT/vcpkg

function vcpkg-init
    git clone https://github.com/microsoft/vcpkg --depth 1 $VCPKG_ROOT
    $VCPKG_ROOT/bootstrap-vcpkg.sh -disableMetrics
end

function vcpkg-update
    git -C $VCPKG_ROOT pull --depth 1 --rebase
    $VCPKG_ROOT/bootstrap-vcpkg.sh -disableMetrics
end

function vcpkg-clean
    git -C $VCPKG_ROOT clean -dfxf
end
