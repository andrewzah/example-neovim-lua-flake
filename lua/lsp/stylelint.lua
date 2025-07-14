local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').stylelint_lsp.setup { -- CSS/SCSS/Less
  capabilities = capabilities,
  settings = {
    stylelintplus = {
      -- Config to remove warnings for tailwindcss
      config = {
        ['at-rule-no-unknown'] = {
          true,
          {
            ignoreAtRules = {
              'apply',
              'layer',
              'responsive',
              'screen',
              'tailwind',
              'variants',
            },
          },
        },
        ['declaration-block-trailing-semicolon'] = 'null',
        ['no-descending-specificity'] = 'null',
      }
    }
  },
  root_dir = require('lspconfig').util.root_pattern('.git'),
}

