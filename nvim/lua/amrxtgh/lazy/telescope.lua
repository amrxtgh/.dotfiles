return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local builtin = require("telescope.builtin")
		local find_files = function()
			builtin.find_files({
				previewer = false,
				prompt_title = false,
				results_title = false,
				layout_config = {
					width = 0.5,
					height = 0.4,
					prompt_position = "top",
				},
			})
		end

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", "target/" },
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				path_display = { "truncate" },
			},
		})

		vim.keymap.set("n", "<leader>ff", find_files, {})
		vim.keymap.set("n", "<C-p>", find_files, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ additional_args = { "--ignore-case" } })
		end, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
