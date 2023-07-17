return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Add Telescope and Plenary
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use 'kevinhwang91/rnvimr'
end)
