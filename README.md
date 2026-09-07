# dotfiles

hyprland + alacritty + kitty + neovim + zsh on arch

## what's here

- `alacritty/` — toml config + themes (lovely, matte-black, catppuccin, tokyonight)
- `kitty/` — conf + themes (hackerman, lovely)
- `neovim/` — submodule → [amrxtgh/Neovim](https://github.com/amrxtgh/Neovim) (lazy.nvim, custom elflord colorscheme)
- `zsh/` — oh-my-zsh, prompt, aliases, yazi cd-on-exit
- `git/` — gitconfig
- `vicinae/` — app launcher config
- `script.sh` — one-shot setup, symlinks everything to the right place

## setup

```bash
git clone --recurse-submodules <this-repo> ~/.dotfiles
cd ~/.dotfiles
./script.sh
```

done. restart your terminal.

## stack

arch, hyprland, alacritty, kitty, neovim, zsh, ripgrep, fzf, zoxide, yazi, fastfetch. jetbrains mono nerd font.
