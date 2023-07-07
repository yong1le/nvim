return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'L3MON4D3/LuaSnip' },
      { "jay-babu/mason-null-ls.nvim" },
      { 'jose-elias-alvarez/null-ls.nvim' },
      -- cmp
      { "hrsh7th/nvim-cmp" },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'onsails/lspkind.nvim' },
    },
    config = function()
      local lsp = require('lsp-zero').preset({
        name = "recommended"
      })
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      -- enable default keymaps
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({
          buffer = bufnr,
        })

        -- Keybindings here
        local map = vim.keymap.set
        map('n', '<leader>lf', '<cmd>LspZeroFormat<cr>', { desc = "Format Buffer" })
        map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename Symbol" })
        map('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Code Actions" })
        map('n', '<leader>lR', '<cmd>lua require("telescope.builtin").lsp_references{}<cr>', { desc = "LSP References" })
        map('n', '<leader>li', '<cmd>lua require("telescope.builtin").lsp_implementations{}<cr>',
          { desc = "LSP Implementations" })


        map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue/Start" })
        map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
        map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue/Start" })
        map("n", "<leader>dv", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
        map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
        map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
        map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle UI" })
      end)

      -- Share options with all lsp servers
      lsp.set_server_config({
        single_file_support = true,
        on_init = function(c)
          c.server_capabilities.semanticTokensProvider = nil
        end
      })

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.skip_server_setup({
        'zk',
        'jdtls'
      })

      lsp.setup()

      require('base.lsp.completion')
      require('base.lsp.format')
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = 'single',
        }
      })
    end
  }
}
