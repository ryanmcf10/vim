source $VIMRUNTIME/defaults.vim

" {{{ Settings

set shell=C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe\ -executionpolicy\ bypass
set nocompatible

set nobackup
set nowritebackup
set noswapfile

set ignorecase
set smartcase
set autoindent
set smartindent
filetype indent on

set autoread
set number

set encoding=utf-8
scriptencoding utf-8

set guifont=Menlo\ Regular:h18

set hidden
set history=100

set nowrap
set tabstop=4
set shiftwidth=4
set expandtab

set showtabline=2
set lines=35 columns=130

set hlsearch
set showmatch

set laststatus=2

set incsearch

set wildignore=*.o,*.obj,*.bak,*.exe

set noshowmode

set softtabstop=4 expandtab

set path+=**

syntax enable

" }}}

" {{{ Key mappings

let mapleader=" "

" Space + s -- reload .vimrc
map <leader>s :source ~/.vimrc<CR>

" Space + Space -- toggle folds
nnoremap <Leader><Leader> za

" Press 'esc' to unhighlight searched terms
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" }}}

" {{{ Autocmd
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

autocmd BufNewFile *.html 0r ~/skeletons/skeleton.html
" }}}

" {{{ Plug-ins

" {{{ Pathogen
execute pathogen#infect()
" }}}

" {{{ Lightline
let g:lightline = {
      \ }
" }}}

" {{{ NERDTree

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

" }}}

" {{{ Matchit

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" }}}

" }}}

" {{{ Colors
hi Visual ctermfg=Black ctermbg=Blue
hi LineNr ctermfg=Gray
hi VertSplit ctermfg=Black ctermbg=Gray
" }}}

" {{{ Functions
" {{{ InsertTabWrapper
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}}
" }}}
