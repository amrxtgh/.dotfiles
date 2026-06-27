return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		"j-hui/fidget.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"pylsp",
			},
		})

		require("fidget").setup({})
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mappings = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
			}),
			source = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			})
		})
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
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pylint = { enabled = true },
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("rust-analyzer")
		vim.lsp.enable("clangd")
		vim.lsp.enable("pylsp")

		vim.diagnostic.config({
			float = {
				border = "rounded",
				source = "always",
				focusable = false,
				header = "",
				prefix = "",
			},
		})
	end,
}
