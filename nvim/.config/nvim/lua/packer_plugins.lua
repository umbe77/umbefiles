local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost packer_plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'kabouzeid/nvim-lspinstall'

    --autocomplete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-vsnip'
	use "ray-x/lsp_signature.nvim"

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'

   	use {'lukas-reineke/indent-blankline.nvim'}

	use 'navarasu/onedark.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

	use {
	  'hoob3rt/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

    use 'kyazdani42/nvim-tree.lua'

    --telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-media-files.nvim'

    --git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'

        -- Database
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    use 'terrortylor/nvim-comment'
    use 'liuchengxu/vim-which-key'
    use 'kevinhwang91/nvim-bqf'
    use 'voldikss/vim-floaterm'
    use 'windwp/nvim-autopairs'
    --use 'wfxr/minimap.vim'
end)

