local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "pyright", "ruff_lsp" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "black" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "python" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.pyright = utils.merge(opts.pyright, {})
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local black = require "efmls-configs.formatters.black"

      opts.filetypes = utils.insert_unique(opts.filetypes, { "python" })
      opts.settings.languages.python = utils.insert_unique(opts.settings.languages.python, { black })
    end,
  },
}
