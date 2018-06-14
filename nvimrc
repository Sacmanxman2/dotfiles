"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"set termguicolors
set relativenumber
set title
set laststatus=2
set number
set numberwidth=3
set linebreak
set spelllang=en_us
set spellfile=$HOME/dotfiles/vimSpell/en.utf-8.add
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set breakindent
filetype off
set clipboard+=unnamedplus
set mouse=a

if has("autocmd")
  filetype plugin indent on
endif

call plug#begin()

Plug 'rakr/vim-one'
"Plug 'ervandew/supertab'
"Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/goyo.vim'
Plug 'nelstrom/vim-markdown-folding'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'lervag/vimtex'
Plug 'tpope/vim-ragtag'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-pug'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'turbio/bracey.vim'
Plug 'tkhren/vim-fake'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()

colorscheme wal
"set background=dark

let g:airline_theme = 'one'

let g:SuperTabDefaultCompletionType = "context"

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
autocmd FileType python inoremap ;d def(<++>):<Enter><++><Enter>return(<++>)<Esc>?f<Enter>:noh<Enter>a<Space>
autocmd FileType python inoremap ;c class :<Enter><Enter>def __init__(self):<Enter><++><Esc>3k0f::noh<Enter>i

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

" deoplete options
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#opmin#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose |endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Fake generators
call fake#define('sex', 'fake#choice(["male", "female"])')

call fake#define('name', 'fake#int(1) ? fake#gen("male_name")'
                                  \ . ' : fake#gen("female_name")')

call fake#define('fullname', 'fake#gen("name") . " " . fake#gen("surname")')

call fake#define('sentense', 'fake#capitalize('
                        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
                        \ . ' . fake#chars(1,"..............!?"))')

call fake#define('paragraph', 'join(map(range(fake#int(3,10)),"fake#gen(\"sentense\")"))')

call fake#define('lipsum', 'fake#gen("paragraph")')
