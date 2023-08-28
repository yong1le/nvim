return {
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
    keys = {
      { "<zR>", "<cmd>lua require('ufo').openAllFolds()<cr>", desc = "Open All Folds" },
      { "<zM>", "<cmd>lua require('ufo').closeAllFolds()<cr>", desc = "Close All Folds" },
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
}
