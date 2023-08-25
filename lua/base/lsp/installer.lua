return {
  {
    "williamboman/mason.nvim",
    event = { "BufEnter" },
    opts = {
      ui = {
        border = "single",
      },
    },
    config = function(_, opts) require("mason").setup(opts) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function(_, opts) require("mason-lspconfig").setup(opts) end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {},
    },
    config = function(_, opts) require("mason-tool-installer").setup(opts) end,
  },
}
