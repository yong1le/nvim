-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { desc = "Split Window Right" , silent = true})
vim.keymap.set("n", "<tab>", ":bnext<cr>", { desc = "Next Buffer" , silent = true})
vim.keymap.set("n", "<S-tab>", ":bprev<cr>", { desc = "Previous Buffer" , silent = true})
vim.keymap.set("n", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":nohl<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>;", ":Alpha<cr>", {desc = "Alpha", silent=true})
vim.keymap.set("n", "<leader>,", ":cd %:h<cr>", {desc = "CD to current file directory", silent=true})

vim.keymap.set("n", "<A-j>", ":resize +2<cr>", {desc = "Increase Window Height", silent=true})
vim.keymap.set("n", "<A-k>", ":resize -2<cr>", {desc = "Decrease Window Height", silent=true})
vim.keymap.set("n", "<A-l>", ":vertical resize +2<cr>", {desc = "Increase Window Width", silent=true})
vim.keymap.set("n", "<A-h>", ":vertical resize -2<cr>", {desc = "Decrease Window Width", silent=true})

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", {desc="Go to Left Window"})
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", {desc="Go to Right Window"})
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", {desc="Go to Upper Window"})
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", {desc="Go to Lower Window"})
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>tt", ":ToggleTerm<cr>", {desc="ToggleTerm", silent=true})
vim.keymap.set("n", "<leader>t1", ":ToggleTerm1<cr>", {desc="ToggleTerm1", silent=true})
vim.keymap.set("n", "<leader>t2", ":ToggleTerm2<cr>", {desc="ToggleTerm2", silent=true})
vim.keymap.set("n", "<leader>t3", ":ToggleTerm3<cr>", {desc="ToggleTerm3", silent=true})
vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<cr>", {desc="ToggleTermAll", silent=true})

vim.keymap.set("n", "<leader>cx", ":VimtexCompile<cr>", {desc="Compile Latex", silent=true})
vim.keymap.set("n", "<leader>cP", ":MarkdownPreviewToggle<cr>", {desc="Preview Markdown", silent=true})

-- Delete Existing Keymaps
vim.keymap.del("n", "<leader>|", {})
vim.keymap.del("n", "<leader>-", {})
vim.keymap.del("n", "<leader>`", {})
vim.keymap.del("n", "<leader>bb", {})
vim.keymap.del("n", "<leader>w-", {})
vim.keymap.del("n", "<leader>w|", {})
vim.keymap.del("n", "<leader>wd", {})
vim.keymap.del("n", "<leader>ww", {})
vim.keymap.del("n", "<leader>ft", {})
vim.keymap.del("n", "<leader>fT", {})
