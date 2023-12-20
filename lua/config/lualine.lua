-- Getting attached lsp clients
local get_clients = function()
  local clients = vim.lsp.get_active_clients()
  local ft = vim.api.nvim_buf_get_option(0, "filetype")

  -- If no clients are attached
  if next(clients) == nil then
    return "No Active LSP"
  end

  local lsp_string = ""
  local i = 1;
  for _, client in ipairs(clients) do
    local client_ft = client.config.filetypes

    if client_ft and not vim.tbl_contains(client_ft, ft) then
      goto continue
    end

    if string.len(client.name)>= 20 then
      goto continue
    end

    -- Don't show all clients if too much clients
    if string.len(lsp_string .. client.name) >= 25 then
      lsp_string = lsp_string
      ..
      ", "
      ..
      string.sub(
        client.name,
        1,
        string.len(lsp_string .. client.name) - 25
      )
      ..
      " "
      break
    end
    if i == 1 then
      lsp_string = client.name
    else
      lsp_string = lsp_string .. ", " .. client.name
    end
    i = i + 1

    ::continue::
  end
  return lsp_string
end

local mode_icons = {
  [ "NORMAL" ] = "󰽻",
  ["O-PENDING"] = "󰥔",
  [ "VISUAL" ] = "󰆐",
  ["V-LINE"] = "󰆐",
  ["V-BLOCK"] = "󰆐",
  [ "SELECT" ] = "󰌇",
  ["S-LINE"] = "󰌇",
  ["S-BLOCK"] = "󰌇",
  [ "INSERT" ] = "󰏫",
  [ "REPLACE" ] = "󰛔",
  ["V-REPLACE"] = "󰛔",
  [ "COMMAND" ] = "󰘳",
  [ "EX" ] = "󰘳",
  [ "MORE" ] = "",
  [ "CONFIRM" ] = "",
  [ "SHELL" ] = "",
  [ "TERMINAL" ] = "",
}

return {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return mode_icons[str]
        end,
      },
    },
    lualine_b = {},
    lualine_c = {
      "branch",
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
      "filetype",
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp", "nvim_diagnostic" },
      },
      {
        get_clients,
        icon = "",
      },
      "location",
    },
    lualine_y = {},
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "branch" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
