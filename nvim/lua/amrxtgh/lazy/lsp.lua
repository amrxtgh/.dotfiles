return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",

		"j-hui/fidget.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
		})

		require("fidget").setup({})
		local cmp = require("cmp")
		cmp.setup({})
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			setup = {
				Lua = {
					diagnosis = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.config("rust-analyzer", {
			capabilities = capabilities,
		})
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("rust-analyzer")

		vim.diagnostic.config({
			float = {
				border = "rounded",
				source = "always",
				focusable = false,
			},
		})
	end,
}
