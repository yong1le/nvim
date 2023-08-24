return {
  {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      { "<leader>l", desc = "+LSP" },
    },
    config = function(_, opts)
      -- Setup all servers
      for server, conf in pairs(opts) do
        require("lspconfig")[server].setup(conf)
      end

      -- Diagnostics
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
      })

      -- Gutter Icons
      local signs = { Error = "✘ ", Warn = "▲ ", Hint = "⚑ ", Info = "» " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Borders
      local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      }
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      -- Keybinds
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = vim.keymap.set
          local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
          end

          map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("Hover Documentation"))
          map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Go to Definition"))
          map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts("Go to Declaration"))
          map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts("Go to Implementation"))
          -- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Hover Signature"))
          map("n", "gr", "<cmd> lua vim.lsp.buf.references()<cr>", opts("Go to References"))
          map("n", "gl", "<cmd> lua vim.diagnostic.open_float(nil, {focus = false})<cr>", opts("Show Line Diagnostics"))

          map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<cr>', { desc = "Format Buffer" })
          map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename Symbol" })
          map('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Code Actions" })
          map('n', '<leader>lR', '<cmd>lua require("telescope.builtin").lsp_references{}<cr>',
            { desc = "LSP References" })
          map('n', '<leader>li', '<cmd>lua require("telescope.builtin").lsp_implementations{}<cr>',
            { desc = "LSP Implementations" })
        end,
      })
    end
  },
}
