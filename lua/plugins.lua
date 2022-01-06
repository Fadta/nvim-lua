-- If packer not installed then clone it
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- PACKER COMMANDS
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
-- :PackerCompile

-- Remove any disabled or unused plugins
-- :PackerClean

-- Clean, then install missing plugins
-- :PackerInstall

-- Clean, then update and install plugins
-- :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync

-- Loads opt plugin immediately
--:PackerLoad completion-nvim ale

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- First to load so it can start to document
  -- use 'lazytanuki/nvim-mapper' -- document mappings

  -- LANGUAGE FEATURES
  use 'neovim/nvim-lspconfig' -- lsp
  use 'williamboman/nvim-lsp-installer' -- lsp installer
  use 'nvim-lua/lsp-status.nvim' -- library interfacing with lsp
  use 'ray-x/lsp_signature.nvim' -- help when typing functions
  use 'tami5/lspsaga.nvim' -- better lsp. mantained Fork of glepnir/lspsaga.nvim

  -- LANGUAGE EXTRAS
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- helper functions for typescript

  use {'blackCauldron7/surround.nvim',
    config = function()
      require"surround".setup {mappings_style = "sandwich",
      load_keymaps = true}
    end
  }-- Replace surrounding characters

	use 'windwp/nvim-ts-autotag'

    -- auto-completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
	use 'windwp/nvim-autopairs'

  -- NAVIGATION
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  } -- file tree
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  } -- fuzzy file searcher
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  } -- syntax parser
  

  -- Utilities
  use 'L3MON4D3/LuaSnip' -- snippets
  use 'norcalli/nvim-colorizer.lua' -- show hex colors
	use 'famiu/bufdelete.nvim' -- delete buffers easily

  -- AESTHETHICS
  use 'kyazdani42/nvim-web-devicons' -- icons
  use 'catppuccin/nvim' -- theme
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} } -- status bar
  use 'kdheepak/tabline.nvim' -- Tab bar
  use 'onsails/lspkind-nvim' -- Icons on autocomplete

  -- Misc
  use 'andweeb/presence.nvim' -- discord rich presence

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
