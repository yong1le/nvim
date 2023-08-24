return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "pyright")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "python")
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["pyright"] = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
            }
          }
        }
      }
    end
  }
}
