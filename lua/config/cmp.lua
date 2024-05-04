local cmp = require("cmp")
local kind = require("lspkind")
local snip = require("luasnip")

local opts = {
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ["<C-n>"] = cmp.mapping(function()
      if snip.expand_or_jumpable() then
        snip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ["<C-p>"] = cmp.mapping(function()
      if snip.jumpable(-1) then
        snip.jump(-1)
      end
    end, { 'i', 's' })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip",  priority = 750 },
    { name = "buffer",   priority = 500 },
    { name = "path",     priority = 250 },
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = kind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = '...',
    })
  }
}

return opts
