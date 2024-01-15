local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yank
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("Highlight Yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("FileType", {
  desc = "Setup Vimtex Keymappings",
  pattern = "tex",
  callback = function(event)
    require("which-key").register({
      name = "Vimtex",
      a = "Show Context Menu",
      C = "Full Clean",
      c = "Clean",
      e = "Show Errors",
      G = "Show Status for All",
      g = "Show Status",
      i = "Show Info",
      I = "Show Full Info",
      k = "Stop VimTeX",
      K = "Stop All VimTeX",
      L = "Compile Selection",
      l = "Compile",
      m = "Show Imaps",
      o = "Show Compiler Output",
      q = "Show VimTeX Log",
      s = "Toggle Main",
      t = "Open Table of Contents",
      T = "Toggle Table of Contents",
      v = "View Compiled Document",
      X = "Reload VimTeX State",
      x = "Reload VimTeX",
    }, { mode = "n", buffer = event.buf, prefix = "<LocalLeader>l" })
  end,
})

autocmd("FileType", {
  desc = "Setup neorg mappings",
  pattern = "norg",
  callback = function(event)
    require("which-key").register({
      [","] = { "<cmd>Neorg toc<cr>", "Table of Contents" },
      i = {
        name = "Insert",
        d = "Insert Date",
        l = { "<cmd>Telescope neorg insert_link<cr>", "Insert Link" },
        f = { "<cmd>Telescope neorg insert_file_link<cr>", "Insert File Link" },
      },
      j = {
        t = { "<cmd>Neorg journal today<cr>", "Create Journal for Today"}
      },
      l = {
        name = "List",
      },
      m = {
        name = "Modes",
        l = "Traverse Link",
        h = "Traverse Heading Mode",
        n = "Norg Mode",
        c = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>", "Looking Glass Mode" },
      },
      n = {
        name = "Note",
        n = "New Note",
        s = { "<cmd>Neorg generate-workspace-summary<cr>", "Generate Workplace Summary" },
      },
      t = { name = "Task" },
    }, { mode = "n", buffer = event.buf, prefix = "<LocalLeader>" })
  end,
})

autocmd("FileType", {
  desc = "Change tab mapping on norg files",
  pattern = "norg",
  callback = function()
    vim.keymap.set("n", "<tab>", "za", { desc = "Toggle fold" })
  end,
})
