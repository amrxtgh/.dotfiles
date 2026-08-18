return {
	"itchyny/lightline.vim",
	lazy = false,
	config = function()
		vim.o.showmode = false
		vim.g.lightline = {
			colorscheme = "elflord_custom",
			active = {
				left = {
					{ "mode", "paste" },
					{ "readonly", "filename", "modified" },
				},
				right = {
					{ "lineinfo" },
					{ "percent" },
					{ "fileencoding", "filetype" },
				},
			},
			component_function = {
				filename = "LightlineFilename",
			},
		}
		function _G.LightlineFilename()
			if vim.fn.expand("%:t") == "" then
				return "[No Name]"
			else
				return vim.fn.expand("%:t")
			end
		end
	end,
}
