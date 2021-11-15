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
  
  -- LANGUAGE FEATURES
  use 'neovim/nvim-lspconfig' -- lsp
  use 'williamboman/nvim-lsp-installer' -- lsp installer

  -- AESTHETHICS
  use 'kyazdani42/nvim-web-devicons'
  use 'catppuccin/nvim'
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use 'kdheepak/tabline.nvim'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
