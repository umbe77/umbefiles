local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({ display = { auto_clean = false } })

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	-- LSP
	use("neovim/nvim-lspconfig")
	--[[ use 'glepnir/lspsaga.nvim' ]]
	use({
		"glepnir/lspsaga.nvim",
		opt = true,
		branch = "main",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" }
		}
	})
	use("onsails/lspkind-nvim")
	use("kosayoda/nvim-lightbulb")
	-- use 'kabouzeid/nvim-lspinstall'
	-- use("williamboman/nvim-lsp-installer")use
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use("numToStr/Comment.nvim")
	--autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	-- use 'hrsh7th/vim-vsnip'
	-- use 'hrsh7th/cmp-vsnip'
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Colorscheme and connected indent lines
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use 'karb94/neoscroll.nvim'
	use("windwp/nvim-ts-autotag")
	-- use 'sunjon/shade.nvim'
	use("navarasu/onedark.nvim")
	-- use 'EdenEast/nightfox.nvim'
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	-- git
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("f-person/git-blame.nvim")
	use({ "NeogitOrg/neogit", requires = "nvim-lua/plenary.nvim" })
	use("sindrets/diffview.nvim")

	-- orgmode
	use({
		"nvim-orgmode/orgmode",
	})
	--use({ "kristijanhusak/orgmode.nvim" })
	use("akinsho/org-bullets.nvim")
	-- use 'lukas-reineke/headlines.nvim'

	-- terminals
	use("numToStr/FTerm.nvim")

	-- miscellanea
	use({
		"windwp/nvim-autopairs",
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({})
		end,
	})
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { "tami5/sqlite.lua", module = "sqlite" },
		config = function()
			require("neoclip").setup({})
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
