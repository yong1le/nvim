return {
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   priority = 9999,
  --   opts = {
  --     flavour = "mocha",
  --     background = {
  --       light = "latte",
  --       dark = "mocha",
  --     },
  --     transparent_background = false,
  --     show_end_of_buffer = false,
  --     term_colors = false,
  --     dim_inactive = {
  --       enabled = false,
  --       shade = "dark",
  --       percentage = 0.15,
  --     },
  --     no_italic = false,
  --     no_bold = false,
  --     no_underline = false,
  --     styles = {
  --       comments = { "italic" },
  --       conditionals = { "italic" },
  --       loops = { "bold" },
  --       functions = { "bold" },
  --       keywords = { "italic" },
  --       strings = {},
  --       variables = {},
  --       numbers = {},
  --       booleans = {},
  --       properties = {},
  --       types = {},
  --       operators = {},
  --     },
  --     color_overrides = {},
  --     custom_highlights = {},
  --     integrations = {
  --       cmp = true,
  --       gitsigns = true,
  --       nvimtree = true,
  --       neotree = true,
  --       telescope = true,
  --       mini = true,
  --       dap = {
  --         enabled = true,
  --         enabled_ui = true,
  --       },
  --       treesitter = true,
  --       which_key = true,
  --       illuminate = true,
  --       bufferline = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd[[colorscheme catppuccin]]
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 9999,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      require("kanagawa").load("wave")
    end,
  },
}
