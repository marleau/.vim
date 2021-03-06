" for pathogen
filetype off
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
filetype plugin indent on           " detect file types

" ===================================================================
" General
" -------------------------------------------------------------------

syntax on               	        " syntax highlighting on
set nocompatible        	        " no compatibility with vi
set cpoptions+=$        	        " dollar sign, showing where change ends
set autoindent          	        " automatically indent
set smartindent         	        " automatically indent lines after opening a bracket in programming languages
set showcmd             	        " show the command being typed
set scrolloff=8         	        " keep 8 lines (top/bottom) for scope
set expandtab           	        " expand tabs
set ts=4                	        " set real tab to 4 spaces
set sw=4                	        " set shift width to 4 spaces
set nostartofline       	        " leave cursor where it was
set backup                          " make backup files
set backupdir=~/.vim/backup         " put back up files in backup dir
set directory=~/.vim/tmp            " put swap files in temp dir
set viewdir=~/.vim/views/           " put view files in views dir
set laststatus=2                    " always show the status line
set wildmenu                        " turn on commandline completion wild style!
set wildmode=list:longest           " turn on wild mode huge list
set visualbell                      " instead of sound, screen flashes
let mapleader=","                   " change the leader from \ to ,
set autoread                        " reload file when changed externally
set fdm=marker                      " use markers {{{1 ... }}}1 for folding
set showmatch                       " show matching parenthesis/brackets
set hlsearch                        " highlight searches
set incsearch                       " do incremental search
set ignorecase                      " ignore case while searching
set smartcase                       " if search contains uppercase, make case sensitive

" ===================================================================
" GUI settings
" -------------------------------------------------------------------

if has("gui_running")
	colorscheme desertEx
    set guifont=Andale\ Mono:h12
	set columns=180
	set lines=55
    set guioptions-=T               " disable the toolbar
else
    colorscheme desert
    set background=dark
endif

" ===================================================================
" Keymaps
" -------------------------------------------------------------------

" ; instead of : for commands
nnoremap ; :

" jk = esc
ino jk <esc> " in insert mode, esc
cno jk <c-c> " in command mode, ctrl+c

" move up/down wrapped line rows, instead of next line
nnoremap j gj
nnoremap k gk

" easily move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" ,v opens .vimrc
" ,vv reloads .vimrc
map <leader>v :vsp ~/.vimrc<cr>
map <leader>vv :source ~/.vimrc<cr>:exe ":echo 'vimrc reloaded'"<cr>

" turn off highlight search
nmap <silent> <leader>/ :silent noh<cr>

" ===================================================================
" Functions
" ------------------------------------------------------------------

" absolute/relative line number toggle
" ctrl+l hotkey
function! g:ToggleNuMode() 
	if(&rnu == 1) 
		set nu 
	else 
		set rnu 
	endif 
endfunc
nnoremap <c-m> :call g:ToggleNuMode()<cr> 

" ===================================================================
" Auto Commands
" -------------------------------------------------------------------

" create folders if dne
silent execute '!mkdir -p $HVOME/.vim/backup'
silent execute '!mkdir -p $HOME/.vim/tmp'
silent execute '!mkdir -p $HOME/.vim/views'

au BufWinLeave * silent! mkview     " save view (folds, cursor, etc)
au BufWinEnter * silent! loadview   " load view

" reload .vimrc after every write
au! BufWritePost ~/.vimrc source %
" for Makefiles
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent
" for html
autocmd BufEnter *.html set et ts=4 sw=4 wm=8 nocindent
" for source code
autocmd BufEnter *.cpp,*.h,*.c,*.java,*.pl,*.py,*.cu,*.cuh,*.rb set et ts=4 sw=4 cindent
" if file begins with #! or has bin, make executable on write
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif
" syntax for cuda files
au BufNewFile,BufRead *.cu,*.cuh set ft=cpp

" ===================================================================
" Plug-in Preferences
" -------------------------------------------------------------------

" indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" NERDtree
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git']
