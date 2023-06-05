return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function (plugin, opts)
      local lsp = require('lsp-zero').preset({})
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)
      lsp.setup()
    end
  }
}
