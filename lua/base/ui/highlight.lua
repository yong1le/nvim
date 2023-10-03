return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes_denylist = {
        'norg',
        'tex',
        'latex',
        'markdown',
      }
    },
    config = function (_, opts)
      require("illuminate").configure(opts)
    end
  },
}
