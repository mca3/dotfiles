if empty(glob('~/.config/nvim/autoload/plug.vim'))
        echo "Installing Plug..."
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync
endif

set nocompatible

" Disable loading some builtin plugins
" Probably doesn't actually help anything asides from startup times but my
" computer sucks so I'll do what I can.
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
" let g:loaded_man               = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
" let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

call plug#begin()

" QoL
Plug 'tpope/vim-surround'

" UI
Plug 'junegunn/goyo.vim'

call plug#end()

let mapleader=","
filetype plugin on
syntax on

set clipboard+=unnamedplus
set conceallevel=0
set encoding=utf-8
set laststatus=0 ruler
set magic
set mouse=a
set nofoldenable
set nohlsearch
set wrap showbreak=>\
set scrolloff=4
set lazyredraw updatetime=300
set splitbelow splitright

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev Q q

command! Fws :%s/\s\+$//e

autocmd FileType markdown,text set tw=80
autocmd BufRead,BufNewFile $HOME/doc/diary/.stage Goyo

autocmd FileType tex inoremap ,.ul \begin{itemize}<CR><TAB><CR>\end{itemize}<Up>
autocmd FileType tex inoremap ,.i \item{}<Left>
