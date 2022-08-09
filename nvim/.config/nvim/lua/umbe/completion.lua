require("nvim-autopairs").setup({})
local cmp = require("cmp")
local lspkind = require("lspkind")

require("luasnip/loaders/from_vscode").lazy_load()

---@diagnostic disable-next-line: redundant-parameter
cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			symbol_map = {
				Text = "  ",
				Method = "  ",
				Function = "  ",
				Constructor = "  ",
				Variable = "[]",
				Class = "  ",
				Interface = " 蘒",
				Module = "  ",
				Property = "  ",
				Unit = " 塞 ",
				Value = "  ",
				Enum = " 練",
				Keyword = "  ",
				Snippet = "  ",
				Color = "",
				File = "",
				Folder = " ﱮ ",
				EnumMember = "  ",
				Constant = "  ",
				Struct = "  ",
			},
		}),
	},
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },
		{ name = "orgmode" },
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

local saga = require("lspsaga")
saga.setup()
