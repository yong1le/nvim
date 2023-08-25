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

      -- disable indent guides on certain buffer types
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end

      })
    end
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {}
  }
}
