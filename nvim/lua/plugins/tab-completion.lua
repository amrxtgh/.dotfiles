-- ============================================================================
-- TAB COMPLETION CONFIGURATION
-- ============================================================================
-- Enhanced nvim-cmp setup with Tab completion for all programming languages
-- Integrates with your existing lspconfig.lua and luasnip.lua

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Core dependencies
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    
    -- Load friendly snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    
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
      
      mapping = cmp.mapping.preset.insert({
        -- Tab: Select next item or expand/jump in snippet
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        
        -- Shift-Tab: Select previous item or jump back in snippet
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        
        -- Scroll documentation
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        
        -- Trigger completion manually
        ['<C-Space>'] = cmp.mapping.complete(),
        
        -- Close completion menu
        ['<C-e>'] = cmp.mapping.abort(),
        
        -- Confirm selection
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      
      sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'buffer', priority = 500, keyword_length = 3 },
        { name = 'path', priority = 250 },
      }),
      
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- Kind icons
          local kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          }
          
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          
          -- Source name
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snip]',
            buffer = '[Buf]',
            path = '[Path]',
          })[entry.source.name]
          
          return vim_item
        end,
      },
      
      experimental = {
        ghost_text = true,
      },
    })
    
    -- Command-line completion for ':'
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline', keyword_length = 2 },
      }),
    })
    
    -- Command-line completion for search '/' and '?'
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })
  end,
}
