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

" Vim-Plug section
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

" Initialize plugin system
call plug#end()
