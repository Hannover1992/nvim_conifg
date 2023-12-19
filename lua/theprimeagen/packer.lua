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

		use('ThePrimeagen/harpoon')

		use( 'mbbill/undotree')
		use( 'tpope/vim-fugitive')

		use {
				"terrortylor/nvim-comment",
				cmd = "CommentToggle",
				config = function()
						require("nvim_comment").setup()
				end,
		}


		use {
				'VonHeikemen/lsp-zero.nvim',
				branch = 'v3.x',
				requires = {
						--- Uncomment these if you want to manage LSP servers from neovim

						-- LSP Support
						{'neovim/nvim-lspconfig'},
						{'williamboman/mason.nvim'},
						{'williamboman/mason-lspconfig.nvim'},

						-- Autocompletion
						{'hrsh7th/nvim-cmp'},
						{'hrsh7th/cmp-buffer'},
						{'hrsh7th/cmp-path'},
						{'saadparwaiz1/cmp_luasnip'},
						{'hrsh7th/cmp-nvim-lsp'},
						{'hrsh7th/cmp-nvim-lua'},

						{'hrsh7th/cmp-nvim-lsp'},
						-- Snippet
						{'L3MON4D3/LuaSnip'},
						{'rafamadriz/friendly-snippets'},


				}
		}



		-- stable version
		use {"shortcuts/no-neck-pain.nvim", tag = "*" }


		-- auto save
		use({
				"Pocco81/auto-save.nvim",
				config = function()
						require("auto-save").setup {
								-- your config goes here
								-- or just leave it empty :)
						}
				end,
		})

		--Debugger
		use {'mfussenegger/nvim-dap'}
		use {"rcarriga/nvim-dap-ui", require = {"mfussenegger/nvim-dap"}}
		use {'theHamsta/nvim-dap-virtual-text'}
		require('dapui').setup()

		--Wim viki
		use ({ 'vimwiki/vimwiki'})
		--
		--
		-- REfactor
		use {
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{"nvim-lua/plenary.nvim"},
				{"nvim-treesitter/nvim-treesitter"}
			}
		}




end)


