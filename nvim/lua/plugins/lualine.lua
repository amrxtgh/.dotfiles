-- ============================================================================
-- LUALINE CONFIGURATION
-- ============================================================================
-- Minimal, clean statusline with essential information only

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Adapts to your colorscheme
        icons_enabled = true,
        component_separators = "",
        section_separators = "",
        globalstatus = true, -- Single statusline for all windows
        refresh = {
          statusline = 1000,
        },
      },
      
      sections = {
        -- Left side
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1) -- Show only first letter (N, I, V, etc.)
            end,
          },
        },
        lualine_b = {
          "branch",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- Relative path
            symbols = {
              modified = "●",
              readonly = "",
              unnamed = "[No Name]",
            },
          },
        },
        
        -- Right side
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          "filetype",
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
        },
      },
      
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },
      
      extensions = {
        "neo-tree",
        "lazy",
        "mason",
        "quickfix",
      },
    })
  end,
}
