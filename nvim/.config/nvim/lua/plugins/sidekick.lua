return {
	"folke/sidekick.nvim",
	opts = {
		cli = {
			mux = {
				enabled = true,
				backend = "tmux",
				create = "split",
				split = {
					size = 0.4,
					side = "right",
				},
			},
		},
	},
	keys = {
		-- 1. Main Toggle (Global)
		{
			"<leader>ai",
			function()
				require("sidekick.cli").toggle({ name = "gemini" })
			end,
			mode = { "n", "t", "i", "x" },
			desc = "Sidekick: Toggle",
		},

		-- 2. Sending Context (The "Send" Group)
		{
			"<leader>as",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Sidekick: Send Selection",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Sidekick: Send Current File",
		},
		{
			"<leader>al",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "n", "x" },
			desc = "Sidekick: Send 'This' (Context)",
		},

		-- 3. Prompts & Tools
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick: Prompt Library",
		},
	},
}
