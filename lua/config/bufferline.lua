return {
  options = {
    mode = "buffers",
    themable = true,
    numbers = "none",
    close_command = "lua require('mini.bufremove').delete(%d)",
    right_mouse_command = "lua require('mini.bufremove').delete(%d)",
    indicator = {
      style = "none",
    },
    diagnostics = false,
    color_icons = true,
    get_element_icon = function(element)
      local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    move_wraps_at_ends = false,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = false,
      delay = 200,
      reveal = { "close" },
    },
    sort_by = "insert_at_end",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        separator = true,
        text_align = "center",
      },
    },
  },
  	highlights = require("rose-pine.plugins.bufferline")
}
