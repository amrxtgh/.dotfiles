#!/bin/bash
# Purpose: Create symlinks for dotfiles (Neovim, etc.)

#Update packages
echo "Update system package"
sudo pacman -Syu --noconfirm ripgrep fzf neovim git


# Dotfiles location
DOTFILES="$HOME/.dotfiles"

# Ensure config directory exists
mkdir -p "$HOME/.config"
mkdir -p ~/.ssh

rm -rf ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Remove older symlink
rm -rf ~/.config/nvim
# Neovim symlink
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

ln -sf ~/.dotfiles/ssh/config ~/.ssh/config
ln -sf ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github

echo "All symlinks created successfully!"

