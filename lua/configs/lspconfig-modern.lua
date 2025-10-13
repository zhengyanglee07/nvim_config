-- Modern Neovim 0.11+ native LSP configuration
-- This file demonstrates the new vim.lsp.config() and vim.lsp.enable() API
-- To use this instead of lspconfig, replace the require in plugins/init.lua
--
-- Migration from nvim-lspconfig to native vim.lsp.config():
-- - lspconfig[server].setup{...} -> vim.lsp.config(server, {...}) + vim.lsp.enable(server)
-- - More direct integration with Neovim's LSP client
-- - Less overhead, faster startup
--
-- See: https://neovim.io/doc/user/lsp.html#vim.lsp.config()

-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Define common LSP configuration
local default_config = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Simple servers that use default configuration
local simple_servers = {
  "html",
  "cssls",
  "clangd",
  "rust_analyzer",
  "gopls",
  "pyright",
  "yamlls",
  "dockerls",
  "clojure_lsp",
  "cmake",
  "terraformls",
  "vimls",
  "volar",
}

-- Configure and enable simple servers
for _, server in ipairs(simple_servers) do
  -- Check if server config already exists
  local existing = vim.lsp.config[server]
  if not existing or not existing.cmd then
    vim.notify("LSP server '" .. server .. "' not configured, skipping", vim.log.levels.WARN)
  else
    -- Customize the config
    vim.lsp.config(server, {
      on_attach = default_config.on_attach,
      on_init = default_config.on_init,
      capabilities = default_config.capabilities,
    })
    -- Enable it for its default filetypes
    vim.lsp.enable(server)
  end
end

-- TypeScript/JavaScript with Vue plugin (custom configuration)
vim.lsp.config("ts_ls", {
  on_attach = default_config.on_attach,
  on_init = default_config.on_init,
  capabilities = default_config.capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative",
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/yang/.nvm/versions/node/v22.14.0/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
})
vim.lsp.enable "ts_ls"

-- Example: Define a completely custom LSP server
-- vim.lsp.config('my_custom_lsp', {
--   cmd = { 'my-lsp-binary', '--stdio' },
--   root_markers = { '.git', 'package.json' },
--   filetypes = { 'myfiletype' },
--   on_attach = default_config.on_attach,
--   capabilities = default_config.capabilities,
-- })
-- vim.lsp.enable('my_custom_lsp')
