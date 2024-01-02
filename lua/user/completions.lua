local cmp = require("cmp")


require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})

-- Completion in dap repl

cmp.setup({
    enable = function ()
        return vim.api.nvim_buf_get_option(0, "buftype")  ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end
})

cmp.setup.filetype({ "dap-repl", "dapup_watches", "dapui_hover" }, {
    sources = {
        {name = "dap" },
    },
})

