-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--  when you enter a (new) buffer
vim.cmd[[
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.cpp,*.h,*.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
autocmd BufFilePost *.cpp,*.h,*.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END
]]
