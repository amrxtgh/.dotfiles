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
      local jdtls = require("jdtls")
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local jdtls_jar = vim.fn.glob("~/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
      local jdtls_config = "~/.local/share/jdtls/config_linux"

      local java_config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-noverify",
          "-Xmx1G",
          "-jar", jdtls_jar,
          "-configuration", jdtls_config,
          "-data", workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
      }

      -- Auto-attach JDTLS only for Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(java_config)
        end,
      })
    end,
  },
}

