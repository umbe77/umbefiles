local data_path = vim.fn.stdpath("data")
require("lspconfig").jsonls.setup({
	cmd = {
		data_path
			.. "/mason/packages/json-lsp/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server",
		"--stdio",
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function() -- possible values on thid function (client, bufnr)
		require("lsp_signature").on_attach()
	end,
})
