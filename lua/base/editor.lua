return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = { 'Neotree' },
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Tree Explorer' }
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('base.config.neotree')
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
      },
      window = {
        border = 'single',
      }
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register(opts.defaults)
      wk.register({
        b = { name = "Buffer" },
        f = {
          name = "Find",
          g = { name = "Git" }
        },
        l = {
          name = "LSP",
          j = { name = "Java" }
        },
        d = { name = "Debugger" },
        t = { name = "Terminal" },
        z = { name = "Notes" },
      }, { prefix = '<leader>' })
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  },
  {
    "famiu/bufdelete.nvim",
    keys = {
      {"<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer"}
    }
  }
}
