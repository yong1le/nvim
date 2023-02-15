-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { desc = "Split Window Right" })
vim.keymap.set("n", "<tab>", ":bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", ":bprev<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":nohl<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-j>", ":resize +2<cr>", {desc = "Increase Window Height", silent=true})
vim.keymap.set("n", "<A-k>", ":resize -2<cr>", {desc = "Decrease Window Height", silent=true})
vim.keymap.set("n", "<A-l>", ":vertical resize +2<cr>", {desc = "Increase Window Width", silent=true})
vim.keymap.set("n", "<A-h>", ":vertical resize -2<cr>", {desc = "Decrease Window Width", silent=true})

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
