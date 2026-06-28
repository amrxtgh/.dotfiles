return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	ft = { "rust" },
	init = function()
		vim.g.rustaceanvim = {
			tools = {
				hover_actions = {
					["auto_focus"] = true,
				},
			},
			server = {
				on_attach = function(client, bufnr) end,
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
