-- ============================================================================
-- LEADER KEY (must be set before lazy)
-- ============================================================================
vim.g.mapleader = " "

-- ============================================================================
-- GENERAL SETTINGS
-- ============================================================================

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.smarttab = true

-- UI & Appearance
vim.opt.fillchars:append({ eob = ' ' })
vim.opt.termguicolors = true
vim.opt.list = false

-- Timing
vim.opt.updatetime = 200
vim.opt.timeoutlen = 800

-- Completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Command-line completion
vim.opt.wildmenu = true              -- Enhanced command-line completion
vim.opt.wildmode = 'longest:full,full' -- Complete longest common string, then full
vim.opt.wildoptions = 'pum'          -- Show completion in popup menu

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.keymap.set('n', '<leader>t', ':term<CR>', { noremap = true, silent = true })

-- Command-line history navigation with Up/Down arrows
vim.keymap.set('c', '<Up>', '<C-p>', { noremap = true })
vim.keymap.set('c', '<Down>', '<C-n>', { noremap = true })

-- Alternative: Use Ctrl+p/n for command history (Vim default behavior)
-- These work automatically without mapping

-- ============================================================================
-- LAZY.NVIM BOOTSTRAP
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    lazyrepo, lazypath
  })
  
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
-- ============================================================================
-- PLUGIN CONFIGURATION
-- ============================================================================
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

vim.cmd.colorscheme("tokyonight-night")
