local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "clangd" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "c", "cpp" })
    end,
  },
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = utils.insert_unique(opts.ensure_installed, {})
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.clangd = utils.merge(opts.clangd, {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      })
    end,
  },
  -- {
  --   "creativenull/efmls-configs-nvim",
  --   opts = function(_, opts)
  --     local clang_format = require "efmls-configs.formatters.clang_format"
  --
  --     local languages = { "c", "cpp" }
  --     opts.filetypes = utils.insert_unique(opts.filetypes, languages)
  --     for _, l in ipairs(languages) do
  --       opts.settings.languages[l] = utils.insert_unique(opts.settings.languages[l], { clang_format })
  --     end
  --   end,
  -- },
}
