return {
  {
    "OXY2DEV/markview.nvim",
    event = "VeryLazy",
    -- cmd = { "Markview" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("markview").setup {
        preview = {
          filetypes = { "markdown", "markdown.pandoc", "codecompanion" },
          ignore_buftypes = {},
        },
      }

      -- vim.api.nvim_create_autocmd("BufWinEnter", {
      --   pattern = "*",
      --   callback = function()
      --     local bufname = vim.api.nvim_buf_get_name(0)
      --     if bufname:match "CodeCompanion" then
      --       vim.bo.filetype = "codecompanion"
      --       vim.bo.buftype = "" -- override nofile
      --       vim.bo.modifiable = true
      --     end
      --   end,
      -- })

      -- Optional: keymap to toggle the preview
      -- vim.keymap.set("n", "<leader>mp", "<cmd>Markview<CR>", { desc = "Toggle MarkView preview" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "8394"
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }

      vim.keymap.set("n", "<leader>mo", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
      vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mpls = {},
        marksman = {},
      },
      setup = {
        mpls = function(_, opts)
          local lspconfig = require "lspconfig"
          local configs = require "lspconfig.configs"

          if not configs.mpls then
            configs.mpls = {
              default_config = {
                cmd = { "mpls", "--dark-mode", "--enable-emoji", "--no-auto", "--full-sync", "--port", "8989" },
                filetypes = { "markdown", "markdown.pandoc", "codecompanion" },
                single_file_support = true,
                root_dir = function(startpath)
                  return vim.fs.dirname(vim.fs.find(".git", { path = startpath or vim.fn.getcwd(), upward = true })[1])
                end,
                settings = {},
              },
              docs = {
                description = [[https://github.com/mhersson/mpls

Markdown Preview Language Server (MPLS) is a language server that provides
live preview of markdown files in your browser while you edit them in your favorite editor.
              ]],
              },
            }
          end

          lspconfig.mpls.setup(opts)
        end,
        marksman = function(_, opts)
          local lspconfig = require "lspconfig"
          local nvlsp = require "nvchad.configs.lspconfig"

          lspconfig.marksman.setup {
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
            filetypes = { "markdown", "markdown.pandoc" },
            root_dir = lspconfig.util.root_pattern(".git", ".marksman.toml"),
          }
        end,
      },
    },
  },
}
