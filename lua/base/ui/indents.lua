return {
    {
    'echasnovski/mini.indentscope',
    version = '*',
    lazy = false,
    opts = {
        options = {
          indent_at_cursor = false,
          try_as_border = true,
        },
        symbol = "│",
    },
    config = function(_, opts)
      require('mini.indentscope').setup(opts)
    end
  },
}
