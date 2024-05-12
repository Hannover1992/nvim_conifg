return require('packer').startup(function(use) -- Packer can manage itself
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

    use { "nvim-neotest/nvim-nio" }
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
            { "rafamadriz/friendly-snippets" }


		}
	}


	-- omni sharp
	use { 'Hoffs/omnisharp-extended-lsp.nvim' }

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


	--Wim viki
	use { 'vimwiki/vimwiki' }
	-- REfactor
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"}
		}
	}

	--chat gpt
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup()
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

    -- copilot
    
      -- Your other plugins go here
      use {'github/copilot.vim'}



	--Debugger
	-- use {'mfussenegger/nvim-dap'}
	-- use {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	config = function ()
	-- 		require('dapui').setup()
	-- 	end,
	-- 	requires = {
	-- 		"mfussenegger/nvim-dap"
	-- 	}
	-- }

    use { "rcarriga/nvim-dap-ui", 
		config = function ()
			require('dapui').setup()
		end,
        requires = {"mfussenegger/nvim-dap", 
                    "nvim-neotest/nvim-nio"} }

    use 'folke/neodev.nvim'

--Solarized
use 'shaunsingh/solarized.nvim'

-- not finished yet
use {'theHamsta/nvim-dap-virtual-text',
	config = function ()
		require("nvim-dap-virtual-text").setup()
	end
}

--ZenMode
use {'folke/zen-mode.nvim',
	config = function ()
		require("zen-mode").setup(
		-- {
		-- 	window = {
		-- 		backdrop = 0.95,
		-- 		width = 160, 
		-- 		height = 1, 
		-- 		options = {
		-- 			list = true
		-- 		},
		-- 	},
		-- 	plugins = {
		-- 		options = {
		-- 			enabled = true,
		-- 		},
		-- 		kitty = {
		-- 			enabled = true,
		-- 		},
		-- 	},
		-- }
		)
		-- vim.cmd([[autocmd VimEnter * ZenMode]])
	end
}

end)


