return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false, 

    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, 
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = { padding = 1, indent_size = 2 },
          icon = { folder_closed = "", folder_open = "", folder_empty = "" },
        },
        filesystem = {
          filtered_items = {
            visible = true,         -- show filtered items
            hide_dotfiles = false,  -- show dotfiles
            hide_gitignored = false,-- show gitignored files
            hide_by_name = {},      -- do not hide any specific files
            hide_by_pattern = {},   -- do not hide by pattern
          },
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      })

      -- Keymaps for Neo-tree
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<leader>nt",  ":Neotree toggle<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ntl", ":Neotree reveal left<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ntr", ":Neotree reveal right<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ntt", ":Neotree reveal top<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ntb", ":Neotree reveal bottom<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ntc", ":Neotree close<CR>", opts)
    end,
  }
}

