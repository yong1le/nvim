return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile"},
  keys = {
    { "<leader>g", desc = "+Git"},

    { "<leader>gh", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk"},
    { "<leader>gH", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage Hunk"},
    { "<leader>gh", "<cmd>lua require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} <cr>", desc = "Stage Hunk", mode = "v"},
    { "<leader>gH", "<cmd>lua require('gitsigns').undo_stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>", desc = "Unstage Hunk", mode = "v"},

    { "<leader>gb", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer"},

    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk"},
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk"},
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer"},
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end
}
