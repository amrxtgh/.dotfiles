return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      direction = "horizontal",
      open_mapping = [[<C-\>]],
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = { border = "curved" },
    })

    vim.keymap.set("n", "<leader>G", function() lazygit:toggle() end, { noremap = true, silent = true })
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
}
