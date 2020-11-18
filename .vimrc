set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Chiel92/vim-autoformat'
Plugin 'micha/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin indent on
syntax on
syntax enable
set background=dark
colorscheme solarized
set autoindent noexpandtab tabstop=4 shiftwidth=4
set number
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

if !has('nvim')
	set ttymouse=xterm2
	set mouse=a
endif

if &term =~ '256Color'
	set t_tut=
endif
