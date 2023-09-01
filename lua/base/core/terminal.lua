return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    init = function()
      require("which-key").register({
        ["<leader>t"] = { name = "Terminal"},
      }, {})
    end,
    keys = {
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
    },
    config = function()
      require("toggleterm").setup {
        close_when_exit = true,
      }
    end,
  },
}
