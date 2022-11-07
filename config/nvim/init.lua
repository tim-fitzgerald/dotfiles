--- Install Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packger_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'preservim/nerdtree'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

--- Vim Options
vim.opt.mouse = 'a'
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = false

-- Plugin Options
vim.NERDTreeShowHidden = 1

--- Key Mappings
vim.keymap.set('n', '<C-b>', ':NERDTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<C-f>', ':Files<CR>', {noremap = true})
