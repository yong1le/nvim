return {
  {
    'echasnovski/mini.starter',
    version = false,
    event = "BufEnter",
    config = function()
      local starter = require('mini.starter')
      starter.setup({
        autoopen = true,
        header = "Hello World",
        footer = "Bye World"
      })
    end
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    event = "BufEnter",
    config = function()
      local statusline = require('mini.statusline')
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      local git = statusline.section_git({ trunc_width = 75 })
      local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
      local filename = statusline.section_filename({ trunc_width = 140 })
      local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
      local location = statusline.section_location({ trunc_width = 75 })
      statusline.setup({
        content = {
          active = function()
            return statusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', stings = { git, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { location } }
            })
          end,
          inactive = function()
            return statusline.combine_groups({
              { hl = mode_hl, strings = { "   " } },
              '%=',
              { hl = mode_hl, strings = { "   " } },
            })
          end
        }
      })
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
