set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'osyo-manga/vim-over' " highlight search and replace
Plugin 'tpope/vim-fugitive' " git stuff
Plugin 'tomtom/tcomment_vim' " comment plugin
Plugin 'airblade/vim-gitgutter' " git diff thing
Plugin 'terryma/vim-multiple-cursors' " write at several places at a time
Plugin 'scrooloose/nerdtree' " file explorer
Plugin 'ervandew/supertab' " tab completion
Plugin 'nvie/vim-flake8' " python style checker 
Plugin 'easymotion/vim-easymotion' 

" All of your Plugins must be added before the following line 
call vundle#end()            " required 
filetype plugin indent on    " required 
" To ignore plugin indent changes, instead use: 


let mapleader = "," 
let localmapleader = "-" 

" fix tab indent thing 
let indent_width = 4 
let &tabstop = indent_width 
let &shiftwidth = indent_width 
let &softtabstop = indent_width 
set expandtab 

set hidden
set incsearch hlsearch

" make shift between windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" get block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" make more obvious which window active
augroup window_shower
	autocmd!
	autocmd WinEnter * set number relativenumber | hi StatusLine ctermbg=black ctermfg=green | setlocal statusline=%f%=\ col:\ %-6c\ line:\ %l/%L\ 
    autocmd WinLeave * set nonumber norelativenumber | setlocal statusline=%f 
augroup END

" syntax highlighting
syntax on

" when starting vim without file, start nerdtree and set wd to projects dir
augroup nerdtree
	autocmd!
	"autocmd VimEnter * if argc() == 0 | cd $VIMHOME| NERDTree | endif
	autocmd VimEnter * if argc() == 0 | NERDTree | endif
augroup END

"jump to start/end of line map
nnoremap <S-h> 0
nnoremap <S-l> $
vnoremap <S-h> 0
vnoremap <S-l> $

" edit vimrc map
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>

" regex search replace
nnoremap <leader>rer :OverCommandLine<cr>%s/
vnoremap <leader>rer :OverCommandLine<cr>s/\%V
nnoremap <leader>lrer :OverCommandLine<cr>s/

" quoute word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" turn of highlight after search
"nnoremap <esc> <esc>:nohls<cr>

" window size
nnoremap <leader>wh <C-w>+
nnoremap <leader>wl <C-w>-
nnoremap <leader>wn <C-w><
nnoremap <leader>ww <C-w>>

"copy to clipboard
vnoremap <C-c> "+y

" disable swap files
set noswapfile

" fast scroll
nnoremap <S-k> 2k
nnoremap <S-j> 2j
vnoremap <S-k> 2k
vnoremap <S-j> 2j

" auto bracket indent and so forth FIX IT
"autocmd FileType java :iabbrev <buffer> psvmsa public<space>static<space>void<space>main(String[]<space>args)<space>{<cr>}<esc>kA<cr><BS>

" search
nnoremap <C-f> /
onoremap <C-f> /

" get double parenhteses etc FIX BETTER
"augroup double_parenth
	"autocmd!
	"autocmd FileType python,java inoremap <buffer> ( ()<left>
"augroup END

" open nerdtree
nnoremap <leader>nt :NERDTree<cr>

" visual select line
nnoremap vv V

" join line belown with current line
nnoremap <leader>j J

" status line
set statusline=%f%=\ col:\ %-6c\ line:\ %l/%L\ 

" right margin
augroup margin
    autocmd!
    autocmd FileType python,java setlocal colorcolumn=80 
    autocmd FileType python,java highlight ColorColumn ctermbg=5 
    autocmd FileType python,java setlocal nowrap
augroup END

" remove highligt
nnoremap <leader>nh :nohls<cr>

" quit all
nnoremap <leader>aqq :qa!<cr>

" vsplit map
nnoremap <leader>vs :vsplit<cr>
