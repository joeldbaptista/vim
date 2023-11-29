" VIMRC

" ------------------- 1. Basics
set encoding=utf-8
let mapleader=" "

" Source: https://vim.fandom.com/wiki/Example_vimrc
set nocompatible
filetype plugin on
syntax on

color codedark
"color minimalist
"color onedark

" set up encoding
set encoding=utf-8
scriptencoding utf-8

set mouse=a					" enable mouse action
set tabstop=4           	" number of columns per tab
set softtabstop=4       
set shiftwidth=4        	" the width of autoindents
set fileformat=unix
set clipboard=unnamedplus
set wildmode=longest,list   " get bash-like tab completions
"set colorcolumn=100         " vertical line at column 80

set showmatch           	" show matching brackets
set autoindent          	" indent a new line the same amount as the line just typed
"set number              	" line numbers
"set relativenumber      	" relative line numbers
set nowrap              	" don't wrap lines
set expandtab           	" convert tabs to spaces
set copyindent
set paste
"set cursorcolumn			" vertical line for cursor
"set cursorline				" horizontal line for cursor

" Make delete work again
set backspace=indent,eol,start

" Set up status line
" set laststatus=2 in your .vimrc to always display the status line. 
" 0 -> never display the status line 
" 1 -> only if there are at least two windows 
" 2 -> always display the status line)
set laststatus=2

" %F - file full name
" %l - line number
" %c - column number
set statusline=%F\ %l\:%c

" different colors for matching parens
" highlight MatchParen gui=bold guibg=NONE guifg=lightblue cterm=bold ctermbg=NONE
hi MatchParen cterm=none ctermbg=green ctermfg=blue

" ------------------- 2. Shortcuts

" Toggle line numbers and relative numbers
nnoremap tr :set rnu!<CR>
nnoremap tn :set nu!<CR>

" Toggle 100th column 
"nnoremap tc :set colorcolumn=100!<CR>

" Toggle line numbers & relative line numbers
nnoremap tc :set cursorcolumn!<CR>
nnoremap tl :set cursorline!<CR>

" Clear search
"nnoremap cs :noh<CR>

" Working with **t**abs
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>te :tabedit<CR>

" Split
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Working with **p**anels (windows)
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

" Resize windows
nnoremap + <cmd>vertical resize +2<CR>
nnoremap - <cmd>vertical resize -2<CR>
nnoremap <leader>+ <cmd>horizontal resize +1<CR>
nnoremap <leader>- <cmd>horizontal resize -1<CR>

" Open terminal
nnoremap <leader>st :! st -n fterm -g 120x40<CR>

" Change cursor in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd InsertEnter,InsertLeave * set cul!

