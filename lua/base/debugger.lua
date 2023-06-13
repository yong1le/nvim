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
      require("mason-nvim-dap").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require('dapui').setup()

      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.after.event_initialized['dapui_config'] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function ()
        dapui.close()
      end
    end
  }

}
