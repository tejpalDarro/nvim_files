require("mason").setup()
require("mason-lspconfig").setup({
    ensured_install = {"lua_ls"}
})

require("mason-lspconfig").setup({
    ensured_install = {"rust_analyzer"}
})

require("mason-lspconfig").setup({
    ensured_install = {"jdtls"}
})

require("mason-lspconfig").setup({
    ensured_install = {"typescript-language-server"}
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
--local on_attach = function(_,_) 
--    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
--    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach;
}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").jdtls.setup {}
require("lspconfig").tsserver.setup {}

