return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "lua_ls")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "lua")
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["lua_ls"] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end
  }
}
