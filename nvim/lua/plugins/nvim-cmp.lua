return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      --------------------------------------------------------------------------
      -- SNIPPET ENGINE
      --------------------------------------------------------------------------
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      --------------------------------------------------------------------------
      -- MINIMAL VS CODE-LIKE LOOK (NO BORDERS, NO DOC WINDOW)
      --------------------------------------------------------------------------
      window = {
        completion = {
          border = "none",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
        documentation = cmp.config.disable, -- ❌ no snippet box
      },

      --------------------------------------------------------------------------
      -- VS CODE LIKE TAB BEHAVIOR
      --------------------------------------------------------------------------
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

        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      --------------------------------------------------------------------------
      -- SOURCES (NO SNIPPETS SHOWN)
      --------------------------------------------------------------------------
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer",   priority = 500, keyword_length = 3 },
        { name = "path",     priority = 250 },
        -- ❌ snippets not shown in completion menu
        -- { name = "luasnip" }
      }),

      --------------------------------------------------------------------------
      -- SIMPLE VS CODE-LIKE MENU
      --------------------------------------------------------------------------
      formatting = {
        fields = { "abbr", "menu" },
        format = function(entry, item)
          item.menu = ({
            nvim_lsp = "[LSP]",
            buffer   = "[BUF]",
            path     = "[PATH]",
          })[entry.source.name]
          return item
        end,
      },

      experimental = {
        ghost_text = true, -- VS Code style ghost hint
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

