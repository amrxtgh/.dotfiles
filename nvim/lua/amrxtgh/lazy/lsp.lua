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
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pylsp",
			},
		})

		require("fidget").setup({})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				--["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<Shift-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.config("pylsp", {
			cmd = { "pylsp" },
			filetypes = { "python" },
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pylint = { enabled = false },
						pycodestyle = { enabled = false },
						pyflakes = { enabled = true },
						mccabe = { enabled = false },
					},
				},
			},
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("clangd")
		vim.lsp.enable("pylsp")

		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = false,
			signs = true,
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
