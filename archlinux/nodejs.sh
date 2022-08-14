#!/bin/sh

npmrc_file=~/.config/npm/npmrc
npmrc=$(cat <<'EOF'
fund=false
audit=false
prefix=${HOME}/.local
cache=${HOME}/.cache/npm

# pnpm
global-bin-dir=${HOME}/.local/bin
EOF
)

echo "${npmrc}" > "${npmrc_file}"
chmod +x "${npmrc_file}"
