require "nvim-autopairs".setup{}
local cmp = require"cmp"
local lspkind = require "lspkind"

cmp.setup({
	formatting = {
		format = lspkind.cmp_format(
		{
			with_text = true,
			maxwidth = 50,
			symbol_map = {
			  Text = '  ',
			  Method = '  ',
			  Function = '  ',
			  Constructor = '  ',
			  Variable = '[]',
			  Class = '  ',
			  Interface = ' 蘒',
			  Module = '  ',
			  Property = '  ',
			  Unit = ' 塞 ',
			  Value = '  ',
			  Enum = ' 練',
			  Keyword = '  ',
			  Snippet = '  ',
			  Color = '',
			  File = '',
			  Folder = ' ﱮ ',
			  EnumMember = '  ',
			  Constant = '  ',
			  Struct = '  '
			},
		})
	},
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
	mapping = {
	  ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<TAB>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-TAB>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  ['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	  })
	},
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
	  { name = 'orgmode' },
    }
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
-- require("nvim-autopairs.completion.cmp").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
--   auto_select = true, -- automatically select the first item
--   insert = false, -- use insert confirm behavior instead of replace
--   map_char = { -- modifies the function or method delimiter by filetypes
--     all = '(',
--     tex = '{'
--   }
-- })
