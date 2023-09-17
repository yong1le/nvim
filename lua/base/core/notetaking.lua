return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    event = "VeryLazy",
    ft = "norg",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Setup neorg mappings",
        pattern = "norg",
        callback = function(event)
          require("which-key").register({
            i = {
              name = "Insert",
              d = "Insert Date",
              l = { "<cmd>Telescope neorg insert_link<cr>", "Insert Link" },
              f = { "<cmd>Telescope neorg insert_file_link<cr>", "Insert File Link" },
            },
            l = {
              name = "List",
            },
            m = {
              name = "Modes",
              h = "Traverse Heading Mode",
              n = "Norg Mode",
              c = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>", "Looking Glass Mode" },
            },
            n = {
              name = "Note",
              n = "New Note",
              s = { "<cmd>Neorg generate-workspace-summary<cr>", "Generate Workplace Summary" },
              t = { "<cmd>Neorg toc<cr>", "Table of Contents" },
            },
            t = { name = "Task" },
          }, { mode = "n", buffer = event.buf, prefix = "<LocalLeader>" })
        end,
      })
    end,
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {},
        ["core.concealer"] = {
          config = {
            folds = true,
            icon_preset = "diamond",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.journal"] = {
          config = {
            journal_folder = "journal",
            strategy = "flat",
          },
        },
        -- Keep track of notebooks
        ["core.dirman"] = {
          config = {
            index = "index.norg",
            workspaces = {
              uni = "~/Documents/notes/uni",
              project = "~/Documents/notes/project",
            },
            default_workspace = "uni",
          },
        },
        -- Indenting
        ["core.itero"] = {},
        -- Exporting
        ["core.export"] = {},
        -- Summary
        ["core.summary"] = {},
        ["core.esupports.metagen"] = {
          config = {
            type = "auto",
          },
        },
        -- ["core.ui.calendar"] = {},
      },
    },
  },
  {
    "nvim-neorg/neorg-telescope",
    event = { "VeryLazy" },
  },
  {
    "ekickx/clipboard-image.nvim",
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
          affix = "\\includegraphics[width=\\linewidth]{%s}"
        }
      }
    end,
  },
}
