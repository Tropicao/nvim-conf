require('mason').setup({})
require('mason-lspconfig').setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('mason-lspconfig').setup({
	ensure_installed = { "clangd" },
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({ capabilities = capabilities })
		end,
	},
})

