local utils = require "utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "rust_analyzer" })
    end,
  },
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = utils.insert_unique(opts.ensure_installed, {})
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = utils.insert_unique(opts.ensure_installed, { "rust" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.skip = utils.insert_unique(opts.skip, { "rust_analyzer" })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
        end,
        standalone = true,
      },
    },
  },
  -- {
  --   "creativenull/efmls-configs-nvim",
  --   opts = function(_, opts)
  --     local prettierd = require "efmls-configs.formatters.prettier_d"
  --     local eslint_d = require "efmls-configs.linters.eslint_d"
  --
  --     local languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" }
  --
  --     opts.filetypes = utils.insert_unique(opts.filetypes, languages)
  --     for _, l in ipairs(languages) do
  --       opts.settings.languages[l] = utils.insert_unique(opts.settings.languages[l], { prettierd, eslint_d })
  --     end
  --   end,
  -- },
}
