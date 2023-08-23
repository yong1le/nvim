return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    keys = {
      { "<leader>t",  desc = "+Terminal"},
      { "<leader>g",  desc = "+Git"},
      { "<leader>tl", "<cmd>LazyGit<cr>", desc = "Lazy Git" },
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Lazy Git" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
