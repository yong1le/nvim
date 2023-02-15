return {
  "terrortylor/nvim-comment",
  cmd = "CommentToggle",
  config = function()
    require("nvim_comment").setup({
      -- Linters prefer comment and line to have a space in between markers
      marker_padding = true,
      -- should comment out empty or whitespace only lines
      comment_empty = false,
      -- trim empty comment whitespace
      comment_empty_trim_whitespace = true,
      -- Should key mappings be created
      create_mappings = false,
    })
    vim.keymap.set("n", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
    vim.keymap.set("v", "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true })
  end,
}
