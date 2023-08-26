return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = "BufEnter",
  opts = function()
    -- Getting attached lsp clients
    local get_clients = function()
      local clients = vim.lsp.buf_get_clients()
      local lsp_string = ""
      for i, client in ipairs(clients) do
        -- Don't show full if too much clients
        if i >= 3 then
          lsp_string = lsp_string .. ""
          break
        end
        if i == 1 then
          lsp_string = client.name
        else
          lsp_string = lsp_string .. ", " .. client.name
        end
      end
      return lsp_string
    end

    local mode_icons = {
      NORMAL = "󰽻",
      ["O-PENDING"] = "󰥔",
      VISUAL = "󰆐",
      ["V-LINE"] = "󰆐",
      ["V-BLOCK"] = "󰆐",
      SELECT = "󰌇",
      ["S-LINE"] = "󰌇",
      ["S-BLOCK"] = "󰌇",
      INSERT = "󰏫",
      REPLACE = "󰛔",
      ["V-REPLACE"] = "󰛔",
      COMMAND = "󰘳",
      EX = "󰘳",
      MORE = "",
      CONFIRM = "",
      SHELL = "",
      TERMINAL = ""
    }

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
        globalstatus = true
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return mode_icons[str]
            end
          }
        },
        lualine_b = {},
        lualine_c = {
          'branch',
          {
            'diff',
            symbols = { added = " ", modified = " ", remove = " " },
          },
          'filetype' },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp", 'nvim_diagnostic' },
          },
          {
            get_clients,
            icon = ""
          },
          "location"
        },
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
