return {
  {
    "mfussenegger/nvim-dap",
    event = "LspAttach",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text" },
      { "rcarriga/nvim-dap-ui" },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "williamboman/mason-nvim-dap.nvim",
    event = "LspAttach",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensured_installed = {},
        handlers = {}
      })
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function ()
      require('dapui').setup()
    end
  }

}
