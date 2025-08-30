#!/bin/bash
sudo pacman -Syu --noconfirm ripgrep fzf neovim git

rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.ssh/id_rsa_github
rm -rf ~/.ssh/config

mkdir -p ~/.config
mkdir -p ~/.ssh

cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
cp -r ~/.dotfiles/nvim/ ~/.config/nvim/
cp ~/.dotfiles/ssh/config ~/.ssh/config
cp ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github

chmod 600 ~/.ssh/id_rsa_github

echo "All symlinks created successfully!"
