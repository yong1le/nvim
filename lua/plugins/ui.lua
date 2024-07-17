return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 9999,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      require("kanagawa").load("wave")
    end,
  },

  -- Better select prompts
  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
    opts = {},
  },

  -- Start screen
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function() end,
    config = function()
      local opts = require "config.alpha"
      require("alpha").setup(opts)

      local dashboard = require "alpha.themes.dashboard"
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- Statusbar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    event = "BufEnter",
    config = function()
      local opts = require "config.lualine"
      require("lualine").setup(opts)
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "BufEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      require("which-key").register({
        ["<leader>b"] = { name = "Buffers" },
      }, {})
    end,
    keys = {
      { "<tab>",            "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
      { "<S-tab>",          "<cmd>BufferLineCyclePrev<cr>",   desc = "Previous Buffer" },
      { "<leader>bo",       "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
      { "<leader><leader>", "<cmd>BufferLinePick<cr>",        desc = "Pick Buffer" },
      { "<leader>bp",       "<cmd>BufferLineMovePrev<cr>",    desc = "Move Buffer Forward" },
      { "<leader>bn",       "<cmd>BufferLineMoveNext<cr>",    desc = "Move Buffer Backward" },
    },
    config = function()
      local opts = require "config.bufferline"
      require("bufferline").setup(opts)
    end,
  },

  -- Highlighting Colors
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      enable_tailwind = true
    },
    config = function(_, opts)
      require("nvim-highlight-colors").setup(opts)
    end,

  }
}
