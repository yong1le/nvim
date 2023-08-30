local utils = require "utils"
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
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
      },
    },
    config = function(_, opts)
      require("lspconfig").efm.setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "efm" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function (_, opts)
      opts.skip = utils.insert_unique(opts.skip, {"efm"})
    end
  }
}
