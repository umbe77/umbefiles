local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.gofmt,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			augroup END
			]])
		end
	end,
})
