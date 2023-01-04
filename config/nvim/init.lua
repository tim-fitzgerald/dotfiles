----- Install Packer
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
	use 'preservim/nerdcommenter'
	use 'neovim/nvim-lspconfig'
	use 'ryanoasis/vim-devicons'
	use 'hashivim/vim-terraform'
	use 'tpope/vim-endwise'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)

--- Configure LSP
require'lspconfig'.solargraph.setup{}
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = {noremap = true, silent = true, buffer=bufnr}
	vim.keymap.set('n', '<C-p>', vim.lsp.buf.formatting, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
end
--

--- Configure Treesitter
require'nvim-treesitter'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
--

--- Configure Hop
local hop = require('hop')
hop.setup()
vim.keymap.set('', 'w', function()
	hop.hint_words()
end, {remap=true})
vim.keymap.set('', 's', function()
	hop.hint_lines()
end, {remap=true})
--

--- Vim Options
vim.opt.mouse = 'a'
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.encoding = 'UTF-8'
vim.api.nvim_command('filetype plugin on')

-- Plugin Options
vim.NERDTreeShowHidden = 1
vim.NERDCreateDefaultMappings = 1

--- Key Mappings
vim.keymap.set('n', '<C-b>', ':NERDTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<C-f>', ':Files<CR>', {noremap = true})
