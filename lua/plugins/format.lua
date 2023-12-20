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
        javascript = { { "eslint_d", "eslint" } },
        typescript = { { "eslint_d", "eslint" } },
        javascriptreact = { { "eslint_d", "eslint" } },
        typescriptreact = { { "eslint_d", "eslint" } },
        svelte = { { "eslint_d", "eslint" } },
        astro = { { "eslint_d", "eslint" } },
      },
    },
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft

      -- Trigger linting leaving insert mode
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
