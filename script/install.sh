#!/bin/bash
# install.sh - A script to set up Nate's development environment

# Symlink dotfiles
ln -sf ~/development/dotfiles/zsh/zshrc ~/.zshrc

# Install Homebrew packages
brew bundle --file=~/development/dotfiles/homebrew/Brewfile

# Set up macOS preferences
bash ~/development/dotfiles/macos/macos_setup.sh

# Install Python dependencies
pip install -r ~/development/dotfiles/requirements.txt

echo "Development environment setup complete!"
