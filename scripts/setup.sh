#!/bin/zsh
sudo pacman -Syu --noconfirm ripgrep fzf neovim git

rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.ssh/id_rsa_github
rm -rf ~/.ssh/config
rm -rf ~/.config/alacritty/alacritty.toml

mkdir -p ~/.config
mkdir -p ~/.ssh

cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
cp -r ~/.dotfiles/nvim/ ~/.config/nvim/
cp ~/.dotfiles/ssh/config ~/.ssh/config
cp ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github
cp ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.dotfiles/zsh/.zshrc ~/.zshrc
source ~/.zshrc
chmod 600 ~/.ssh/id_rsa_github
alacritty migrate

echo "All symlinks created successfully!"
