local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "pylsp", "ruff_lsp" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "black" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "python" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.pylsp = utils.merge(opts.pylsp, {})
      opts.ruff_lsp = utils.merge(opts.ruff_lsp, {})
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local black = require "efmls-configs.formatters.black"

      opts.filetypes = utils.insert_unique(opts.filetypes, { "python" })
      opts.settings.languages.python = utils.insert_unique(opts.settings.languages.python, { black })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    event = { "VeryLazy" },
    keys = {
      { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select Python Virtual Env" },
    },
    opts = {
      pyenv_path = "~/.pyenv/versions"
    },
  },
}
