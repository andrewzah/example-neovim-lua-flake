-- Utils contains nvim-api keymap functions
local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local noremap = Utils.noremap

-- Change LSP Signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    nnoremap('gD', vim.lsp.buf.declaration, 'LSP: Go to declaration.', opts)
    nnoremap('gd', vim.lsp.buf.definition, 'LSP: Go to definition.', opts)
    nnoremap('K', vim.lsp.buf.hover, 'LSP: Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.', opts)
    nnoremap('gi', vim.lsp.buf.implementation, 'LSP: Go to implementation.', opts)
    nnoremap('<C-k>', vim.lsp.buf.signature_help, 'LSP: Displays signature information about the symbol under the cursor in a floating window.', opts)
    nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'LSP: Add another project root (workspace) to work in, in the current session.', opts)
    nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: Remove a workspace from the current session.', opts)
    nnoremap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'LSP: List workspaces.', opts)
    nnoremap('<leader>D', vim.lsp.buf.type_definition, 'LSP: Go to type definition.', opts)
    nnoremap('<leader>rn', vim.lsp.buf.rename, 'LSP: Rename the token under the cursor.', opts)
    noremap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: Select a code action available at the current cursor position.', opts)
    nnoremap('gr', vim.lsp.buf.references, 'LSP: Get references of the token under the cursor.', opts)
    nnoremap('<leader>ft', function()
      vim.lsp.buf.format { async = true }
    end, 'LSP: Format buffer.', opts)
  end,
})

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    signs = true,          -- Keep gutter signs
})

