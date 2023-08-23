return {
  {
    "luukvbaal/statuscol.nvim",
    opts = {
      relculright = true,
      segments = {
        {text = {require("statuscol.builtin").foldfunc}, click = "v:lua.ScFa"},
        {text = {" %s "}, click = "v:lua.ScSa"},
        {text = {require("statuscol.builtin").lnumfunc, " "}, click = "v:lua.ScLa"}
      }
    },
    config = function(_, opts)
      require("statuscol").setup(opts)
    end

  }
}
