local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').ccls.setup {
  capabilities = capabilities,
}-- C/C++

