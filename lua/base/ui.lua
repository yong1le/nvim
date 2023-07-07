return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require('base.config.dashboard')
    end,
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    event = "BufEnter",
    config = function()
      require('mini.statusline').setup()
    end
  },
  {
    'echasnovski/mini.tabline',
    version = false,
    event = "BufEnter",
    config = function()
      require('mini.tabline').setup()
    end
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    lazy = false,
    config = function()
      require('mini.indentscope').setup({
        options = {
          indent_at_cursor = false,
          try_as_border = true,
        },
        symbol = "│",
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require('base.config.catppuccin')
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'BufEnter',
    opts = {},
  },
}
