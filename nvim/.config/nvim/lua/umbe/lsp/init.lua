vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

require("umbe.lsp.sumneko_lua")
require("umbe.lsp.go")
require("umbe.lsp.tsserver")
require("umbe.lsp.omnisharp")
require("umbe.lsp.bash")
require("umbe.lsp.svelte")
require("umbe.lsp.docker")
require("umbe.lsp.tailwindcss")
require("umbe.lsp.nullls")
require("umbe.lsp.json")
