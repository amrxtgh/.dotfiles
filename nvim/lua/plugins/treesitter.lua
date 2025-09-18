return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vimdoc", "javascript", "typescript", "c", "lua", "rust",
          "jsdoc", "bash", "go", -- Add "html" here if needed
        },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",      -- start selection
            node_incremental = "<CR>",    -- expand selection
            node_decremental = "<BS>",    -- shrink selection
          },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              vim.notify(
                "File larger than 100KB, treesitter disabled for performance",
                vim.log.levels.WARN,
                { title = "Treesitter" }
              )
              return true
            end
          end,
          additional_vim_regex_highlighting = { "markdown" },
        },
      })

      -- Register custom templ parser
      vim.treesitter.language.register("templ", "templ")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter", -- Use dependencies instead of after
    config = function()
      require('treesitter-context').setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
      })
    end
  }
}
