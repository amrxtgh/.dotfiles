return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "Mofiqul/dracula.nvim"  -- Just install dracula, don't apply it
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula",     -- Use dracula theme ONLY for lualine
          section_separators = "",
          component_separators = "",
          icons_enabled = true,
        },
        sections = {
          lualine_a = {},
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "diagnostics", "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
        extensions = { "neo-tree", "fugitive", "quickfix", "toggleterm" },
      })
    end,
  },
}
