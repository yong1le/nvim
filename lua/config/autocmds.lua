-- vim.api.nvim_create_autocmd("ModeChanged", {
--   pattern = "*",
--   callback = function()
--     if
--         ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--         and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--         and not require("luasnip").session.jump_active
--     then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })

-- disable indent guides on certain buffer types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},
  callback = function ()
    vim.b.miniindentscope_disable = true
  end

})

-- disable statusline on certain buffer types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason"},
  callback = function ()
    vim.b.ministatusline_disable = true
  end

})
