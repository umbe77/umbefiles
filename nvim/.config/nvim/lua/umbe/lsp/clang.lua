
--local data_path = vim.fn.stdpath("data")
require("lspconfig").clangd.setup({
	on_attach = function() -- possible values on thid function (client, bufnr)
		require("lsp_signature").on_attach()
	end,
})
