vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "elflord_custom"

local bg = "#061a1a"


local hl = {
  Normal       = { fg = "Cyan", bg = bg },
  NormalNC     = { fg = "Cyan", bg = bg },
  SignColumn   = { bg = bg },
  LineNr       = { fg = "Cyan" },
  Comment      = { fg = "White", bold = true },
  Constant     = { fg = "White" },
  Identifier   = { fg = "Cyan", bold = true },
  Function     = { fg = "Red", bold = true },
  Statement    = { fg = "Cyan", bold = true },
  PreProc      = { fg = "Cyan" },
  Type         = { fg = "Red", bold = true },
  Repeat       = { fg = "Red", bold = true },
  Operator     = { fg = "Red" },
  Special      = { fg = "Cyan", bold = true },
  Ignore       = { fg = bg },
  Error        = { fg = "Cyan", bg = "Red" },
  Todo         = { fg = "Cyan", bg = "Yellow", bold = true },
  ["@lsp.type.parameter"] = { fg = "Cyan" },
}

local links = {
  String = "Constant", Character = "Constant", Number = "Constant",
  Boolean = "Constant", Float = "Number", Conditional = "Repeat",
  Label = "Statement", Keyword = "Statement", Exception = "Statement",
  Include = "PreProc", Define = "PreProc", Macro = "PreProc",
  PreCondit = "PreProc", StorageClass = "Type", Structure = "Type",
  Typedef = "Type", Tag = "Special", SpecialChar = "Special",
  Delimiter = "Special", SpecialComment = "Special", Debug = "Special",
}

for group, opts in pairs(hl) do
  vim.api.nvim_set_hl(0, group, opts)
end

for from, to in pairs(links) do
  vim.api.nvim_set_hl(0, from, { link = to })
end

vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
