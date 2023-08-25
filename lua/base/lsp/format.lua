return {
  {
    "creativenull/efmls-configs-nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = { "BufEnter" },
    opts = {
      filetypes = {},
      settings = {
        languages = {},
      },
      single_file_support = true,
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        documentLinting = true,
      },
    },
    config = function(_, opts) require("lspconfig").efm.setup(opts) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "efm" },
    },
  },
}
