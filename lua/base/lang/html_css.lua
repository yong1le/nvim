local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        utils.insert_unique(opts.ensure_installed, { "html", "cssls", "emmet_language_server", "tailwindcss" })
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
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "html", "css" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.html = utils.merge(opts.html, {
        init_options = {
          provideFormatter = false,
        },
      })
      opts.cssls = utils.merge(opts.cssls, {})
      opts.tailwindcss = utils.merge(opts.tailwindcss, {})
      opts.emmet_language_server = utils.merge(opts.emmet_language_server, {
        filetypes = {
          "javascript",
          "typescript",
          "astro",
          "css",
          "eruby",
          "html",
          "htmldjango",
          "javascriptreact",
          "less",
          "pug",
          "sass",
          "scss",
          "svelte",
          "typescriptreact",
          "vue",
        },
      })
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    opts = function(_, opts)
      local prettierd = require "efmls-configs.formatters.prettier_d"
      local eslint_d = require "efmls-configs.formatters.eslint_d"

      local languages = { "html", "css" }

      opts.filetypes = utils.insert_unique(opts.filetypes, languages)
      for _, l in ipairs(languages) do
        opts.settings.languages[l] = utils.insert_unique(opts.settings.languages[l], { prettierd, eslint_d })
      end
    end,
  },
}
