return {
  {
    "luukvbaal/statuscol.nvim",
    opts = {
      ft_ignore = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},
      bt_ignore = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},

      relculright = true,
      segments = {
        -- numbercol
        {text = {require("statuscol.builtin").lnumfunc, " "}, click = "v:lua.ScLa"},
        -- Gitsigns
        {text = {"%s"}, click = "v:lua.ScSa"},
        -- Foldcol
        {text = {require("statuscol.builtin").foldfunc}, click = "v:lua.ScFa"},
        {text = {"│"}},
      }
    },
    config = function(_, opts)
      require("statuscol").setup(opts)
    end

  }
}
