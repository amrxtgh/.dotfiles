#!/bin/zsh
sudo pacman -Syu --noconfirm ripgrep fzf neovim git

rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.ssh/id_rsa_github
rm -rf ~/.ssh/config
rm -rf ~/.config/alacritty/alacritty.toml

mkdir -p ~/.config
mkdir -p ~/.ssh
mkdir -p ~/.config/alacritty

cp -r ~/.dotfiles/git/.gitconfig ~/.gitconfig
cp -r ~/.dotfiles/nvim/ ~/.config/nvim/
cp -r ~/.dotfiles/ssh/config ~/.ssh/config
cp -r ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github
cp -r ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp -r ~/.dotfiles/zsh/.zshrc ~/.zshrc
source ~/.zshrc
chmod 600 ~/.ssh/id_rsa_github
alacritty migrate

echo "All symlinks created successfully!"
