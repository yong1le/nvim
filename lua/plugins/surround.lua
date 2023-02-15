return {
  "kylechui/nvim-surround",
  keys = {
    {"ys", desc="Add Surrounding"},
    {"ds", desc="Delete Surrounding"},
    {"cs", desc="Change Surrounding"},
    {"S",  mode="v", desc="Block Surrounding"},
  },
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
