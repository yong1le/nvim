return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = "all",
      auto_install = true,
      autotag = {
        enable = true,
        enable_close_on_slash = false,
      },
      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "latex" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "+",
          node_incremental = "+",
          node_decremental = "-",
        },
      },
      textobjects = {
        select = {
          enable = true,
          -- Jump to next occurence
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["if"] = { query = "@function.inner", desc = "Select inside function" },
            ["ac"] = { query = "@class.outer", desc = "Select around class" },
            ["ic"] = { query = "@class.inner", desc = "Select inside class" },
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          include_surrounding_whitespace = true,
        },
        move = {},
        swap = {},
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      vim.g.skip_ts_context_commentstring_module = true
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Extend textobjects using TS
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    version = false,
    opts = {
      custom_textobjects = nil,
      mappings = {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",

        -- Move cursor to corresponding edge of `a` textobject
        goto_left = "g[",
        goto_right = "g]",
      },
      n_lines = 50,
      search_method = "cover_or_next",
      silent = false,
    },
  },
}
