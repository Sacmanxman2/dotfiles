set relativenumber
set number
set numberwidth=3
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'junegunn/goyo.vim'
Plugin 'ying17zi/vim-live-latex-preview'

call vundle#end()
syntax on
filetype plugin indent on

" Scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 2, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 2, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 2, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 2, 2)<CR>

" Vim Notes Options:
let g:notes_directories = ['/mnt/1tb-hdd/Jared\ \&\ Jenna/Dropbox/VimNotes']



set hlsearch

set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8

set incsearch

imap <c-u> <Esc>vwU<Esc>i

inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" Python Template Keybindings
autocmd FileType python inoremap ;d def(<++>):<Enter><++><Enter>return(<++>)<Esc>?f<Enter>a<Space>
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;
autocmd FileType python inoremap ;

" Other Template Keybindings
