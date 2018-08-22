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
Plugin 'airblade/vim-gitgutter' " git diff thing
Plugin 'terryma/vim-multiple-cursors' " write at several places at a time
Plugin 'scrooloose/nerdtree' " file explorer
Plugin 'ervandew/supertab' " tab completion

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader = ","
let localmapleader = "-"

" fix tab indent thing
set tabstop=4 shiftwidth=4 noexpandtab

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
	autocmd WinEnter * set number relativenumber
	autocmd WinLeave * set nonumber
augroup END

" syntax highlighting
syntax on

" when starting vim without file, start nerdtree and set wd to projects dir
augroup nerdtree
	autocmd!
	autocmd VimEnter * if argc() == 0 | cd ~/Files | NERDTree | endif
augroup END

"jump to start/end of line map
nnoremap <S-h> 0
nnoremap <S-l> $
vnoremap <S-h> 0
vnoremap <S-l> $

" edit vimrc map
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>

" regex
nnoremap <leader>re :OverCommandLine<cr>%s/
vnoremap <leader>re :OverCommandLine<cr>s/\%V
nnoremap <leader>lre :OverCommandLine<cr>s/
" quoute word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" turn of highlight after search
nnoremap <leader>nh :nohls<cr>

" window size
nnoremap <leader>wh <C-w>+
nnoremap <leader>wl <C-w>-
nnoremap <leader>wn <C-w><
nnoremap <leader>ww <C-w>>

"copy to clipboard
vnoremap <C-c> "*y

" disable swap files
set noswapfile

" fast scroll
nnoremap <C-k> 2k
nnoremap <C-j> 2j

" comment out map
augroup comment_out
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
augroup END

" auto bracket indent and so forth FIX IT
"autocmd FileType java :iabbrev <buffer> psvmsa public<space>static<space>void<space>main(String[]<space>args)<space>{<cr>}<esc>kA<cr><BS>

" search
nnoremap <C-f> /
onoremap <C-f> /

" get double parenhteses etc
augroup double_parenth
	autocmd!
	autocmd FileType python,java inoremap <buffer> ( ()<left>
augroup END

" open nerdtree
nnoremap <leader>nt :NERDTree<cr>

" statusline
set statusline=%f
" right side
set statusline+=%=
set statusline+=col:\ %-6c
set statusline+=\ line:\ 
set statusline+=%l
set statusline+=/
set statusline+=%L\ 
