vim.cmd('let g:nvcode_termcolors=256')

-- vim.g.onedark_style = 'darker'
-- vim.g.onedark_toggle_style_keymap = '<nop>'
-- vim.g.onedark_terminal_italics = 2
-- require('onedark').setup()
-- require('shade').setup()
local nightfox = require('nightfox')
nightfox.setup({
	alt_nc = true,
	styles = {
		comments = "italic",
		keywords = "bold",
		functions = "italic,bold"
	}
})
nightfox.load()
