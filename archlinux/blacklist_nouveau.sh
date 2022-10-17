#!/bin/sh

set -e

# blacklist nouveau
blacklist_nouveau_src="./files/blacklist_nouveau.conf"
blacklist_nouveau_dest="/etc/modprobe.d/nouveau.conf"

mkdir -p $(dirname "$blacklist_nouveau_dest")
cp $blacklist_nouveau_src $blacklist_nouveau_dest

mkinitcpio -p linux
