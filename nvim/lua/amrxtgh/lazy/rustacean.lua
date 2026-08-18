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
				on_attach = function(bufnr)
					local opts = { silent = true, buffer = bufnr }
					-- Standard Navigation
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "Go to Definition" }))
					vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = "Go to Type Definition" }))
					-- Hover & Code Actions (Using RustLsp for specialized Rust grouping)
					vim.keymap.set('n', 'K', '<cmd>RustLsp hover actions<CR>', vim.tbl_extend('force', opts, { desc = "Rust Hover Actions" }))
					vim.keymap.set('n', '<leader>ca', '<cmd>RustLsp codeAction<CR>', vim.tbl_extend('force', opts, { desc = "Rust Code Actions" }))

					-- Reverse Engineering & Profiling Tools
					vim.keymap.set('n', '<leader>re', '<cmd>RustLsp expandMacro<CR>', vim.tbl_extend('force', opts, { desc = "Expand Macro Recursively" }))
					vim.keymap.set('n', '<leader>rm', '<cmd>RustLsp viewMemoryLayout<CR>', vim.tbl_extend('force', opts, { desc = "View Structure Memory Layout" }))
					vim.keymap.set('n', '<leader>rh', '<cmd>RustLsp toggleInlayHints<CR>', vim.tbl_extend('force', opts, { desc = "Toggle Inlay Hints" }))
				end,
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
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.rs",
			callback = function()
				vim.lsp.buf.format({ timeout_ms = 5000 })
			end,
		})
	end,
}

