return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vimls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "bashls",
          "jsonls",
          "clangd",
        },
      })

      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "vimls", "pyright", "ts_ls", "html", "cssls", "bashls", "jsonls", "clangd" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}

