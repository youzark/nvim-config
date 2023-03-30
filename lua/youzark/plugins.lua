vim.cmd [[packadd packer.nvim]]

require('packer').startup(
	function (use)
	-- -- basic utilities
	-- nvim development
	use 'wbthomason/packer.nvim'
	use 'junegunn/vim-easy-align'
	-- tab line
	use {
		'nvim-lualine/lualine.nvim',
 		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}
	use {
		'lukas-reineke/indent-blankline.nvim'
	}
	use 'kyazdani42/nvim-web-devicons'
	use 'jiangmiao/auto-pairs'
	use 'farmergreg/vim-lastplace'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'python-rope/ropevim'
	use 'voldikss/vim-floaterm'
	use 'morhetz/gruvbox'
	use 'kevinhwang91/rnvimr'
	use 'szw/vim-maximizer'
	use 'uzxmx/vim-widgets'
	use 'skywind3000/asynctasks.vim'
	use 'skywind3000/asyncrun.vim'
	use 'powerman/vim-plugin-AnsiEsc'
	use 'dstein64/vim-startuptime'

	-- -- programming environment components
	-- lsp server and autoCompletion
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- lsp auto installation
			'williamboman/mason.nvim',

			-- bridges mason and nvim-lspconfig to make lsp configuration easier
			'williamboman/mason-lspconfig.nvim',

			-- status updates for lsp
			'j-hui/fidget.nvim',

			-- nvim builtin lsp auto completion
			'folke/neodev.nvim',
		},
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets'
		},
	}
    -- formmating and diagnostic
    use {
        'jose-elias-alvarez/null-ls.nvim',
    }

	-- project management
	use 'tpope/vim-fugitive'

	-- parser & search
	use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
	use 'nvim-telescope/telescope.nvim'
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- auto commentor
	use 'tpope/vim-commentary'

	-- python iteractive
	use 'jpalardy/vim-slime'
	use 'hanschen/vim-ipython-cell'
	use 'jupyter-vim/jupyter-vim'

	-- debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'


	-- -- documenting tool
	-- markdown md [ preview ]
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})

    -- latex
    use({
        'lervag/vimtex'
    })


	-- plantuml [preview]
	use { 'scrooloose/vim-slumlord' }

	-- -- abandoned
	-- test tool
	use {
		'vim-test/vim-test',
		disable = true,
	}

	-- wiki
	use {
		'vimwiki/vimwiki',
        disable = true,
    }


	-- snippets
	use {
		'SirVer/ultisnips',
		disable = true,
	}
	use {
		"fannheyward/telescope-coc.nvim",
		disable = true,
	}
	-- lsp support
	use {
		'neoclide/coc.nvim',
		branch = "release",
		disable = true,
	}
end)
