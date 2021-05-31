-- /usr/local/lib/node_modules/pyright
-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {"/usr/local/lib/node_modules/pyright", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true

        })
    }
}
