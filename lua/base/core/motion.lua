return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, "<cmd>lua require('flash').jump()<cr>",        desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, "<cmd>lua require('flash').treesitter() <cr>", desc = "Flash Treesitter" },
    }
  }
}
