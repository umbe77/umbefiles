local pid = vim.fn.getpid()

local omnisharp_bin = DATA_PATH .. "/lspinstall/csharp/omnisharp/run"

require'lspconfig'.omnisharp.setup{
    cmd ={ omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		require('lsp_signature').on_attach()
	end,
}
