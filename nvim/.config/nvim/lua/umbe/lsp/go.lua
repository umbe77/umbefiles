--local data_path = vim.fn.stdpath("data")
require("lspconfig").gopls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client) -- possible values on thid function (client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		require("lsp_signature").on_attach()
	end,
})
