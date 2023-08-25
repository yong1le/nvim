local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yank
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("Highlight Yank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})


