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

# --- dwm ---
echo "  dwm"
mkdir -p "$HOME/.dwm"
rm -f "$HOME/.dwm/autostart.sh"
ln -s "$DOTFILES/dwm/autostart.sh" "$HOME/.dwm/autostart.sh"
# dwm source lives in ~/dwm (suckless build); link configs there
if [ -d "$HOME/dwm" ]; then
    rm -f "$HOME/dwm/config.h" "$HOME/dwm/config.def.h" "$HOME/dwm/config.mk"
    ln -s "$DOTFILES/dwm/config.h" "$HOME/dwm/config.h"
    ln -s "$DOTFILES/dwm/config.def.h" "$HOME/dwm/config.def.h"
    ln -s "$DOTFILES/dwm/config.mk" "$HOME/dwm/config.mk"
    echo "  dwm configs linked to ~/dwm (rebuild with: cd ~/dwm && sudo make clean install)"
fi

echo "done. restart your terminal or run: source ~/.zshrc"
