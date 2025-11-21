-- ============================================================================
-- LUASNIP CONFIGURATION
-- ============================================================================
-- Snippet engine with support for VSCode-style and custom Lua snippets

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets", -- Collection of pre-made snippets
  },
  config = function()
    local luasnip = require("luasnip")
    
    -- ========================================================================
    -- LUASNIP SETUP
    -- ========================================================================
    luasnip.setup({
      -- Keep last snippet for jump back
      history = true,
      
      -- Update as you type
      updateevents = "TextChanged,TextChangedI",
      
      -- Auto-delete snippets when text changes
      delete_check_events = "TextChanged",
      
      -- Enable autotrigger snippets
      enable_autosnippets = true,
      
      -- Store snippet history
      store_selection_keys = "<Tab>",
    })
    
    -- ========================================================================
    -- SNIPPET LOADERS
    -- ========================================================================
    
    -- Load VSCode-style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    
    -- Load custom Lua snippets from your snippets directory
    local snippet_path = vim.fn.stdpath("config") .. "/snippets"
    if vim.fn.isdirectory(snippet_path) == 1 then
      require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })
    end
    
    -- Optional: Load snippets from a specific path
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })
    
    -- ========================================================================
    -- SNIPPET NAVIGATION KEYMAPS
    -- ========================================================================
    local opts = { silent = true, noremap = true }
    
    -- Jump forward in snippet (Ctrl+l)
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, opts)
    
    -- Jump backward in snippet (Ctrl+h)
    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, opts)
    
    -- Cycle through choice nodes (Ctrl+k)
    vim.keymap.set("i", "<C-k>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, opts)
    
    -- Alternative: Use Tab/Shift-Tab for snippet navigation
    -- Uncomment if you want to use Tab instead of Ctrl+l/h
    --[[
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, opts)
    
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, opts)
    --]]
    
    -- ========================================================================
    -- SNIPPET TYPES (for reference)
    -- ========================================================================
    -- You can create custom snippets in: ~/.config/nvim/snippets/
    -- File structure:
    --   snippets/
    --   ├── all.lua       (snippets for all filetypes)
    --   ├── lua.lua       (lua-specific snippets)
    --   ├── python.lua    (python-specific snippets)
    --   ├── javascript.lua
    --   └── ...
    
    -- Example snippet format in snippets/lua.lua:
    --[[
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    
    return {
      s("fn", {
        t("function "), i(1, "name"), t("("), i(2, "args"), t(")"),
        t({"", "  "}), i(0),
        t({"", "end"}),
      }),
    }
    --]]
  end,
}
