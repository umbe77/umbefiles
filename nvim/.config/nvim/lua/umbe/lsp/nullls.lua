local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.gofmt,
		linter.eslint,
	}
})
