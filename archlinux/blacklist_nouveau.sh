#!/bin/sh

blacklist_nouveau_file=/etc/modprobe.d/nouveau.conf
blacklist_nouveau=$(cat <<'EOF'
blacklist nouveau
EOF
)

echo "${blacklist_nouveau}" > "${blacklist_nouveau_file}"
mkinitcpio -p linux
