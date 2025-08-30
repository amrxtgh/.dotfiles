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
cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
# Remove older symlink
rm -rf ~/.config/nvim
# Neovim symlink
cp -r "$DOTFILES/nvim" "$HOME/.config/nvim"
cp ~/.dotfiles/ssh/config ~/.ssh/config
cp ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github
echo "All symlinks created successfully!"
