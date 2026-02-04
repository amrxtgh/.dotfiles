#!/bin/zsh

echo "Starting dotfiles setup..."

# Update and install packages
echo "Installing packages..."
sudo pacman -Syu --noconfirm --needed ripgrep fzf git ttf-cascadia-mono-nerd nodejs npm python python-pip curl go rustup wmctrl zoxide
# neovim commented out - using NvChad instead
# sudo pacman -S --noconfirm neovim

# Install yay if not present
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
fi

# Remove old configs
echo "Removing old configurations..."
rm -f ~/.gitconfig
rm -f ~/.zshrc
#rm -rf ~/.config/nvim
rm -rf ~/.config/kitty
rm -rf ~/.config/alacritty
rm -rf ~/.config/hypr
rm -rf ~/.config/niri
rm -rf ~/.config/waybar
rm -rf ~/.config/vicinae
rm -f ~/.ssh/id_rsa_github
rm -f ~/.ssh/config

# Create necessary directories
echo "Creating directories..."
mkdir -p ~/.config/kitty
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/hypr
mkdir -p ~/.config/niri
mkdir -p ~/.config/waybar
mkdir -p ~/.config/vicinae
mkdir -p ~/.ssh

# Copy configurations
echo "Copying configurations..."
[ -f ~/.dotfiles/git/.gitconfig ] && cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
# [ -d ~/.dotfiles/nvim ] && cp -r ~/.dotfiles/nvim ~/.config/
[ -f ~/.dotfiles/ssh/config ] && cp ~/.dotfiles/ssh/config ~/.ssh/config
[ -f ~/.dotfiles/ssh/id_rsa_github ] && cp ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github
[ -d ~/.dotfiles/alacritty ] && cp -r ~/.dotfiles/alacritty/* ~/.config/alacritty/
[ -d ~/.dotfiles/kitty ] && cp -r ~/.dotfiles/kitty/* ~/.config/kitty/
[ -d ~/.dotfiles/hypr ] && cp -r ~/.dotfiles/hypr/* ~/.config/hypr/
[ -d ~/.dotfiles/niri ] && cp -r ~/.dotfiles/niri/* ~/.config/niri/
[ -d ~/.dotfiles/waybar ] && cp -r ~/.dotfiles/waybar/* ~/.config/waybar/
[ -d ~/.dotfiles/waybar ] && command -v waybar >/dev/null 2>&1 && { pkill waybar 2>/dev/null || true; waybar & }
[ -d ~/.dotfiles/vicinae ] && cp -r ~/.dotfiles/vicinae/* ~/.config/vicinae/
[ -f ~/.dotfiles/zsh/.zshrc ] && cp ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Set SSH permissions
if [ -f ~/.ssh/id_rsa_github ]; then
    echo "Setting SSH permissions..."
    chmod 600 ~/.ssh/id_rsa_github
    chmod 700 ~/.ssh
fi

# Migrate Alacritty config
if command -v alacritty &> /dev/null; then
    echo "Migrating Alacritty config..."
    alacritty migrate 2>/dev/null || true
fi

# Reload zsh
if [ -f ~/.zshrc ]; then
    echo "Reloading zsh config..."
    source ~/.zshrc
fi

echo "All configurations applied successfully!"
