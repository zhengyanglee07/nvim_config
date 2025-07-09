-- https://codecompanion.olimorris.dev/
return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    config = function()
      require("codecompanion").setup {
        display = {
          chat = {
            icons = {
              pinned_buffer = " ",
              watched_buffer = "👀 ",
            },
          },
          action_palette = {
            width = 95,
            height = 10,
            prompt = "Prompt ",
            provider = "telescope",
            opts = {
              show_default_actions = true,
              show_default_prompt_library = true,
            },
          },
          diff = {
            enabled = true,
            close_chat_at = 240,
            layout = "vertical", -- or "horizontal"
            provider = "mini_diff", -- Use mini.diff instead of default
            opts = {
              -- Mini.diff specific options
              algorithm = "histogram",
              indent_heuristic = true,
              linematch = 60,
            },
          },
        },
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
          cmd = {
            adapter = "copilot",
          },
        },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.5-sonnet",
                },
              },
            })
          end,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.diff", -- Add mini.diff as dependency
    },
    init = function()
      require("configs.codecompanion.fidget-spinner"):init()
      require("configs.codecompanion.lualine"):init()
    end,
  },
}

