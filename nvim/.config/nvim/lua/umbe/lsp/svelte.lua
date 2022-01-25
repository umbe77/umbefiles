local data_path = vim.fn.stdpath('data') 
local srv_command = data_path .. "/lsp_servers/svelte/node_modules/svelte-language-server/bin/server.js"

require'lspconfig'.svelte.setup {
	cmd = { srv_command, "--stdio"},
	on_attach = function()
		require("lsp_signature").on_attach()
	end
}
