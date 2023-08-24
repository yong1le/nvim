return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "clangd")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "cpp")
      table.insert(opts.ensure_installed, "c")
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["clangd"] = {
        capabilities = {
          offsetEncoding = "utf-8"
        }
      }
    end
  }
}
