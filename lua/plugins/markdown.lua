return {
  {
    'iamcco/markdown-preview.nvim',
    build = { 'cd app && npm install' },
  },
  {
    "ekickx/clipboard-image.nvim",
    keys = {
      {"<leader>cp", "<cmd>PasteImg<cr>", desc="Paste Image"}
    },
    config = function()
      require 'clipboard-image'.setup {
        default = {
          img_dir = "img",
          img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end,
          affix = "<\n  %s\n>"
        },
      }
    end
  }
}
