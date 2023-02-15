return {
  {
    "olimorris/onedarkpro.nvim",
    config = function ()
      require('onedarkpro').setup({
        options = {
          cursorline = true,
        }
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_vivid",
    },
  },
}
