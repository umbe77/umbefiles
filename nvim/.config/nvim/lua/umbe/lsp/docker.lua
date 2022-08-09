local data_path = vim.fn.stdpath("data")
local cmd_path = data_path
	.. "/mason/packages/dockerfile-language-server/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver"
require("lspconfig").dockerls.setup({
	cmd = { cmd_path, "--stdio" },
})
