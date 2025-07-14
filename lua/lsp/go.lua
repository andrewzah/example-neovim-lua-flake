local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go
require('go').setup {
  lsp_cfg = {
    capabilities = capabilities,
    -- other setups
  },
}

