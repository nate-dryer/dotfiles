#!/bin/bash
# example_script.sh - A simple script to update all homebrew packages and clean up

echo "Updating Homebrew..."
brew update
brew upgrade

echo "Cleaning up..."
brew cleanup

echo "All done!"
