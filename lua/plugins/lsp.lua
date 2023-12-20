return {
  -- Add dependencies for lua development
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- Installing lsp servers and formatters
  {
    "williamboman/mason.nvim",
    event = { "BufEnter" },
    opts = {
      ui = {
        border = "single",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  -- Auto setup installed lsp servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },

  -- LSP plugin
  {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    init = function()
      require("which-key").register({
        ["<leader>l"] = { name = "LSP" },
      }, {})
    end,
    keys = {
      { "<leader>l", desc = "+LSP" },
      { "<leader>l,", "<cmd>LspStart<cr>", desc = "Start LSP Servers" },
    },
    config = function(_, opts)
      require "config.lspconfig"
    end,
  },

  -- Completion popup
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local opts = require "config.cmp"
      require("cmp").setup(opts)
    end,
  },

  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter" },
    opts = {
      history = false,
      region_check_events = { "InsertEnter" },
    },
    config = function(_, opts)
      require("luasnip").config.setup(opts)
      -- Load all snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }

      -- Extensions
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
    end,
  },
}
