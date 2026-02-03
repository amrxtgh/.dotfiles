# Dotfiles

Personal configuration files for my Linux setup.

## Required Packages

### Window Managers & Desktop
```bash
# Install one of these compositors:
sudo pacman -S hyprlock    # Hyprland with lock screen
sudo pacman -S niri                 # Niri scrollable-tiling compositor

# Status bar and launcher
sudo pacman -S waybar vicinae
```

### Core Tools (already in setup.sh)
```bash
ripgrep fzf git ttf-cascadia-mono-nerd nodejs npm 
python python-pip curl go rustup wmctrl zoxide
```

### Optional
```bash
# Neovim is commented out in setup.sh - using NvChad instead
# yay -S neovim
```

## Installation

```bash
cd ~/.dotfiles
./scripts/setup.sh
```

## Configs Included
- **hypr/** - Hyprland window manager configs
- **niri/** - Niri compositor configs  
- **waybar/** - Status bar configs
- **vicinae/** - Application launcher config
- **alacritty/** - Terminal emulator configs
- **kitty/** - Terminal emulator configs
- **nvim/** - Neovim configs (commented out in setup)
- **zsh/** - Shell configs
- **git/** - Git configuration
- **ssh/** - SSH keys and config

