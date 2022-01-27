require('packer').init({display = {auto_clean = false}})

return require"packer".startup(function(use)
	use 'wbthomason/packer.nvim'

	-- icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- LSP
	use 'neovim/nvim-lspconfig'
    -- use 'glepnir/lspsaga.nvim'
	use { 'tami5/lspsaga.nvim', branch = 'nvim6.0'}
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    -- use 'kabouzeid/nvim-lspinstall'
	use 'williamboman/nvim-lsp-installer'
    use "ray-x/lsp_signature.nvim"

    use 'terrortylor/nvim-comment'

    --autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/vim-vsnip'
    -- use 'hrsh7th/cmp-vsnip'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Colorscheme and connected indent lines
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'lukas-reineke/indent-blankline.nvim'}
	-- use 'sunjon/shade.nvim'
    use 'navarasu/onedark.nvim'
	-- use 'EdenEast/nightfox.nvim'
	use {
	  'hoob3rt/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Telescope
	use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-media-files.nvim'

	-- git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use 'sindrets/diffview.nvim'

	-- orgmode
	use {'kristijanhusak/orgmode.nvim'}
	use 'akinsho/org-bullets.nvim'
	-- use 'lukas-reineke/headlines.nvim'

	-- terminals
	use 'numToStr/FTerm.nvim'

	-- miscellanea
    use {
		'windwp/nvim-autopairs',
	}
	use {
		'rcarriga/nvim-notify',
		config = function ()
			require"notify".setup{}
		end
	}
	use {
		"AckslD/nvim-neoclip.lua",
		requires = {'tami5/sqlite.lua', module = 'sqlite'},
		config = function()
			require "neoclip".setup{}
		end
	}
	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	  config = function()
		require("todo-comments").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
end)

