local data_path = vim.fn.stdpath('data')
local cmd_path = data_path .. "/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server"
require"lspconfig".tailwindcss.setup{
	cmd = { cmd_path, "--stdio"}
}
