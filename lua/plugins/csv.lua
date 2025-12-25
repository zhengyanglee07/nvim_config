return {
  {
    "chrisbra/csv.vim",
    ft = "csv",
    config = function()
      -- Auto-enable CSV mode when opening CSV files
      vim.g.csv_autocmd_arrange = 1
      vim.g.csv_autocmd_arrange_size = 1024 * 1024 -- 1MB limit for auto-arrange

      -- Set delimiter to auto-detect (default is ',')
      -- vim.g.csv_delim = ','

      -- Enable column highlighting
      vim.g.csv_highlight_column = "y"

      -- Set custom highlight colors - Dark blue background with white text
      vim.api.nvim_set_hl(0, "CSVColumnEven", { ctermfg = 255, ctermbg = 24, fg = "#ffffff", bg = "#1e3a5f" })
      vim.api.nvim_set_hl(0, "CSVColumnOdd", { ctermfg = 255, ctermbg = 25, fg = "#ffffff", bg = "#234570" })
      vim.api.nvim_set_hl(0, "CSVColumnHeaderEven", {
        cterm = { bold = true },
        ctermfg = 255,
        ctermbg = 26,
        fg = "#ffffff",
        bg = "#2a5080",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "CSVColumnHeaderOdd", {
        cterm = { bold = true },
        ctermfg = 255,
        ctermbg = 27,
        fg = "#ffffff",
        bg = "#305a90",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "CSVDelimiter", { ctermfg = 244, fg = "#88aacc" })

      -- Highlight for the current column (cursor column) - Bright cyan/blue instead of yellow
      vim.api.nvim_set_hl(0, "WildMenu", { ctermfg = 16, ctermbg = 117, fg = "#000000", bg = "#5fafd7", bold = true })

      -- Set to view mode by default
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "csv",
        callback = function()
          -- Enable CSV arrange (columnar view)
          vim.cmd "CSVArrangeColumn"

          -- Optional: Set to readonly by default for safer viewing
          -- Uncomment if you want files to be readonly by default
          -- vim.bo.readonly = true
          -- vim.bo.modifiable = false

          -- Keybindings for CSV navigation
          vim.keymap.set("n", "<leader>ca", "<cmd>CSVArrangeColumn<CR>", { buffer = true, desc = "CSV Arrange" })
          vim.keymap.set("n", "<leader>cu", "<cmd>CSVUnArrangeColumn<CR>", { buffer = true, desc = "CSV Unarrange" })
          vim.keymap.set("n", "H", "<Plug>CSVPrevCol", { buffer = true, desc = "CSV Previous Column" })
          vim.keymap.set("n", "L", "<Plug>CSVNextCol", { buffer = true, desc = "CSV Next Column" })
          vim.keymap.set("n", "K", "<Plug>CSVPrevRow", { buffer = true, desc = "CSV Previous Row" })
          vim.keymap.set("n", "J", "<Plug>CSVNextRow", { buffer = true, desc = "CSV Next Row" })
        end,
      })
    end,
  },
}
