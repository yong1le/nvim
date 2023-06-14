return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function(plugin, opts)
      local lsp = require('lsp-zero').preset({
        name = 'recommended'
      })
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

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
        on_init = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end
      })

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.ensure_installed({
        -- 'clangd',
        -- 'jdtls',
      })
      -- lsp.skip_server_setup({
      --   'jdtls'
      -- })

      lsp.setup()

      -- CMP settings
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local lspkind = require('lspkind')
      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        formatting = {
          fields = { 'abbr', 'kind', 'menu' },
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer',  keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<tab>'] = cmp_action.luasnip_supertab(),
          ['<S-tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<C-o>'] = cmp.mapping.complete(),
        },
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
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
