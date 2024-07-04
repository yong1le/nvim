local map = vim.keymap.set

map("v", ">", ">gv", { desc = "Indent Line" })
map("v", "<", "<gv", { desc = "Unindent Line" })

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<leader>;", "<cmd>vsplit<cr>", { desc = "Split Vertical" })
map("n", "<leader>'", "<cmd>split<cr>", { desc = "Split Horizontal" })


-- Bind ALT+hjkl to resize splits
map('n', '<M-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
map('n', '<M-j>', ':resize +5<CR>', { noremap = true, silent = true })
map('n', '<M-k>', ':resize -5<CR>', { noremap = true, silent = true })
map('n', '<M-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })
