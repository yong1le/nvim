return {
  -- Comment many lines
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('Comment.api').toggle.linewise.count((vim.v.count > 0 and vim.v.count or 1))<cr>",
        desc = "Toggle Comment",
      },
      {
        "<leader>/",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Toggle Comment in Selection",
        mode = "v",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Change comment types based on context
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },

  -- Autoclose parentheses
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      map_cr = true,
      map_bs = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  -- No more hold on pressing 'j'
  {
    "max397574/better-escape.nvim",
    event = { "InsertCharPre" },
    opts = {
      mapping = { "jk" },
    },
    config = function(_, opts)
      require("better_escape").setup(opts)
    end,
  },
}
