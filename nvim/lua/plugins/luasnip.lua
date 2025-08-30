return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      luasnip.setup({ history = true, delete_check_events = "TextChanged" })

      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

      -- Keymaps for navigation
      local opts = { silent = true }
      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
      end, opts)
      vim.keymap.set({ "i", "s" }, "<C-h>", function()
        if luasnip.jumpable(-1) then luasnip.jump(-1) end
      end, opts)
      vim.keymap.set("i", "<C-k>", function()
        if luasnip.choice_active() then luasnip.change_choice(1) end
      end, opts)
    end,
  },
}

