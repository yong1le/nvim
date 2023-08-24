return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "nvim-lua/lsp-status.nvim",
  },
  event = "BufEnter",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = { "neo-tree", "toggleterm", "alpha", "Trouble", "dashboard", "lazy", "mason", "help" },
        globalstatus = true
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end
          }
        },
        lualine_b = {},
        lualine_c = {
          'branch',
          {
            'diff',
            symbols = { added = " ", modified = " ", remove = " "},
          },
          'filetype' },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp", 'nvim_diagnostic' },
          },
          "location" },
        lualine_y = {},
        lualine_z = { 'progress' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'branch' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end
}
