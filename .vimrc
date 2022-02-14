set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'micha/vim-colors-solarized'
Plugin 'pprovost/vim-ps1'
Plugin 'ruanyl/vim-gh-line'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
syntax enable
set background=dark
colorscheme solarized
set autoindent noexpandtab tabstop=4 shiftwidth=4
set number

:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

noremap <Leader>W :w !sudo tee % > /dev/null
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:netrw_banner = 0
let g:netrw_liststyle=3

let g:gh_line_map_default = 0
let g:gh_line_blame_map_default = 1

let g:gh_line_map = '<leader>GH'
let g:gh_line_blame_map = '<leader>GB'

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

set mouse=a

if &term =~ '256Color'
	set t_tut=
endif
let NERDTreeShowHidden=1
