return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { lsp_fallback = true }
        end,
        desc = "Format Buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        astro = { { "prettierd", "prettier" } },
      },
    },
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        astro = { "eslint_d" },
      },
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft

      -- Trigger linting leaving insert mode
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
