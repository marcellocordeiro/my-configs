#!/bin/sh

set -eu

if [[ "${1:-}" == "--reset" ]]; then
    defaults write com.apple.finder ShowPathbar -bool false
    defaults delete com.apple.finder AppleShowAllFiles

    defaults write com.apple.dock tilesize -int 48

    defaults delete NSGlobalDomain AppleShowAllExtensions
else
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder AppleShowAllFiles -bool true

    defaults write com.apple.dock tilesize -int 38

    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

killall Finder
killall Dock
