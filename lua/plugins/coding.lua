return {
  -- Comment many lines
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('Comment.api').toggle.linewise.count((vim.v.count > 0 and vim.v.count or 1))<cr>",
        desc = "Toggle Comment",
      },
      {
        "<leader>/",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Toggle Comment in Selection",
        mode = "v",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Change comment types based on context
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },

  -- Autoclose parentheses
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      map_cr = true,
      map_bs = true,
      fast_wrap = {
        map = "<M-w>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  -- No more hold on pressing 'j'
  {
    "max397574/better-escape.nvim",
    event = { "InsertCharPre" },
    opts = {
      mapping = { "jk" },
    },
    config = function(_, opts)
      require("better_escape").setup(opts)
    end,
  },

  -- Enhanced global marks jumping
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>h", function() require("harpoon"):list():append() end, desc = "Add Harpoon Breakpoint"},
      { "<leader><leader>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Open Harpoon"}
    },
    config = function(_, opts)
      require("harpoon"):setup(opts)
    end,
  },
}
