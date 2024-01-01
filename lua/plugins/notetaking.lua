return {
  {
    "dfendr/clipboard-image.nvim",
    cmd = { "PasteImg" },
    config = function()
      require("clipboard-image").setup {
        default = {
          img_dir = "assets",
          img_dir_txt = "assets",
          img_name = function()
            return os.date "%Y-%m-%d-%H-%M-%S"
          end,
          affix = "<\n  %s\n>",
        },
        norg = {
          img_dir = "assets",
          img_dir_txt = "assets",
          affix = "{/ %s}",
        },
        tex = {
          img_dir = "assets",
          img_dir_txt = "assets",
          affix = "\\includegraphics[width=\\linewidth]{%s}",
        },
      }
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    event = "VeryLazy",
    ft = "norg",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {},
        ["core.concealer"] = {
          config = {
            folds = false,
            icon_preset = "diamond",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.itero"] = {},
        ["core.export"] = {},
        ["core.summary"] = {},
        ["core.esupports.metagen"] = {
          config = {
            type = "auto",
          },
        },
      },
    },
  },
  {
    "nvim-neorg/neorg-telescope",
    event = { "VeryLazy" },
  },
}
