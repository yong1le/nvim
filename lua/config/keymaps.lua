local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<cr>', { desc = "Save File" })

-- Navigation
map("n", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window" })
map("n", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window" })
map("n", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window" })
map("i", "jk", "<esc>", { silent = true })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window" })

-- Buffer Management
map('n', '<tab>', "<cmd>bnext<cr>", { desc = "Next Buffer", silent = true })
map('n', '<S-tab>', "<cmd>bprev<cr>", { desc = "Previous Buffer", silent = true })
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = "Remove Buffer", silent = true })

-- Other
map('n', "<leader>h", "<cmd>nohl<cr>", { desc = "Remove Highlight", silent = true })
