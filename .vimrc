execute pathogen#infect()

source $VIMRUNTIME/defaults.vim

set nocompatible

set nobackup
set nowritebackup
set noswapfile

set ignorecase
set smartcase

set autoread

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
set shell=C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe\ -executionpolicy\ bypass

set number

set encoding=utf-8
scriptencoding utf-8

"
"
" Tabline Configuration
set showtabline=2

set lines=35 columns=130

set guifont=Menlo\ Regular:h18

let mapleader=" "

" Space + s -- reload .vimrc
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

set hlsearch

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

set showmatch

" Space + Space -- open last file
nnoremap <Leader><Leader> za

set laststatus=2

set incsearch

set wildignore=*.o,*.obj,*.bak,*.exe

set noshowmode

"
"
" Lightline Settings
let g:lightline = {
      \ }

" END Lightline Settings
"
"


"
"
" NERDTree & NERDTreeTab Settings
" Show NERDTree on start up
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | endif
let g:nerdtree_tabs_open_on_console_startup=1

" Close vim if NERDtree is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
" Space + n -- open/close NERDTree
nmap <leader>n :NERDTreeTabsToggle<CR>
" Space + j -- find currently open file in NERDTree
nmap <leader>j :NERDTreeFind<CR>

let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.swo']

" Space + t -- switch to NERDTree or back to editor
nnoremap <Leader>t <C-w>w

" END NERDTree Settings
"
"


"
"
" Set custom colors
hi Visual ctermfg=Black ctermbg=Blue
hi LineNr ctermfg=Gray
hi VertSplit ctermfg=Black ctermbg=Gray

syntax enable

" END custom colors
"
"


function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

set softtabstop=4 expandtab

set path+=**

autocmd BufNewFile *.html 0r ~/skeletons/skeleton.html
