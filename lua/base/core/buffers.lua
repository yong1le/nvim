return {
  {
    "echasnovski/mini.bufremove",
    version = false,
    init = function()
      require("which-key").register({
        ["<leader>b"] = { name = "Buffers" },
      }, {})
    end,
    keys = {
      { "<leader>bd", "<cmd>lua require('mini.bufremove').delete()<cr>", desc = "Delete Current Buffer" },
      { "<leader>bw", "<cmd>lua require('mini.bufremove').wipeout()<cr>", desc = "Wipeout Buffers" },
    },
    opts = {
      silent = true,
    },
    config = function(_, opts)
      require("mini.bufremove").setup(opts)
    end,
  },
}
