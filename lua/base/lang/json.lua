local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "jsonls" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "json", "jsonc" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "prettierd" })
    end,
  },
  {
    "b0o/SchemaStore.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.jsonls = utils.merge(opts.jsonls, {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local prettier_d = require "efmls-configs.formatters.prettier_d"

      local languages = { "json" }
      opts.filetypes = utils.insert_unique(opts.filetypes, languages)
      for _, l in ipairs(languages) do
        opts.settings.languages[l] = utils.insert_unique(opts.settings.languages[l], { prettier_d })
      end
    end,
  },
}
