local capabilities = require('cmp_nvim_lsp').default_capabilities()


require('lspconfig').eslint.setup { -- JS/TS
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
}

