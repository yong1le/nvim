return {
  {
    'numToStr/Comment.nvim',
    keys = {
      {
        '<leader>/',
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Toggle comment line",
      },
      {
        '<leader>/',
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "toggle comment for selection",
        mode = 'v',
      }

    },
    config = function()
      require('Comment').setup()
    end
  },
  {
    'echasnovski/mini.surround',
    event = 'BufEnter',
    lazy = false,
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'ys',
          delete = 'rs',
          find = 'fs',
          find_left = 'fS',
          highlight = '',
          replace = 'cs',
          update_n_lines = '',

          suffix_last = '',
          suffix_next = '',
        },
      })
    end
  },
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    version = false,
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>',        desc = 'Horizontal Terminal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>',          desc = 'Vertical Terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>',             desc = 'Floating Terminal' },
      { '<leader>tl', '<cmd>TermExec cmd="lazygit" direction=float<cr>', desc = 'Lazygit' },
    },
    config = function()
      require('toggleterm').setup({
        close_when_exit = true
      })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "▎" },
          topdelte = { text = "▎" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        }
      })
    end
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
}
