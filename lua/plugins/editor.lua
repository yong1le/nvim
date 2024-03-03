return {
  -- Remember your keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = { enabled = false },
      },
      window = {
        border = "single",
      },
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },

  -- Navigate seemlessly between vim splits and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  -- Fuzzy finder :>
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = { "Telescope" },
    init = function()
      require("which-key").register({
        ["<leader>f"] = { name = "Find", g = { name = "Git" } },
      }, {})
    end,
    keys = {
      { "<leader>f", desc = "+Find" },
      { "<leader>fg", desc = "+Git" },
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files{}<cr>", desc = "Find Files" },
      { "<leader>fF", "<cmd>lua require('telescope.builtin').find_files{hidden=true}<cr>", desc = "Find All Files" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers{}<cr>", desc = "Find Buffers" },
      { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep{}<cr>", desc = "Look for Word" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles{}<cr>", desc = "Recent Files" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').commands{}<cr>", desc = "Commands" },
      { "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages{}<cr>", desc = "Man Pages" },
      { "<leader>fgf", "<cmd>lua require('telescope.builtin').git_files{}<cr>", desc = "Git Files" },
      { "<leader>fgb", "<cmd>lua require('telescope.builtin').git_branches{}<cr>", desc = "Git Branches" },
    },
    opts = function()
      local themes = require "telescope.themes"
      local actions = require "telescope.actions"
      return {
        defaults = themes.get_ivy {
          layout_config = {
            preview_cutoff = 1,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
    end,
  },

  -- Jump anywhere
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, "<cmd>lua require('flash').jump()<cr>", desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, "<cmd>lua require('flash').treesitter() <cr>", desc = "Flash Treesitter" },
    },
  },

  -- Better Quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- File Management in a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open File Manager" },
    },
    opts = {
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-p>"] = "actions.preview",
        ["<leader>e"] = "actions.close",
        ["-"] = "actions.parent",
        ["="] = "actions.open_cwd",
        ["g."] = "actions.toggle_hidden",
      },
    },
  },

  -- Remove buffers while persisting layout
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
