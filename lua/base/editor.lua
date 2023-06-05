return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    cmd = { 'Neotree', 'NeoTreeShowToggle' },
    keys = {
      {'<leader>e', '<cmd>NeoTreeShowToggle<cr>', desc = 'Tree Explorer'}
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = function ()
      require('neo-tree').setup({
        close_if_last_window = true,
        popup_border_style = 'rounded',
        enable_git_status = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },

      })
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
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
