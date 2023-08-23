return {
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost", "BufNewFile"},
    dependencies = {
      'kevinhwang91/promise-async',
      "luukvbaal/statuscol.nvim",
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)
    end
  }
}
