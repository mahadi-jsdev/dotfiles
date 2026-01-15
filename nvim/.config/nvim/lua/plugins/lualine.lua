return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Modern LSP client detector (Neovim 0.10/0.11+ compatible)
    local function lsp_client()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then
        return "No LSP"
      end

      local client_names = {}
      for _, client in ipairs(clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(client_names, client.name)
        end
      end
      return #client_names > 0 and table.concat(client_names, ", ") or "No LSP"
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Essential for a tab-less workflow
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 }
        },
        lualine_b = {
          "branch",
        },
        lualine_c = {
          {
            "buffers",
            show_filename_only = true,
            hide_filename_extension = true,
            show_modified_status = true,
            mode = 0, -- 0: Shows buffer name
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              fzf = 'FZF',
              alpha = 'Dashboard',
            },
            use_mode_colors = true, -- Changes buffer pill color based on status
            symbols = {
              modified = ' ●', -- Text to show when the buffer is modified
              alternate_file = '', -- Text to show to identify the alternate file
              directory = '', -- Text to show when the buffer is a directory
            },
          }
        },
        lualine_x = {
          -- Buffer Count Indicator
          {
            function()
              return "󰓩 " .. #vim.fn.getbufinfo({ buflisted = 1 })
            end,
            color = { fg = "#7aa2f7", gui = "bold" }
          },
          -- LSP and File Info
          { lsp_client, icon = " ", color = { gui = "bold" } },
          { "encoding" },
          {
            "fileformat",
            symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' }
          },
        },
        lualine_y = {
          -- { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          "filetype",
          {
            "indent",
            fmt = function()
              local sw = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
              return "󰉶 " .. sw
            end
          }
        },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
          "progress"
        },
      },
    })
  end,
}
