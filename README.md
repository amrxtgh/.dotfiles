# .dotfiles

kde-plasma + arch linux 

## what's here

- `alacritty/` — toml config + themes (previously used)
- `kitty/` — conf + themes (i use default kitten themes)
- `neovim/` — submodule → [amrxtgh/Neovim](https://github.com/amrxtgh/Neovim) (lazy.nvim, custom elflord colorscheme)
- `zsh/` — oh-my-zsh, prompt, aliases, yazi cd-on-exit
- `git/` — gitconfig
- `vicinae/` — app launcher config
- `script.sh` — one-shot setup, symlinks everything to `~/.config`

## dependencies

```bash
# arch
sudo pacman -S neovim alacritty kitty zsh git ripgrep fzf yazi fastfetch

# optional
paru -S zoxide vicinae
```

install [oh-my-zsh](https://ohmyz.sh/) before running the script:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

install zsh plugins:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

## setup

```bash
git clone --recurse-submodules https://github.com/amrxtgh/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x script.sh
./script.sh
```

restart your terminal. neovim plugins will install on first launch via lazy.nvim.

## stack

arch, hyprland, alacritty, kitty, neovim, zsh, ripgrep, fzf, zoxide, yazi, fastfetch. jetbrains mono nerd font.
