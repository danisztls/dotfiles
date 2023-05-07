local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  -- see: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  sources = cmp.config.sources(
    {
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'emoji' },
      { name = 'latex_symbols' },
      { name = 'calc' },
      { name = 'treesiter' },
      { name = 'tmux' },
      { name = 'digraphs' },
      { name = 'nerdfont' }
    },

    {
      { name = 'buffer' },
    }
  )
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline'}}
  )
})
