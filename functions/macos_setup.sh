#!/bin/bash
# macos_setup.sh - Set up macOS system preferences

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Restart Finder to apply changes
killall Finder
