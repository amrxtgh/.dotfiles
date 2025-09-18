return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          strings = { italic = false },
          variables = { italic = false },
        },
        variant = "moon", -- 'main', 'moon', or 'dawn'
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
}

