vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.bd)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)
vim.keymap.set("n", "<leader>T", vim.cmd.term)
vim.keymap.set("n", "<leader>G", function()
  vim.cmd.terminal("lazygit")
  vim.cmd.startinsert()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_buf_is_valid(buf) then
        vim.cmd.bdelete(buf)
      end
    end,
  })
end)
