return {
  {
    "max397574/better-escape.nvim",
    event = { "InsertCharPre" },
    opts = {
      mapping = { "jk" },
    },
    config = function(_, opts)
      require("better_escape").setup(opts)
    end
  }
}
