local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').nil_ls.setup {
  capabilities = capabilities,
}

