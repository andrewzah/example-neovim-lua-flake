local capabilities = require('cmp_nvim_lsp').default_capabilities()
local is_npm_package_installed = require('utils').is_npm_package_installed

require('lspconfig').volar.setup {
  capabilities = capabilities,
  -- https://github.com/johnsoncodehk/volar
  filetypes = is_npm_package_installed 'vue' and { 'vue', 'typescript', 'javascript' } or { 'vue' },
}

