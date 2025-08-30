return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  
    event = { "BufReadPost", "BufNewFile" }, 
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "c",
          "cpp",
          "html",
          "css",
          "json",
          "bash",
          "markdown",
          "markdown_inline",
        },
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,             
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,             
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",      -- start selection
            node_incremental = "<CR>",    -- expand selection
            node_decremental = "<BS>",    -- shrink selection
          },
        },
      })
    end,
  }
}

