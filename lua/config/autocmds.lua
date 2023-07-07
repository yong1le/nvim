local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

-- disable indent guides on certain buffer types
autocmd("FileType", {
  pattern = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},
  callback = function ()
    vim.b.miniindentscope_disable = true
  end

})

