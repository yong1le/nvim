local map = vim.keymap.set

map("v", ">", ">gv", { desc = "Indent Line" })
map("v", "<", "<gv", { desc = "Unindent Line" })

map("n", "<leader>;", "<cmd>vsplit<cr>", { desc = "Split Vertical" })
map("n", "<leader>'", "<cmd>split<cr>", { desc = "Split Horizontal" })
