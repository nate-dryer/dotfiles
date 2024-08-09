#!/bin/bash
# install.sh - A script to set up Nate's development environment

# Symlink dotfiles
ln -sf ~/development/dotfiles/.zshrc ~/.zshrc

# Install Homebrew packages
brew bundle --file=~/development/dotfiles/homebrew/Brewfile

# Set up macOS preferences
bash ~/development/dotfiles/macos/macos_setup.sh

# Install Python dependencies
pip install -r ~/development/dotfiles/requirements.txt

echo "Development environment setup complete!"

# List of changes made:
# 1. Fixed the symlink to point to the correct ~/.zshrc file.
# 2. Updated the path to ~/development/dotfiles/.zshrc.
# 3. Listed all changes and included explanation for each change step by step.
