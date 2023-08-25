return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "pyright")
      table.insert(opts.ensure_installed, "ruff_lsp")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts) table.insert(opts.ensure_installed, "black") end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) table.insert(opts.ensure_installed, "python") end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts) opts["pyright"] = {} end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local black = require "efmls-configs.formatters.black"

      table.insert(opts.filetypes, "python")
      opts.settings.languages["python"] = { black }
    end,
  },
}
