-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup('SetCommentString', {})
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'SetCommentString',
  pattern = '*.cpp,*.h,*.c',
  callback = function ()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end
})
vim.api.nvim_create_autocmd('BufFilePost', {
  group = 'SetCommentString',
  pattern = '*.cpp,*.h,*.c',
  callback = function ()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end
})
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'SetCommentString',
  pattern = '*.sql',
  callback = function ()
    vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
  end
})
vim.api.nvim_create_autocmd('BufFilePost', {
  group = 'SetCommentString',
  pattern = '*.sql',
  callback = function ()
    vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
  end
})
