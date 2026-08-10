#!/bin/sh

set -eux

NAME=$(git log -n 1 --pretty=format:%an)
EMAIL=$(git log -n 1 --pretty=format:%ae)

git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global init.defaultBranch "main"
git config --global fetch.prune true
