return {
  {
    'echasnovski/mini.bufremove',
    version = false,
    keys = {
      {"<leader>b", desc = "+Buffers"},
      {"<leader>bd", "<cmd>lua require('mini.bufremove').delete()<cr>", desc = "Delete Current Buffer"},
      {"<leader>bw", "<cmd>lua require('mini.bufremove').wipeout()<cr>", desc = "Wipeout Buffers"},
    },
    opts = {
      silent = true
    },
    config = function (_, opts)
      require("mini.bufremove").setup(opts)
    end
  },
}
