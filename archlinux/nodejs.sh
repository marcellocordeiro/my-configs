#!/bin/sh

set -e

# npmrc
npmrc_src="./files/npmrc"
npmrc_dest="$HOME/.config/npm/npmrc"

mkdir -p $(dirname "$npmrc_dest")
cp $npmrc_src $npmrc_dest
