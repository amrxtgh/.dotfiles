-- ~/.config/nvim/lua/plugins/transparency.lua
return {
  {
    "xiyaowong/nvim-transparent",
    lazy = false,  -- load immediately
    config = function()
      -- transparent background
      local hl = vim.api.nvim_set_hl
      hl(0, "Normal", { bg = "none" })
      hl(0, "NormalFloat", { bg = "none" })
      hl(0, "FloatBorder", { bg = "none" })
      hl(0, "Pmenu", { bg = "none" })
      hl(0, "Terminal", { bg = "none" })
      hl(0, "EndOfBuffer", { bg = "none" })
      hl(0, "FoldColumn", { bg = "none" })
      hl(0, "Folded", { bg = "none" })
      hl(0, "SignColumn", { bg = "none" })
      hl(0, "NormalNC", { bg = "none" })
      hl(0, "WhichKeyFloat", { bg = "none" })
      hl(0, "TelescopeBorder", { bg = "none" })
      hl(0, "TelescopeNormal", { bg = "none" })
      hl(0, "TelescopePromptBorder", { bg = "none" })
      hl(0, "TelescopePromptTitle", { bg = "none" })

      -- NeoTree
      hl(0, "NeoTreeNormal", { bg = "none" })
      hl(0, "NeoTreeNormalNC", { bg = "none" })
      hl(0, "NeoTreeVertSplit", { bg = "none" })
      hl(0, "NeoTreeWinSeparator", { bg = "none" })
      hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

      -- NvimTree
      hl(0, "NvimTreeNormal", { bg = "none" })
      hl(0, "NvimTreeVertSplit", { bg = "none" })
      hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

      -- Notify
      local notify_groups = { "INFO", "ERROR", "WARN", "TRACE", "DEBUG" }
      for _, g in ipairs(notify_groups) do
        hl(0, "Notify"..g.."Body", { bg = "none" })
        hl(0, "Notify"..g.."Title", { bg = "none" })
        hl(0, "Notify"..g.."Border", { bg = "none" })
      end
    end
  }
}

