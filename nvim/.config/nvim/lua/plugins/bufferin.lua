return {
	"wasabeef/bufferin.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"willothy/nvim-cokeline",
	},
	config = function()
		require("bufferin").setup()
		require("cokeline").setup()

		vim.keymap.set("n", "<C-space>", "<cmd>Bufferin<cr>", { desc = "Toggle Bufferin" })
	end,
}
