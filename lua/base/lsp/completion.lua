-- CMP settings
local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')
cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'nvim_lua' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- ['<tab>'] = cmp_action.luasnip_supertab(),
    -- ['<S-tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-o>'] = cmp.mapping.complete(),
  },
})

return { }
