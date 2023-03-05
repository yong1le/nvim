-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "OperatorMono Nerd Font:h16"
vim.g.neovide_background_color = "#30343c"
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_macos_alt_is_meta = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.spell = false
vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN }
  }
})

vim.opt.conceallevel = 0
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_latexmk = {
  build_dir = './outputs',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
