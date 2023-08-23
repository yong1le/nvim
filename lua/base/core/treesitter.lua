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
      ensure_installed = {}, -- extend in individual language configs
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
          init_selection = "yn",
          node_incremental = "+",
          node_decremental = "-",
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      indent = { enable = true },
      -- TODO: Find out what these are and add them
      textobjects = {},
      move = {},
      swap = {},
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
