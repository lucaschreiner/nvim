require'lspconfig'.yamlls.setup{
	cmd = {"/usr/local/lib/node_modules/yaml-language-server", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
}
