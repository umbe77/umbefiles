local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.gofmt,
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()
			augroup END
			]])
		end
	end,
})
