return require('packer').startup(function(use)
  
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Add Telescope and Plenary
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use 'kevinhwang91/rnvimr'

  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use ('nvim-treesitter/nvim-treesitter', {run  = ':TSUpdate'})

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
}


end)
