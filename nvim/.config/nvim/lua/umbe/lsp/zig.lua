
--local data_path = vim.fn.stdpath("data")
require("lspconfig").zls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function() -- possible values on thid function (client, bufnr)
		require("lsp_signature").on_attach()
	end,
})
