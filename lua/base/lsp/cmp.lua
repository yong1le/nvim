return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
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
            elseif snip.expand_or_jumpable() then
              snip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snip.jumpable(-1) then
              snip.jump(-1)
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
          format = kind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      }

      return opts
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter" },
    opts = {
      history = true,
      region_check_events = { "InsertEnter" },
    },
    config = function(_, opts)
      require("luasnip").config.setup(opts)
      -- Load all snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } }

      -- Extensions
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
    end,
  }
}
