-- ============================================================================
-- COMMAND-LINE ENHANCEMENT
-- ============================================================================
-- Better command-line completion with file navigation using arrow keys

return {
  "hrsh7th/cmp-cmdline",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  event = "CmdlineEnter",
  config = function()
    local cmp = require("cmp")
    
    -- ========================================================================
    -- COMMAND-LINE COMPLETION FOR ':' (e.g., :e, :w, :colorscheme)
    -- ========================================================================
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({
        -- Arrow keys to navigate completion menu
        ['<Up>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', true)
            end
          end,
        },
        ['<Down>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
            end
          end,
        },
        
        -- Tab to trigger/navigate completion
        ['<Tab>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end,
        },
        ['<S-Tab>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          end,
        },
        
        -- Enter to confirm
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      
      sources = cmp.config.sources({
        { name = 'path', priority = 1000, keyword_length = 0 },
        { name = 'cmdline', priority = 500, keyword_length = 0 },
      }),
      
      formatting = {
        fields = { 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.menu = ({
            path = '[Path]',
            cmdline = '[Cmd]',
          })[entry.source.name]
          return vim_item
        end,
      },
      
      window = {
        completion = {
          border = "none",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
      },
      
      completion = {
        autocomplete = {
          require('cmp.types').cmp.TriggerEvent.TextChanged,
        },
      },
    })
    
    -- ========================================================================
    -- SEARCH COMPLETION FOR '/' and '?'
    -- ========================================================================
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', true)
            end
          end,
        },
        ['<Down>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
            end
          end,
        },
        ['<Tab>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end,
        },
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }),
      
      sources = {
        { name = 'buffer' },
      },
      
      window = {
        completion = {
          border = "none",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
      },
    })
  end,
}

