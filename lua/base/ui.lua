return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require('base.config.dashboard')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = "BufEnter",
    config = function()
      require('base.config.lualine')
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "BufEnter",
    config = function()
      require('base.config.bufferline')
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
  {
    'lukas-reineke/virt-column.nvim',
    event = "BufEnter",
    config = function ()
      require('virt-column').setup()
    end
  }
}
