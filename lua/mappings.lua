require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "toggle LazyGit" })

map("n", "<leader>cc", "<cmd>ChatGPT<CR>", { desc = "ChatGPT" })
map("n", "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "ChatGPT Edit with instruction" })
map("n", "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "ChatGPT Grammar Correction" })
map("n", "<leader>ct", "<cmd>ChatGPTRun translate<CR>", { desc = "ChatGPT Translate" })
map("n", "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", { desc = "ChatGPT Keywords" })
map("n", "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", { desc = "ChatGPT Docstring" })
map("n", "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", { desc = "ChatGPT Add Tests" })
map("n", "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "ChatGPT Optimize Code" })
map("n", "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { desc = "ChatGPT Summarize" })
map("n", "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "ChatGPT Fix Bugs" })
map("n", "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", { desc = "ChatGPT Explain Code" })
map("n", "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "ChatGPT Roxygen Edit" })
map("n", "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "ChatGPT Code Readability Analysis" })


-- Suggested from https://codecompanion.olimorris.dev/getting-started.html
-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
--
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])

map("n", "<leader>at", "<cmd>CodeCompanionChat toggle<CR>", { desc = "CodeCompanion Chat Toggle" })
map("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" })
map("n", "<leader>ap", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion Prompt" })
map("v", "<leader>ai", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion Inline" })


-- vim.keymap.set("n", "<leader>mp", function()
--   require("markview").toggle()
-- end, { desc = "Toggle MarkView preview" })
map("n", "<leader>mp", "<cmd>Markview<CR>", { desc = "Toggle MarkView preview" })
