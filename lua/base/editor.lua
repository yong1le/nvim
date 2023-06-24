return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    cmd = { 'Neotree', 'NeoTreeRevealToggle' },
    keys = {
      { '<leader>e', '<cmd>NeoTreeRevealToggle<cr>', desc = 'Tree Explorer' }
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        popup_border_style = 'rounded',
        enable_git_status = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf", "toggleterm" },
        default_component_configs = {
          git_status = {
            symbols = {
              renamed = "󰁕",
              unstaged = "󰄱",
            }
          },
          icon = {
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
          },
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
        },
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ["<space>"] = { "toggle_node", nowait = false },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["v"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = { "add", config = { show_path = "none" } },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        }

      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
      },
      window = {
        border = 'single',
      }
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register(opts.defaults)
      wk.register({
        b = { name = "Buffer" },
        f = {
          name = "Find",
          g = { name = "Git" }
        },
        l = {
          name = "LSP",
          j = { name = "Java" }
        },
        d = { name = "Debugger" },
        t = { name = "Terminal" }
      }, { prefix = '<leader>' })
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  },
}
