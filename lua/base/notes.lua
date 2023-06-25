return {
  "mickael-menu/zk-nvim",
  cmd = {
    "ZkNew", "ZkIndex", "ZkNotes", "ZkTags",
  },
  keys = {
    { "<leader>zo", "<cmd>ZkNotes<cr>",                                   desc = "Open Notes" },
    { "<leader>zi", "<cmd>ZkInsertLink<cr>",                              desc = "Insert Link" },
    { "<leader>zl", "<cmd>ZkLinks<cr>",                                   desc = "Links" },
    { "<leader>zb", "<cmd>ZkBacklinkds<cr>",                              desc = "Backlinks" },
    { "<leader>zt", "<cmd>ZkTags<cr>",                                    desc = "Open Tags" },
    { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New Note" },

  },
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end
}
