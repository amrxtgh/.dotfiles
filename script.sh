#!/bin/bash
set -e

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

echo "setting up dotfiles..."

# make sure ~/.config exists
mkdir -p "$CONFIG"

# --- alacritty ---
echo "  alacritty"
rm -rf "$CONFIG/alacritty"
ln -s "$DOTFILES/alacritty" "$CONFIG/alacritty"

# --- kitty ---
echo "  kitty"
rm -rf "$CONFIG/kitty"
ln -s "$DOTFILES/kitty" "$CONFIG/kitty"

# --- neovim (voidvim) ---
echo "  neovim"
mkdir -p "$HOME/.config/nvim"
for item in "$DOTFILES/neovim/Voidvim/"*; do
    name=$(basename "$item")
    rm -rf "$HOME/.config/nvim/$name"
    ln -s "$item" "$HOME/.config/nvim/$name"
done

# --- git ---
echo "  git"
rm -f "$HOME/.gitconfig"
ln -s "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# --- zsh ---
echo "  zsh"
rm -f "$HOME/.zshrc"
ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

# --- vicinae ---
echo "  vicinae"
rm -rf "$CONFIG/vicinae"
ln -s "$DOTFILES/vicinae" "$CONFIG/vicinae"

echo "done. restart your terminal or run: source ~/.zshrc"
