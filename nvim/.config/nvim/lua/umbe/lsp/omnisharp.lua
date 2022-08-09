local pid = vim.fn.getpid()
local data_path = vim.fn.stdpath('data')

local omnisharp_bin = data_path .. "/mason/packages/omnisharp/omnisharp"

require'lspconfig'.omnisharp.setup{
    cmd ={ omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(_, _)
		require('lsp_signature').on_attach()
	end,
}

