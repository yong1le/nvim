vim.opt.clipboard = "unnamedplus"                              -- Connection to the system clipboard
vim.opt.smartcase = true                                       -- Case sensitivie searching

-- calling whichkey
vim.cmd[[
nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

nnoremap <silent> u :call VSCodeNotify('undo')<CR>
nnoremap <silent> <C-r> :call VSCodeNotify('redo')<CR>
]]
