return {
	"folke/snacks.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	opts = {
		picker = {},
		bigfile = {},
		quickfile = {},
		bufDelete = {},
		statuscolumn = {},
		scope = {},
		input = {},
		notifier = {},
		indent = {},
	},
	keys = {
		{
			"<leader><leader>",
			function()
				Snacks.picker.files()
			end,
			desc = "search files",
		},
		{
			"<C-space>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "buffers",
		},
		{
			"<C-f>",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
			mode = { "n" },
		},
		{
			"<C-f>",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "x" },
		},
		{
			"<C-g>",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<C-x>",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
	},
}
