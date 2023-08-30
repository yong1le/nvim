local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "tsserver" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "prettierd", "eslint_d" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.skip = utils.insert_unique(opts.skip, { "tsserver" })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      cmd = { "typescript-language-server", "--stdio" },
      tsserver_format_options = false,
    },
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local prettierd = require "efmls-configs.formatters.prettier_d"
      local eslint_d = require "efmls-configs.linters.eslint_d"

      local languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" }

      opts.filetypes = utils.insert_unique(opts.filetypes, languages)
      for _, l in ipairs(languages) do
        opts.settings.languages[l] = utils.insert_unique(opts.settings.languages[l], { prettierd, eslint_d })
      end
    end,
  },
}
