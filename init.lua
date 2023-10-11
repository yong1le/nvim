if vim.g.vscode then
  require "vscode.options"
  require "vscode.lazy"
  require "vscode.autocmds"
  require "vscode.keymaps"
else
  require 'config.options'
  require 'config.lazy'
  require 'config.autocmds'
  require 'config.keymaps'
end
