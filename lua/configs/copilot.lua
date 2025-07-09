local options = {
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "right", -- | top | left | right | bottom
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = not vim.g.ai_cmp,
    -- When auto_trigger is true, copilot starts suggesting as soon as you enter insert mode.
    -- When auto_trigger is false, use the next or prev keymap to trigger copilot suggestion.
    auto_trigger = true,
    -- hide_during_completion = vim.g.ai_cmp,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      -- accept = false,
      -- accept_word = false,
      -- accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 18.x
  server_opts_overrides = {},
}

return options
