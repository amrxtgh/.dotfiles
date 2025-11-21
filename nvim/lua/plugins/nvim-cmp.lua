return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    --------------------------------------------------------------------------
    -- CORE SETUP
    --------------------------------------------------------------------------
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      ------------------------------------------------------------------------
      -- TAB NAVIGATION
      ------------------------------------------------------------------------
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      ------------------------------------------------------------------------
      -- SOURCES (NOTICE: luasnip removed → no snippet popup)
      ------------------------------------------------------------------------
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 500, keyword_length = 3 },
        { name = "path", priority = 250 },
        -- { name = "luasnip" }  -- ❌ removed so snippets do NOT show in popup
      }),

      ------------------------------------------------------------------------
      -- FORMATTING
      ------------------------------------------------------------------------
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          return item
        end,
      },

      experimental = {
        ghost_text = true,
      },
    })

    --------------------------------------------------------------------------
    -- CMDLINE COMPLETION
    --------------------------------------------------------------------------
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline", keyword_length = 2 },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
  end,
}

