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
      "hrsh7th/cmp-cmdline",
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
          ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehaviorInsert },
          ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehaviorInsert },
          ["<C-n>"] = cmp.mapping(function() snip.expand_or_jump() end, { 'i', 's' }),
          ["<C-p>"] = cmp.mapping(function() snip.jump(-1) end, { 'i', 's' })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "cmdline",  priority = 250 },
          { name = "path",     priority = 100 },
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
      history = true
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
