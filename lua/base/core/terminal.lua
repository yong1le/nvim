return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Horizontal Terminal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>',   desc = 'Vertical Terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>',      desc = 'Floating Terminal' },
    },
    config = function()
        require('toggleterm').setup({
        close_when_exit = true
      })
    end
  },
}
