return {
  {
    "echasnovski/mini.diff",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.diff").setup {
        -- Options for how hunks are visualized
        view = {
          -- Style of used visualization
          style = "sign", -- 'sign' or 'number'
          -- Signs used for hunks with 'sign' view
          signs = {
            add = "▎",
            change = "▎",
            delete = "▁",
          },
          -- Priority of used visualization extmarks
          priority = 199,
        },
        -- Module mappings created only inside hunks
        mappings = {
          -- Apply hunks inside a visual/operator region
          apply = "gh",
          -- Reset hunks inside a visual/operator region
          reset = "gH",
          -- Hunk range textobject to be used inside operator
          textobject = "gh",
          -- Go to hunk range in given direction
          goto_first = "[H",
          goto_prev = "[h",
          goto_next = "]h",
          goto_last = "]H",
        },
        -- Various options
        options = {
          -- Diff algorithm
          algorithm = "histogram",
          -- Whether to use "indent heuristic"
          indent_heuristic = true,
          -- The amount of second-stage diff lines to unify
          linematch = 60,
          -- Whether to wrap around edges during hunk navigation
          wrap_goto = false,
        },
      }
    end,
  },
}
