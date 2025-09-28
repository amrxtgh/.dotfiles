vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.fillchars:append({ eob = ' ' })
--identation 
vim.opt.autoindent = true  
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 2       -- Number of spaces to use for each step of indent
vim.opt.softtabstop = 2       -- Number of spaces that a tab counts for while editing
vim.opt.shiftround = true
vim.opt.smarttab = true

vim.opt.updatetime = 200      -- Faster completion (default is 4000ms)
vim.opt.timeoutlen = 800    -- Time to wait for mapped sequence
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.list = false
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors

vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = " "         -- Set space as leader key

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" }, 
  },
})
