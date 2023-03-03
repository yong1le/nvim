return {
  "CRAG666/code_runner.nvim",
  keys = {
    { "<leader>r", "<cmd>RunFile float<cr>", desc="Run Code", {noremap = true, silent = true } },
  },
  config = function()
    require("code_runner").setup({
      mode = "term",
      focus = true,
      startinsert = true,
      term = {
        position = "bot",
        size = 20,
      },
      float = {
        border = 'single'
      },
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        c = "cd $dir && gcc -std=c99 -Wall $fileName -o $fileNameWithoutExt.o && $dir/$fileNameWithoutExt.o",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt.o && $dir/$fileNameWithoutExt.o",
        python = "cd $dir && python3 $fileName",
      },
    })
  end,
}
