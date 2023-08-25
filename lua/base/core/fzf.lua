return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>f",   desc = "+Find" },
      { "<leader>fg",  desc = "+Git" },
      { "<leader>ff",  "<cmd>lua require('telescope.builtin').find_files{}<cr>",   desc = "Find Files" },
      { "<leader>fb",  "<cmd>lua require('telescope.builtin').buffers{}<cr>",      desc = "Find Buffers" },
      { "<leader>fw",  "<cmd>lua require('telescope.builtin').live_grep{}<cr>",    desc = "Look for Word" },
      { "<leader>fr",  "<cmd>lua require('telescope.builtin').oldfiles{}<cr>",     desc = "Recent Files" },
      { "<leader>fc",  "<cmd>lua require('telescope.builtin').commands{}<cr>",     desc = "Commands" },
      { "<leader>fm",  "<cmd>lua require('telescope.builtin').man_pages{}<cr>",    desc = "Man Pages" },
      { "<leader>fgf", "<cmd>lua require('telescope.builtin').git_files{}<cr>",    desc = "Git Files" },
      { "<leader>fgb", "<cmd>lua require('telescope.builtin').git_branches{}<cr>", desc = "Git Branches" },
    },
    opts = function()
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")
      return {
        defaults = themes.get_ivy({
          layout_config = {
            preview_cutoff = 1,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
            }
          }
        }),
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}
