return {
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    'MeanderingProgrammer/render-markdown.nvim',
  },
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  },
}
