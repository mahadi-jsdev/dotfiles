return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    {
      "-",
      mode = { "n" },
      function() require("oil").open() end,
      desc = "Open parent directory in Oil",
    },
  },
  opts = {
    -- Optional: set to true to replace netrw completely
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  init = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Folders only function
    local function folders_only()
      -- Note: ensured compatibility with 'fd' or 'fdfind'
      local fd_cmd = "fdfind --type d --hidden --exclude .git"
      local fd_handle = io.popen(fd_cmd)
      local results = {}

      if fd_handle then
        for line in fd_handle:lines() do
          local abs_path = vim.fn.fnamemodify(line, ":p")
          local display = line
          table.insert(results, { path = abs_path, display = display })
        end
        fd_handle:close()
      end

      -- Add project root (cwd) at the very top
      local cwd = vim.fn.getcwd()
      table.insert(results, 1, {
        path = cwd,
        display = " [root] -> " .. cwd,
      })

      vim.ui.select(results, {
        prompt = "Select folder to open in Oil:",
        format_item = function(item)
          return item.display
        end,
      }, function(selected)
        if not selected then
          return
        end

        -- Oil opens paths via the standard command
        vim.cmd("Oil " .. selected.path)
      end)
    end

    -- Set up key mapping for folders only
    vim.keymap.set("n", "<C-e>", folders_only, {
      silent = true,
      desc = "Folders only (Oil compatible)",
    })
  end,
}
