require('packer').init({display = {auto_clean = false}})

return require"packer".startup(function(use)
	use 'wbthomason/packer.nvim'

	-- miscellanea
    use 'windwp/nvim-autopairs'

	-- icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- LSP
	use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'kabouzeid/nvim-lspinstall'
    use "ray-x/lsp_signature.nvim"

    use 'terrortylor/nvim-comment'

    --autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'

	-- Colorscheme and connected indent lines
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use 'navarasu/onedark.nvim'
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

	-- orgmode
	use 'kristijanhusak/orgmode.nvim'
	use 'akinsho/org-bullets.nvim'
	use 'lukas-reineke/headlines.nvim'
end)

