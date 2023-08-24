return {
  {
    "luukvbaal/statuscol.nvim",
    opts = {
      ft_ignore = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},
      bt_ignore = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help"},

      relculright = true,
      segments = {
        -- Gitsigns
        {text = {"%s"}, click = "v:lua.ScSa"},
        -- Foldcol
        {text = {require("statuscol.builtin").foldfunc}, click = "v:lua.ScFa"},
        -- numbercol
        {text = {require("statuscol.builtin").lnumfunc, " "}, click = "v:lua.ScLa"},
      }
    },
    config = function(_, opts)
      require("statuscol").setup(opts)
    end

  }
}
