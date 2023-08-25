return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) table.insert(opts.ensure_installed, "lua_ls") end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function (_, opts)
      table.insert(opts.ensure_installed, "stylua")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) table.insert(opts.ensure_installed, "lua") end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["lua_ls"] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            format = {
              enable = false,
            },
          },
        },
      }
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local stylua = require "efmls-configs.formatters.stylua"

      table.insert(opts.filetypes, "lua")
      opts.settings.languages["lua"] = { stylua }
    end,
  },
}
