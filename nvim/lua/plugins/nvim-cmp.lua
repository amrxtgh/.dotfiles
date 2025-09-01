return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          -- Tab: confirm only if menu is visible, otherwise insert tab
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace,
              })
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Enter: confirm completion
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }),

          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigation in menu
          ["<C-h>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-l>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", keyword_length = 2 },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
      })

      -- Optional: load friendly-snippets if you want many ready-made snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

