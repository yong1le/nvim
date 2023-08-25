return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) table.insert(opts.ensure_installed, "tsserver") end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
      table.insert(opts.ensure_installed, "eslint_d")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "typescript")
      table.insert(opts.ensure_installed, "javascript")
      table.insert(opts.ensure_installed, "tsx")
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      cmd = { "typescript-language-server", "--stdio" },
      tsserver_format_options = false
    },
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local prettierd = require "efmls-configs.formatters.prettier_d"
      local eslint_d = require "efmls-configs.formatters.eslint_d"

      local languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" }
      for _, l in ipairs(languages) do
        table.insert(opts.filetypes, l)
        opts.settings.languages[l] = { prettierd, eslint_d }
      end
    end,
  },
}
