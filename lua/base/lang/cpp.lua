return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) table.insert(opts.ensure_installed, "clangd") end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "cpp")
      table.insert(opts.ensure_installed, "c")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts) table.insert(opts.ensure_installed, "clang-format") end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts["clangd"] = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      }
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local clang_format = require "efmls-configs.formatters.clang_format"

      local languages = { "c", "cpp" }
      for _, l in ipairs(languages) do
        table.insert(opts.filetypes, l)
        opts.settings.languages[l] = { clang_format }
      end
    end,
  },
}
