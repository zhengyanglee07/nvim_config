return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
            project_config = false,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = false,
          exception_breakpoints = {},
          register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        flutter_path = nil,
        flutter_lookup_cmd = nil,
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false,
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
        lsp = {
          color = {
            enabled = true,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = nil,
          capabilities = nil,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {},
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      }

      -- Keymaps for flutter commands
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Run" }))
      vim.keymap.set(
        "n",
        "<leader>fd",
        "<cmd>FlutterDevices<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Devices" })
      )
      vim.keymap.set(
        "n",
        "<leader>fe",
        "<cmd>FlutterEmulators<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Emulators" })
      )
      vim.keymap.set(
        "n",
        "<leader>fR",
        "<cmd>FlutterReload<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Reload" })
      )
      vim.keymap.set(
        "n",
        "<leader>fS",
        "<cmd>FlutterRestart<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Restart" })
      )
      vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Quit" }))
      vim.keymap.set(
        "n",
        "<leader>fD",
        "<cmd>FlutterDetach<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Detach" })
      )
      vim.keymap.set(
        "n",
        "<leader>fo",
        "<cmd>FlutterOutlineToggle<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Outline Toggle" })
      )
      vim.keymap.set(
        "n",
        "<leader>ft",
        "<cmd>FlutterDevTools<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter DevTools" })
      )
      vim.keymap.set(
        "n",
        "<leader>fT",
        "<cmd>FlutterDevToolsActivate<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter DevTools Activate" })
      )
      vim.keymap.set(
        "n",
        "<leader>fc",
        "<cmd>FlutterCopyProfilerUrl<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Copy Profiler URL" })
      )
      vim.keymap.set(
        "n",
        "<leader>fl",
        "<cmd>FlutterLspRestart<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter LSP Restart" })
      )
      vim.keymap.set(
        "n",
        "<leader>fs",
        "<cmd>FlutterSuper<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Super" })
      )
      vim.keymap.set(
        "n",
        "<leader>fh",
        "<cmd>FlutterReanalyze<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Reanalyze" })
      )
      vim.keymap.set(
        "n",
        "<leader>fp",
        "<cmd>FlutterPubGet<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Pub Get" })
      )
      vim.keymap.set(
        "n",
        "<leader>fP",
        "<cmd>FlutterPubUpgrade<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Pub Upgrade" })
      )
      vim.keymap.set(
        "n",
        "<leader>fn",
        "<cmd>FlutterRename<cr>",
        vim.tbl_extend("force", opts, { desc = "Flutter Rename" })
      )
    end,
  },
}
