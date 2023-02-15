return {
  "CRAG666/code_runner.nvim",
  keys = {
    -- { "<leader>rr", "<cmd>RunCode<cr>", { desc =  "Run Code" , noremap = true, silent = true } },
    -- { "<leader>r", "<cmd>RunFile term<cr>", { desc =  "Run File in Terminal" , noremap = true, silent = true } },
    { "<leader>r", "<cmd>RunFile float<cr>", desc="Run Code", {noremap = true, silent = true } },
    -- { "<leader>rc", "<cmd>RunFile float<cr>", { desc =  "Close Run" , noremap = true, silent = true } },
  },
  config = function()
    require("code_runner").setup({
      mode = "float",
      focus = true,
      startinsert = true,
      term = {
        position = "bot",
        size = 12,
      },
      float = {
        border = 'single'
      },
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        c = "cd $dir && gcc -std=c99 -Wall -Werror $fileName -o $fileNameWithoutExt.o && $dir/$fileNameWithoutExt.o",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt.o && $dir/$fileNameWithoutExt.o",
        python = "cd $dir && python3 $fileName",
      },
    })
  end,
}
