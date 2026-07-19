vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon400"
vim.opt.number = false
vim.opt.relativenumber = false

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

