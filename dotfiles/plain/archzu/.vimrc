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

" Powerline status
"   0: never
"	1: only if there are at least two windows (default)
"	2: always
set laststatus=2

let &t_ut=''
" Vim-Plug section
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

    " vim-kitty - kitty config syntax highlighting for vim
        Plug 'fladson/vim-kitty', { 'branch': 'main' }

    " NERDTree - a file system explorer for the Vim editor
    " https://github.com/preservim/nerdtree
        Plug 'preservim/nerdtree'

    " Dracula colorscheme
    Plug 'dracula/vim', {'as':'dracula'}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" vim uses _background coor erase_ even if the terminfo file does not contain the bce capability
" this line prevents this from happening

" Need this line to activate the colorscheme
colorscheme dracula 

" Disable Background Color Erase
if $TERM == "xterm-kitty"
  let &t_ut=''
  set termguicolors
"            let &t_8f = "\e[38;2;%lu;%lu;%lum"
"            let &t_8b = "\e[48;2;%lu;%lu;%lum"
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
"    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
"    let &t_te = &t_te . "\033]110\007\033]111\007"
endif
