return {
  {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup({
          flavour = "frappe", -- latte, frappe, macchiato, mocha
          background = {
            light = "latte",
            dark = "mocha",
          },
          transparent_background = false,
          show_end_of_buffer = false,
          term_colors = false,
          dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
          },
          no_italic = false,
          no_bold = false,
          styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = { "bold" },
            strings = {},
            variables = {},
            numbers = { "bold" },
            booleans = { "bold" },
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
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
        })
        vim.cmd.colorscheme("catppuccin")
      end,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",
      },
    },
  },
}
