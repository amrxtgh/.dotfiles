#!/bin/bash
# Purpose: Create symlinks for dotfiles (Neovim, etc.)

#Update packages
echo "Update system package"
sudo pacman -Syu --noconfirm ripgrep fzf neovim git


# Dotfiles location
DOTFILES="$HOME/.dotfiles"

# Ensure config directory exists
mkdir -p "$HOME/.config"

# Neovim symlink
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"


echo "All symlinks created successfully!"

