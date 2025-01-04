" ---------------------------------------------------------------
" SIMPLE VIM CONFIG
" ---------------------------------------------------------------
" Source: https://vimdoc.sourceforge.net/htmldoc/

" ---------------------------------------------------------------
" Configuration starts where
" ---------------------------------------------------------------
syntax on
let mapleader=" "

filetype plugin indent on

set hlsearch
set noswapfile
set nocompatible
set autoindent
set smartindent
set smarttab
set expandtab
set paste
set wildmenu
set number
set nowrap
"set relativenumber
set undofile
"set cursorline
"set cursorcolumn

set undodir=/tmp
set mouse=a

set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamedplus

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

map <F2> :retab <CR> :w <CR>

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//

" ---------------------------------------------------------------
" Status line
" ---------------------------------------------------------------

" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ %l\:\%c\ [\%p%%\]
set laststatus=2

" ---------------------------------------------------------------
" Plugins; make sure you use single quotes
" ---------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
call plug#end()

"" **NOTE** after adding the above to the top of your Vim 
"" configuration file, reload it (:source ~/.vimrc) or restart Vim. 
"" Now run :PlugInstall to install the plugins.
"" For more details, see: 
"" https://github.com/junegunn/vim-plug/wiki/tutorial

" ---------------------------------------------------------------
" Shortcuts and remappings
" ---------------------------------------------------------------

" Toggle line and column highlighting
nnoremap tt :set cursorcolumn!<Bar>set cursorline!<CR>

" Toggle relative lines
nnoremap tr :set rnu!<CR>

" Ctrl+c
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

" Set matching brackets color
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" Be able to yank and paste multiple times
xnoremap p pgvy

" Tabs
nnoremap <space>c :tabclose<CR>
nnoremap <space>n :tabnew<CR>
nnoremap <space>h :tabfirst<CR>
nnoremap <space>j :tabprev<CR>
nnoremap <space>k :tabnext<CR>
nnoremap <space>l :tablast<CR>

" Access tab by index number
function! Gototab(tabnumber)
	if a:tabnumber > 0 && a:tabnumber <= tabpagenr('$')
		execute a:tabnumber . 'tabnext'
	endif
endfunction
for i in range(1, 9)
	execute 'nnoremap <space>' . i . ' :call Gototab(' . i . ')<CR>'
endfor

" Format json
function! FormatJSON()
    execute ':%!jq .'
endfunction

" Navigate the split view easier by pressing:
" ctrl+j, ctrl+k, ctrl+h, or ctrl+l.
nnoremap <c-j> <c-w>j
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" ctrl+up, ctrl+down, ctrl+left, or ctrl+right.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Change cursor in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd InsertEnter,InsertLeave * set nocul

" Python file configuration
au BufNewFile,BufRead *.py set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flagging extraneous whitespace; whitespaces will be red
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.sh match BadWhitespace /\s\+$/

