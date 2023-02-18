return {
  'akinsho/toggleterm.nvim',
  cmd = {
    "ToggleTerm"
  },
  config = function ()
    require'toggleterm'.setup({
      size = 20,
      direction = 'horizontal',
    })
  end
}
