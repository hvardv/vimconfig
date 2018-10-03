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
Plugin 'tpope/vim-surround' " for surrounding chars like () '' etc
Plugin 'vim-syntastic/syntastic' " syntax checker
Plugin 'junegunn/fzf' " file fuzzy finder
Plugin 'junegunn/fzf.vim' " file fuzzy finder. Needs 2 plugins..

" All of your Plugins must be added before the following line 
call vundle#end()            " required 
filetype plugin indent on    " required 

let mapleader = "," 
let localmapleader = "-" 

" fix tab indent thing 
let indent_width = 4 " default
let &tabstop = indent_width 
let &shiftwidth = indent_width 
let &softtabstop = indent_width 
set expandtab 

augroup indent_width
    autocmd!
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html setlocal shiftwidth=2 
    autocmd FileType html setlocal softtabstop=2 
    autocmd FileType html set expandtab 
augroup END


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
    autocmd WinEnter * hi StatusLine ctermbg=black ctermfg=green
    autocmd WinLeave * set nonumber norelativenumber
augroup END

augroup status_line
    autocmd!
    autocmd WinEnter * setlocal statusline=%t%=\ col:\ %-6c\ line:\ %l/%L\ 
    autocmd WinLeave * setlocal statusline=%t
augroup END

" mapping to see file path in status line
nnoremap <leader>slp :setlocal statusline=%f%=\ col:\ %-6c\ line:\ %l/%L\<cr>

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
onoremap <S-h> 0
onoremap <S-l> $

" edit vimrc map
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

" writing/exiting
nnoremap <leader>wq :wq<cr>
nnoremap <C-s> :syntax off<cr>:w<cr>:syntax on<cr>:echom "Saved file"<cr>
nnoremap <leader>w<leader>w :syntax off<cr>:w<cr>:syntax on<cr>:echom "Saved file"<cr>
nnoremap <leader>q :bd<cr>

" regex search replace
nnoremap <leader>rer :OverCommandLine<cr>%s/
vnoremap <leader>rer :OverCommandLine<cr>s/\%V
nnoremap <leader>lrer :OverCommandLine<cr>s/

" quoute word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" turn of highlight after search. fucks up everything
"nnoremap <esc> <esc>:nohls<cr>

" window size
nnoremap <leader>wh 5<C-w>+
nnoremap <leader>wl 5<C-w>-
nnoremap <leader>wn 5<C-w><
nnoremap <leader>ww 5<C-w>>

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
nnoremap <C-f> /\c
onoremap <C-f> /\c

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
vnoremap <leader>j J

" status line " not working for single window!
set noruler
set laststatus=2
set statusline=%f%=\ col:\ %-6c\ line:\ %l/%L\ 

" right margin
augroup margin
    autocmd!
    autocmd FileType python,java,html setlocal colorcolumn=90 
    autocmd FileType python,java,html highlight ColorColumn ctermbg=5 
    autocmd FileType python,java,html setlocal nowrap
augroup END

set colorcolumn=90 
highlight ColorColumn ctermbg=5 
setlocal nowrap

" remove highligt
nnoremap <leader>nh :nohls<cr>

" quit all
nnoremap <leader>aqq :qa!<cr>

" vsplit map
nnoremap <leader>vs :vsplit<cr>

" init number and statusline
set number relativenumber
" not working for single window!
hi StatusLine ctermbg=black ctermfg=green 

" Make :! behave like bash terminal better
let $BASH_ENV = "~/.bash_aliases"

" Make java packages work with syntastic various projects
let g:syntastic_java_javac_classpath = "~/Files/INF2100/INF2100-asp-interpretor/no/uio/ifi/asp/classes"
let g:syntastic_java_javac_classpath += ":~/Android/Sdk/platforms/android-24/*.jar"

" parenth and other doubles help
inoremap () ()<esc>i
inoremap [] []<esc>i
inoremap {} {}<esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i
inoremap <> <><esc>i
inoremap (): ():
inoremap (); ();<esc>hi
inoremap ()<space> ()<space>
inoremap ()<cr> ()<cr>

augroup java_short_hand
    autocmd!
    autocmd FileType java abbreviate soprintln System.out.println
    autocmd FileType java abbreviate psvmsa public static void main(String[] args)
    autocmd FileType java inoremap {<cr> {<cr><cr><BS>}<esc>kA<tab>
augroup END

" fuzzy finder map
nnoremap <leader>fz :Files<cr>

" Turn off auto comment insert 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
