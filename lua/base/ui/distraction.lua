return {
  {
    "folke/twilight.nvim",
    cmd = { "Twilight" },
    opts = {
      context = 10,
    },
    config = function(_, opts)
      require("twilight").setup(opts)
    end

  }
}
