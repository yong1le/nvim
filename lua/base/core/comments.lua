return {
  "numToStr/Comment.nvim",
  keys = {
    {
      "<leader>/",
      "<cmd>lua require('Comment.api').toggle.linewise.count((vim.v.count > 0 and vim.v.count or 1))<cr>",
      desc = "Toggle Comment"
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
  opts = {
    -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
}
