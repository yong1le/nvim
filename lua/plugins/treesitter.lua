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
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
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
      indent = { enable = true },
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
    },
    config = function(_, opts)
      vim.g.skip_ts_context_commentstring_module = true
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
