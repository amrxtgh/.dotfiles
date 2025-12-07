-- ============================================================================
-- FAST MOVEMENT CONFIGURATION
-- ============================================================================
-- Enhanced hjkl movement for faster navigation

return {
  -- ==========================================================================
  -- ACCELERATED-JK (Faster j/k movement)
  -- ==========================================================================
  {
    "rainbowhxch/accelerated-jk.nvim",
    keys = { "j", "k" },
    config = function()
      require("accelerated-jk").setup({
        mode = "time_driven",
        enable_deceleration = false,
        acceleration_motions = {},
        acceleration_limit = 150,
        acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
        -- When you press j/k rapidly, movement speeds up
      })
      
      -- Map j and k to accelerated versions
      vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { noremap = false })
      vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { noremap = false })
    end,
  },
  
  -- ==========================================================================
  -- LEAP.NVIM (Jump anywhere with 2 characters)
  -- ==========================================================================
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      require('leap').add_default_mappings()
      -- s{char}{char} to jump forward
      -- S{char}{char} to jump backward
    end,
  },
}
