#!/bin/zsh

echo "Starting dotfiles setup..."

# Update and install packages
echo "Installing packages..."
sudo pacman -Syu --noconfirm ripgrep fzf neovim git ttf-cascadia-mono-nerd nodejs npm python python-pip curl go rustup wmctrl

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
rm -f ~/.ssh/id_rsa_github
rm -f ~/.ssh/config

# Create necessary directories
echo "Creating directories..."
mkdir -p ~/.config/kitty
mkdir -p ~/.config/alacritty
mkdir -p ~/.ssh

# Copy configurations
echo "Copying configurations..."
[ -f ~/.dotfiles/git/.gitconfig ] && cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
# [ -d ~/.dotfiles/nvim ] && cp -r ~/.dotfiles/nvim ~/.config/
[ -f ~/.dotfiles/ssh/config ] && cp ~/.dotfiles/ssh/config ~/.ssh/config
[ -f ~/.dotfiles/ssh/id_rsa_github ] && cp ~/.dotfiles/ssh/id_rsa_github ~/.ssh/id_rsa_github
[ -d ~/.dotfiles/alacritty ] && cp -r ~/.dotfiles/alacritty/* ~/.config/alacritty/
[ -d ~/.dotfiles/kitty ] && cp -r ~/.dotfiles/kitty/* ~/.config/kitty/
[ -f ~/.dotfiles/zsh/.zshrc ] && cp ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Set SSH permissions
if [ -f ~/.ssh/id_rsa_github ]; then
    echo "Setting SSH permissions..."
    chmod 600 ~/.ssh/id_rsa_github
    chmod 700 ~/.ssh
fi

# Apply Gnome settings
if [ -f ~/.dotfiles/gnome/dconf.ini ]; then
    echo "Applying Gnome settings..."
    dconf load / < ~/.dotfiles/gnome/dconf.ini
    echo "Gnome keybindings applied! Restart gnome shell: Alt+F2 -> type 'r' -> Enter"
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

echo "✓ All configurations applied successfully!"
