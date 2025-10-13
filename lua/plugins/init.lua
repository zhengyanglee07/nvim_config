-- Init config -> /home/yang/.local/share/nvim/lazy/NvChad/lua/nvchad/plugins/init.lua

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig-modern"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require "configs.idl",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "InsertEnter",
    event = "BufReadPost",
    opts = require "configs.copilot",
  },
  {
    "fynnfluegge/rocketnotes.nvim",
    cmd = { "RocketNotes", "RN" },
    dependencies = {
      "OXY2DEV/markview.nvim",
    },
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = { "InsertEnter", "LspAttach" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- cmp for copilot, select menu for suggestion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   -- event = "LspAttach",
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "copilot",
  --     })
  --   end,
  -- },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        -- this config assumes you have OPENAI_API_KEY environment variable set
        openai_params = {
          -- NOTE: model can be a function returning the model name
          -- this is useful if you want to change the model on the fly
          -- using commands
          -- Example:
          -- model = function()
          --     if some_condition() then
          --         return "gpt-4-1106-preview"
          --     else
          --         return "gpt-3.5-turbo"
          --     end
          -- end,
          model = "gpt-4o-mini",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
      "j-hui/fidget.nvim",
      "kdheepak/lazygit.nvim",
      "nvim-lualine/lualine.nvim",
      -- "echasnovski/mini.diff",
    },
  },

  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   cmd = "CopilotChat",
  --   opts = function()
  --     local user = vim.env.USER or "User"
  --     user = user:sub(1, 1):upper() .. user:sub(2)
  --     return {
  --       auto_insert_mode = true,
  --       question_header = "  " .. user .. " ",
  --       answer_header = "  Copilot ",
  --       window = {
  --         width = 0.4,
  --       },
  --     }
  --   end,
  --   keys = {
  --     { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
  --     { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
  --     {
  --       "<leader>aa",
  --       function()
  --         return require("CopilotChat").toggle()
  --       end,
  --       desc = "Toggle (CopilotChat)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>ax",
  --       function()
  --         return require("CopilotChat").reset()
  --       end,
  --       desc = "Clear (CopilotChat)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>aq",
  --       function()
  --         vim.ui.input({
  --           prompt = "Quick Chat: ",
  --         }, function(input)
  --           if input ~= "" then
  --             require("CopilotChat").ask(input)
  --           end
  --         end)
  --       end,
  --       desc = "Quick Chat (CopilotChat)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>ap",
  --       function()
  --         require("CopilotChat").select_prompt()
  --       end,
  --       desc = "Prompt Actions (CopilotChat)",
  --       mode = { "n", "v" },
  --     },
  --   },
  --   config = function(_, opts)
  --     local chat = require "CopilotChat"
  --
  --     vim.api.nvim_create_autocmd("BufEnter", {
  --       pattern = "copilot-chat",
  --       callback = function()
  --         vim.opt_local.relativenumber = false
  --         vim.opt_local.number = false
  --       end,
  --     })
  --
  --     chat.setup(opts)
  --   end,
  -- },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "kevinhwang91/nvim-ufo",
    -- event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
      "folke/which-key.nvim",
    },
  },
}
