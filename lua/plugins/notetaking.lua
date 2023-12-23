return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
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
    end,
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_matchparen_enabled = 0
      vim.g.vimtex_compiler_latexmk = {
        out_dir = "./outputs",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape",
        },
      }
    end,
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
          affix = "\\includegraphics[width=\\linewidth]{%s}",
        },
      }
    end,
  },
}
