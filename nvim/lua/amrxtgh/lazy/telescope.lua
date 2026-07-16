return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/" },
				path_display = { "truncate" },
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ additional_args = { "--ignore-case" } })
		end, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
