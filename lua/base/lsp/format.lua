local null_ls = require('null-ls')

null_ls.setup({
  sources = {}
})

require('mason-null-ls').setup({
  ensure_installed = {
    'prettier',
    'black',
    'google-java-format'
  },
  automatic_installation = false,
  handlers = {},
})

return {}
