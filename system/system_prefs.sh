#!/bin/bash
# system_prefs.sh - Script to apply system preferences

# Set computer name
sudo scutil --set ComputerName "Nate's Mac"

# Disable guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "System preferences have been applied!"
