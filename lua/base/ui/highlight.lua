return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function (_, opts)
      require("illuminate").configure(opts)
    end
  },
}
