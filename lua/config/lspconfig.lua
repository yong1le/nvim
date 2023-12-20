local servers = require("mason-lspconfig").get_installed_servers()

-- Setup all servers
for _, server in ipairs(servers) do
  require("lspconfig")[server].setup {}
end

-- Diagnostics
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  float = {
    source = true,
  },
}

-- Gutter Icons
local signs = { Error = "✘ ", Warn = "▲ ", Hint = "⚑ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Borders
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local map = vim.keymap.set
    local opt = function(desc)
      return { buffer = ev.buf, desc = desc }
    end

    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt "Hover Documentation")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt "Go to Definition")
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt "Go to Declaration")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt "Go to Implementation")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt "Go to References")
    map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opt "Show Line Diagnostics")
    map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename Symbol" })
    map("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })
    map("n", "<leader>lR", '<cmd>lua require("telescope.builtin").lsp_references{}<cr>', { desc = "LSP References" })
    map(
      "n",
      "<leader>li",
      '<cmd>lua require("telescope.builtin").lsp_implementations{}<cr>',
      { desc = "LSP Implementations" }
    )
  end,
})
