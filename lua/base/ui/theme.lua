return {
  {
    "catppuccin/nvim",
    lazy = false,
    opts = {
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
        neotree = true,
        telescope = true,
        mini = true,
        dap = {
          enabled = true,
          enabled_ui = true,
        },
        treesitter = true,
        which_key = true,
        illuminate = true,
        bufferline = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd[[colorscheme catppuccin]]
    end,
  },
}
