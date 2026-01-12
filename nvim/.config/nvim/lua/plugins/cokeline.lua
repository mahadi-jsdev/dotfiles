return {
	"willothy/nvim-cokeline",
	event = "BufRead",
	config = function()
		require("cokeline").setup()
	end,
}
