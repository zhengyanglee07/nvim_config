-- https://codecompanion.olimorris.dev/
return {
  {
    "olimorris/codecompanion.nvim",
    -- event = "VeryLazy",
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    config = function()
      require("codecompanion").setup {
        display = {
          terminal = {
            create_if_not_exists = true, -- Auto-create terminal if none exists
            position = "bottom", -- or "top", "left", "right"
            size = 10, -- Size of the terminal window
          },
          chat = {
            -- Change the default icons
            icons = {
              pinned_buffer = " ",
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
            layout = "vertical",
            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
            provider = "default",
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
    },
    init = function()
      require("configs.codecompanion.fidget-spinner"):init()
      require("configs.codecompanion.lualine"):init()
    end,
  },
}
