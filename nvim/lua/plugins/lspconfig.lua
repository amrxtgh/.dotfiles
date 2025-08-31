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
      local servers = { "lua_ls", "vimls", "pyright", "ts_ls", "html", "cssls", "bashls", "jsonls", "clangd", "jdtls"}

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
        end
       local jdtls=require("jdtls")
      local ws=vim.fn.stdpath("data").."/jdtls-workspace/"..vim.fn.fnamemodify(vim.fn.getcwd(),":p:h:t")
      local jar=vim.fn.glob("~/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
      local cfg={cmd={"java","-Declipse.application=org.eclipse.jdt.ls.core.id1","-Dosgi.bundles.defaultStartLevel=4","-Declipse.product=org.eclipse.jdt.ls.core.product","-noverify","-Xmx1G","-jar",jar,"-configuration","~/.local/share/jdtls/config_linux","-data",ws},root_dir=require("jdtls.setup").find_root({".git","mvnw","gradlew"})}
      vim.api.nvim_create_autocmd("FileType",{pattern="java",callback=function() jdtls.start_or_attach(cfg) end})
    end,
  },
}

