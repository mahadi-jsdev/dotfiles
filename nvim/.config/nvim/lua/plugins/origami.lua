return {
	"chrisgrieser/nvim-origami",
	event = "BufRead",
	opts = {},
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}
