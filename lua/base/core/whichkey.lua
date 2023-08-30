return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = { enabled = false },
      },
      window = {
        border = "single",
      },
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
      require("which-key").register({
        b = { name = "Buffers" },
        g = { name = "Git" },
        t = { name = "Terminal" },
        f = { name = "Find", g = { name = "Git" } },
        l = { name = "LSP" },
      }, { prefix = "<leader>" })
    end,
  },
}
