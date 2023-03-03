-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("SetCommentString", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = "SetCommentString",
  pattern = "*.cpp,*.h,*.c",
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end,
})
vim.api.nvim_create_autocmd("BufFilePost", {
  group = "SetCommentString",
  pattern = "*.cpp,*.h,*.c",
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = "SetCommentString",
  pattern = "*.sql",
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
  end,
})
vim.api.nvim_create_autocmd("BufFilePost", {
  group = "SetCommentString",
  pattern = "*.sql",
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function ()
    vim.cmd("silent! :w | !pandoc % -o %:h/pdf/%:t:r.pdf")
  end
})
