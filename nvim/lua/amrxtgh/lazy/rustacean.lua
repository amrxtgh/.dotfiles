return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	ft = { "rust" },
	init = function()
		vim.g.rustaceanvim = {
			tools = {
				float_win_config = {
					auto_focus = true,
				},
			},
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = true,
						check = {
							command = "clippy",
						},
						diagnostics = {
							disabled = { "inactive-code" },
						},
					},
				},
			},
		}
	end,
}
