return {
  {
    'echasnovski/mini.starter',
    version = false,
    event = "BufEnter",
    config = function()
      local starter = require('mini.starter')
      starter.setup({
        autoopen = true,
        evaluate_single = true,
        footer = "Hello World",
        items = {
          starter.sections.telescope(),
        }
      })
    end
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
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "bold" },
          functions = { "bold" },
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
        },
      })
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'BufEnter',
    opts = {},
  }
}
