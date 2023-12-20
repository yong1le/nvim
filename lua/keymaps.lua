local map = vim.keymap.set

map("v", ">", ">gv", { desc = "Indent Line"})
map("v", "<", "<gv", { desc = "Unindent Line"})
