local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Rust
-- Helpers for rust-tools
local function ensure_uri_scheme(uri)
    if not vim.startswith(uri, 'file://') then
        return 'file://' .. uri
    end
    return uri
end

local function is_in_workspace(uri)
    uri = ensure_uri_scheme(uri)
    local path = vim.uri_to_fname(uri)
    local workspace_dir = vim.fn.getcwd()

    return vim.startswith(path, workspace_dir)
end

local function filter_diagnostics(diagnostics)
    local filtered_diagnostics = {}
    for _, diagnostic in ipairs(diagnostics) do
        if is_in_workspace(diagnostic.source) then
            table.insert(filtered_diagnostics, diagnostic)
        end
    end
    return filtered_diagnostics
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local rt = require('rust-tools')
rt.setup({
  server = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      -- Hover actions
      nnoremap('<Leader>rt', rt.hover_actions.hover_actions, 'Rust-Tools: Hover Action', { buffer = bufnr })
      -- Code action groups
      nnoremap('<Leader>a', rt.code_action_group.code_action_group, 'Rust-Tools: Code Action Group', { buffer = bufnr })
    end,
    handlers = {
      ['textDocument/publishDiagnostics'] =
        function(err, method, result, client_id, bufnr, config)
          if not result or not result.uri then
            return
          end

          local uri = result.uri
          local bufnr = vim.uri_to_bufnr(uri)

          if not bufnr then
            return
          end

          if is_in_workspace(uri) then
            local diagnostics = vim.lsp.diagnostic.to_severity(result.diagnostics)
            diagnostics = filter_diagnostics(diagnostics)
            vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)
            if vim.api.nvim_buf_is_loaded(bufnr) then
              vim.lsp.diagnostic.set_signs(diagnostics, bufnr, client_id)
            end
          end
        end
      ,
    },
  },
})

