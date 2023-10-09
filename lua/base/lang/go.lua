local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "gopls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "goimports" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.gopls = utils.merge(opts.gopls, {
        settings = {
          gopls = {
            gofumpt = true,
            usePlaceholders = true,
          }
        }
      })
    end,
  },
}
