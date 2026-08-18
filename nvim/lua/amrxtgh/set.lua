vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon400"
vim.cmd.highlight("Cursor guifg=#191724 guibg=#eb6f92")
vim.cmd.highlight("CursorInsert guifg=#191724 guibg=#eb6f92")
vim.cmd.highlight("CursorReplace guifg=#191724 guibg=#eb6f92")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
-- vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "1200"

vim.opt.wildmode = "longest:full"
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.ruler = true

if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_opacity = 1.0
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_length = 0.3
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = ""

  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, opts)

  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end, opts)

  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, opts)
end

