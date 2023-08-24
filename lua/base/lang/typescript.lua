return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "tsserver")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "typescript")
      table.insert(opts.ensure_installed, "javascript")
      table.insert(opts.ensure_installed, "tsx")
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["tsserver"] = {}
    end
  }
}
