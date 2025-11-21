-- ============================================================================
-- COLORSCHEME CONFIGURATION
-- ============================================================================
-- Multiple colorschemes with easy switching

return {
  -- ==========================================================================
  -- TOKYONIGHT
  -- ==========================================================================
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
    end,
  },

  -- ==========================================================================
  -- CATPPUCCIN
  -- ==========================================================================
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
      })
    end,
  },

  -- ==========================================================================
  -- GRUVBOX
  -- ==========================================================================
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- soft, medium, hard
        transparent_mode = false,
        italic = {
          strings = false,
          comments = true,
          operators = false,
        },
      })
    end,
  },

  -- ==========================================================================
  -- ROSE-PINE
  -- ==========================================================================
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, dawn
        dark_variant = "moon",
        disable_background = false,
        disable_float_background = false,
        styles = {
          italic = true,
          transparency = false,
        },
      })
    end,
  },

  -- ==========================================================================
  -- KANAGAWA
  -- ==========================================================================
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = false,
        theme = "wave", -- wave, dragon, lotus
      })
    end,
  },

  -- ==========================================================================
  -- NORD
  -- ==========================================================================
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
    end,
  },

  -- ==========================================================================
  -- NIGHTFOX
  -- ==========================================================================
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
          transparent = false,
        },
      })
    end,
  },

  -- ==========================================================================
  -- ONEDARK
  -- ==========================================================================
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker", -- dark, darker, cool, deep, warm, warmer
        transparent = false,
        term_colors = true,
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "none",
          strings = "none",
          variables = "none",
        },
      })
    end,
  },
}

-- ============================================================================
-- HOW TO SWITCH COLORSCHEMES
-- ============================================================================
-- Add one of these lines to your init.lua (after lazy setup):
--
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("tokyonight-day")
--
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("catppuccin-mocha")
-- vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd.colorscheme("catppuccin-frappe")
-- vim.cmd.colorscheme("catppuccin-latte")
--
-- vim.cmd.colorscheme("gruvbox")
--
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("rose-pine-main")
-- vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("rose-pine-dawn")
--
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("kanagawa-wave")
-- vim.cmd.colorscheme("kanagawa-dragon")
-- vim.cmd.colorscheme("kanagawa-lotus")
--
-- vim.cmd.colorscheme("nord")
--
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("duskfox")
-- vim.cmd.colorscheme("nordfox")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("carbonfox")
--
-- vim.cmd.colorscheme("onedark")
--
-- ============================================================================
-- QUICK SWITCH KEYMAP (Optional)
-- ============================================================================
-- Add to init.lua for quick theme switching with <leader>th:
--
-- vim.keymap.set('n', '<leader>th', function()
--   vim.ui.select(
--     { 'tokyonight', 'catppuccin', 'gruvbox', 'rose-pine', 'kanagawa', 'nord', 'nightfox', 'onedark' },
--     { prompt = 'Select colorscheme:' },
--     function(choice)
--       if choice then vim.cmd.colorscheme(choice) end
--     end
--   )
-- end, { desc = 'Switch colorscheme' })

