local map = vim.keymap.set

-- Buffer Management
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer", silent = true })
map("n", "<S-tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer", silent = true })

-- Tabbing
map("v", ">", ">gv", { desc = "Indent Line"})
map("v", "<", "<gv", { desc = "Unindent Line"})
