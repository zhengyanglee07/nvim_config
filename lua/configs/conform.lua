-- https://github.com/stevearc/conform.nvim

local options = {
  formatters = {
    prettier = {
      inherit = false,
      command = "prettier",
      args = {
        "--stdin-filepath",
        "$FILENAME",
        -- "--single-quote",
        -- "--tab-width",
        -- "4",
      },
      stdin = true,
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    python = { "black" },
    vue = { "prettier" },
    dart = { "dart_format" },

    -- -- Conform will run the first available formatter
    -- javascript = { { "prettierd", "prettier" } },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
