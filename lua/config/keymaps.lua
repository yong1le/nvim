local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<cr>', { desc = "Save File" })

-- Movement
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window" })

map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("t", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("t", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("t", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("t", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })

-- Buffer Management
map('n', '<tab>', "<cmd>bnext<cr>", { desc = "Next Buffer", silent = true })
map('n', '<S-tab>', "<cmd>bprev<cr>", { desc = "Previous Buffer", silent = true })

-- Other
map('n', "<leader>h", "<cmd>nohl<cr>", { desc = "Remove Highlight", silent = true })
