return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
      filesystem = {
        window = {
          mappings = {
            ["e"] = "set_root",
            ["-"] = "navigate_up",
          },
        },
      },
    })
  end,
}
