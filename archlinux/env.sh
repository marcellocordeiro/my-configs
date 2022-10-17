#!/bin/sh

set -e

# env
env_src="./files/env.sh"
env_dest="$HOME/.config/plasma-workspace/env/env.sh"

mkdir -p $(dirname "$env_dest")
cp $env_src $env_dest
chmod +x $env_dest
