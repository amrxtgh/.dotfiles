-- ============================================================================
-- NVIM-CMP CONFIGURATION
-- ============================================================================
-- Minimal autocompletion setup with Tab/Enter confirmation

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
    "hrsh7th/cmp-buffer",       -- Buffer words source
    "hrsh7th/cmp-path",         -- File path source
    "L3MON4D3/LuaSnip",         -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet source
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    cmp.setup({
      -- ======================================================================
      -- SNIPPET ENGINE
      -- ======================================================================
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      
      -- ======================================================================
      -- COMPLETION WINDOW
      -- ======================================================================
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      
      -- ======================================================================
      -- KEY MAPPINGS
      -- ======================================================================
      mapping = cmp.mapping.preset.insert({
        -- Tab: Confirm selection (or insert tab if menu not visible)
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
          else
            fallback()
          end
        end, { "i", "s" }),
        
        -- Enter: Confirm selection
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        
        -- Navigate menu items
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        
        -- Scroll documentation
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        
        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- Close completion menu
        ["<C-e>"] = cmp.mapping.abort(),
      }),
      
      -- ======================================================================
      -- COMPLETION SOURCES
      -- ======================================================================
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000, keyword_length = 1 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500, keyword_length = 3 },
        { name = "path", priority = 250 },
      }),
      
      -- ======================================================================
      -- FORMATTING
      -- ======================================================================
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Source labels
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          
          return vim_item
        end,
      },
      
      -- ======================================================================
      -- BEHAVIOR
      -- ======================================================================
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      
      experimental = {
        ghost_text = false, -- Disable for minimal look
      },
    })
  end,
}
