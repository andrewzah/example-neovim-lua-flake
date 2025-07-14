local capabilities = require('cmp_nvim_lsp').default_capabilities()
local is_npm_package_installed = require('utils').is_npm_package_installed

local get_tsserver_filetypes = function()
  if is_npm_package_installed 'vue' then
    return {
      'javascriptreact',
      'javascript.jsx',
      'typescriptreact',
      'typescript.tsx'
    }
  end
  if is_npm_package_installed 'typescript' then
    return {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx'
    }
  end

  return {
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  }
end

-- Typescript
require('typescript-tools').setup {
  capabilities = capabilities,
  filetypes = get_tsserver_filetypes(),
}

