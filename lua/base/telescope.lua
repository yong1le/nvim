return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'Telescope' },
  keys = {
    { "<leader>ff",  "<cmd>lua require('telescope.builtin').find_files{}<cr>",   desc = "Find Files" },
    { "<leader>fw",  "<cmd>lua require('telescope.builtin').live_grep{}<cr>",    desc = "Look for Word" },
    { "<leader>fr",  "<cmd>lua require('telescope.builtin').oldfiles{}<cr>",     desc = "Recent Files" },
    { "<leader>fc",  "<cmd>lua require('telescope.builtin').commands{}<cr>",     desc = "Commands" },
    { "<leader>fm",  "<cmd>lua require('telescope.builtin').man_pages{}<cr>",    desc = "Man Pages" },
    { "<leader>fgf", "<cmd>lua require('telescope.builtin').git_files{}<cr>",    desc = "Git Files" },
    { "<leader>fgb", "<cmd>lua require('telescope.builtin').git_branches{}<cr>", desc = "Git Branches" },
  }
}
