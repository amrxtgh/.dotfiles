return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
			contrast = "soft",
		})
		vim.cmd.colorscheme("gruvbox")
	end,
	--"rose-pine/neovim",
	--name = "rose-pine",
	--config = function ()
	--	vim.cmd("colorscheme rose-pine")
	--end
}
