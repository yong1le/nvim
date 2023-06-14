return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.tex_flavor='latex'
    vim.g.vimtex_quickfix_mode=0
    vim.g.vimtex_compiler_latexmk = {
      out_dir = './outputs',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape'
      },
    }
  end,
  keys = {
    { "<leader>.", "<cmd>:VimtexCompile<cr>", desc = "Compile Latex" },
  }
}
