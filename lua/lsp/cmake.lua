local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').cmake.setup {
  capabilities = capabilities
} -- CMake

