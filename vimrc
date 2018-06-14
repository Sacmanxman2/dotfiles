set relativenumber
set title
set laststatus=2
set wildmenu
set number
set numberwidth=3
set nocompatible
set linebreak
set spelllang=en_us
set spellfile=$HOME/dotfiles/vimSpell/en.utf-8.add
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set breakindent
filetype off

if has("autocmd")
  filetype plugin indent on
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'junegunn/goyo.vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'Yggdroot/indentLine'
Plugin 'vimwiki/vimwiki'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-ragtag'
Plugin 'scrooloose/nerdtree'
Plugin 'digitaltoad/vim-pug'

let g:SuperTabDefaultCompletionType = "context"

call vundle#end()
syntax on
filetype plugin indent on

" move among buffers with CTRL
noremap <C-J> :bnext<CR>
noremap <C-K> :bprev<CR>

" Scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 2, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 2, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 2, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 2, 2)<CR>

" Vim Notes Options:
let g:notes_directories = ['~/01-Synced/VimNotes']



set hlsearch

set foldmethod=syntax
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Toggle DeadKeys set (for accent marks):
    so ~/dotfiles/deadkeys.vim
    nm <leader><leader>d :call ToggleDeadKeys()<CR>
    imap <leader><leader>d <esc>: call ToggleDeadKeys()<CR>a

" Source IPA shortcuts:
    so ~/dotfiles/ipa.vim
    nm <leader><leader>i :call ToggleIPA()<CR>
    imap <leader><leader>i <esc>:call ToggleIPA()<CR>a

set encoding=utf-8

set incsearch

imap <c-u> <Esc>vwU<Esc>i

inoremap <Space><Space> <Esc>/<++><Enter>:noh<Enter>"_c4l

" Python Template Keybindings
autocmd FileType python inoremap ;d def(<++>):<Enter><++><Enter>return(<++>)<Esc>?f<Enter>a<Space>
autocmd FileType python inoremap ;

" Markdown/website templates
autocmd FileType markdown inoremap ;h ---<ENTER>layout:<Space>post<ENTER>title:<Space><++><Enter>date:<Space><Esc>:put<Space>=strftime('%Y-%m-%d<Space>%H:%M:%S')<Enter>i<Bs><Esc>ocategory:<Space>blog<Esc>$a<Enter>---<Enter><Esc>3ggf<cw
autocmd FileType markdown inoremap <tab> <c-t>

" LaTeX Keybindings
autocmd FileType tex inoremap ;ri \resumeSubheading<ENTER><Tab>{<++>}{<++>}<ENTER>{<++>}{<++>}<ENTER>\resumeItemListStart<ENTER><Tab>\resumeItem{}<ENTER>{<++>}<ENTER><Bs><Bs>\resumeItemListEnd<ENTER><Esc>6k/<++><Enter>:noh<Enter>"_c4l

" Other Template Keybindings

" Indentline settings
let g:indentLine_char = '▏'
autocmd FileType sass set tabstop=4
autocmd FileType sass set shiftwidth=4
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_folding = 'expr'
"let g:vimwiki_list = 

" vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

let g:vimtex_view_method = 'zathura'

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$


