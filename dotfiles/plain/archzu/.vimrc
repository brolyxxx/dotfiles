unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Display line numbers on the left
set number

" Enable word wrapping
set wrap

" When warp is enabled, avoid breaking words
set linebreak

" Every wrapped line will continue indented
set breakindent

" Highlight all search matches
set hlsearch

" Search is case-insensitive
set ignorecase

" Override the 'ignorecase' option if the search pattern contains uppercase characters 
set smartcase

" Tab behaviour
set tabstop=4       " The width of a TAB is set to 4. Still it is a \t. It is just that Vim will interpret it to be having a width of width of 4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces


" Vim-Plug section
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

" Initialize plugin system
call plug#end()
