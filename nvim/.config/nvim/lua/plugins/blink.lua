return {
  "saghen/blink.cmp",
  event = "LspAttach",
  version = "1.*",
  config = function()
    local blink = require("blink.cmp")

    -- blink config
    blink.setup({
      keymap = {
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = {
          "lsp",
          "buffer",
          "path",
          "snippets",
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        menu = {
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
            },
            treesitter = { "lsp" },
            components = {
              label = {
                text = function(ctx)
                  return ctx.item.label
                end,
                highlight = function(ctx)
                  return ctx.highlights
                end,
              },
            },
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
    })


    -- lsp setup
    local capabilities = blink.get_lsp_capabilities() or {}

    local on_attach = function(_, bufnr)
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true, buffer = bufnr }
      -- LSP keymaps
      map("n", "<leader>lr", vim.lsp.buf.rename, opts)
      map("n", "<leader>la", vim.lsp.buf.code_action, opts)
      map("n", "<leader>ld", vim.diagnostic.open_float, opts)
      map("n", "<leader>ff", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gd", function()
        Snacks.picker.lsp_definitions()
      end, opts)
      map("n", "gr", function()
        Snacks.picker.lsp_references()
      end, opts)
      map("n", "gs", function()
        Snacks.picker.lsp_symbols()
      end)
      map("n", "<leader>fd", function()
        Snacks.picker.diagnostics()
      end, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
    end

    -- List of servers
    local servers = {
      "lua_ls",
      "ts_ls",
      "eslint",
      "tailwindcss",
      "html",
      "cssls",
    }

    -- Server setup
    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.enable(lsp)
    end
  end,
}
