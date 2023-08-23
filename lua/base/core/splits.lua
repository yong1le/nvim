return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      "<C-h>",
      "<cmd>lua require('smart-splits').move_cursor_left()<cr>",
      desc = "Go to Left Window",
      mode = { "n", "t" }
    },
    {
      "<C-l>",
      "<cmd>lua require('smart-splits').move_cursor_right()<cr>",
      desc = "Go to Right Window",
      mode = { "n", "t" }
    },
    {
      "<C-j>",
      "<cmd>lua require('smart-splits').move_cursor_down()<cr>",
      desc = "Go to Bottom Window",
      mode = { "n", "t" }
    },
    {
      "<C-k>",
      "<cmd>lua require('smart-splits').move_cursor_up()<cr>",
      desc = "Go to Top Window",
      mode = { "n", "t" }
    },
    {
      "<A-h>",
      "<cmd>lua require('smart-splits').resize_left()<cr>",
      desc = "Resize Left",
      mode = { "n", "t" }
    },
    {
      "<A-l>",
      "<cmd>lua require('smart-splits').resize_right()<cr>",
      desc = "Resize Right",
      mode = { "n", "t" }
    },
    {
      "<A-j>",
      "<cmd>lua require('smart-splits').resize_down()<cr>",
      desc = "Resize Down",
      mode = { "n", "t" }
    },
    {
      "<A-k>",
      "<cmd>lua require('smart-splits').resize_up()<cr>",
      desc = "Resize Up",
      mode = { "n", "t" }
    },

  },
  opts = {
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "prompt"
    }
  },
  config = function(_, opts)
    require("smart-splits").setup(opts)
  end
}
