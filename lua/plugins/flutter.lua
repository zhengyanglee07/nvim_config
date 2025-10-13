return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      local nvlsp = require "nvchad.configs.lspconfig"

      require("flutter-tools").setup {
        lsp = {
          color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(client, bufnr)
            nvlsp.on_attach(client, bufnr)
            -- Additional Flutter-specific keymaps can go here
          end,
          capabilities = nvlsp.capabilities,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
        debugger = {
          enabled = false,
          run_via_dap = false,
        },
        flutter_path = nil, -- Leave nil to use flutter in PATH
        flutter_lookup_cmd = nil,
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false, -- Set to true if using FVM
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "tabedit",
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
            project_config = false,
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "dart" })
    end,
  },
}
