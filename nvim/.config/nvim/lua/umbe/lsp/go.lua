local data_path = vim.fn.stdpath('data')
require'lspconfig'.gopls.setup{
    cmd = {data_path .. "/lsp_servers/go/gopls"},
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function() -- possible values on thid function (client, bufnr)
		require('lsp_signature').on_attach()
	end,
}
