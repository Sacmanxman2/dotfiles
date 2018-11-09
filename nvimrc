" Main Plugins
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
Plug 'Shougo/context_filetype.vim'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
Plug 'othree/yajs'
"Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

call plug#end()

" Basic settings
set encoding=utf-8
set relativenumber
set title
set laststatus=2
set number
set numberwidth=3
set linebreak
set spelllang=en_us
set spellfile=$HOME/dotfiles/vimSpell/en.utf-8.add
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set breakindent
filetype off
set clipboard+=unnamedplus
set mouse=a
filetype plugin indent on
set hlsearch
set incsearch

" Pretty Stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" move among buffers with CTRL
noremap <C-J> :bnext<CR>
noremap <C-K> :bprev<CR>

" Save shortcut
inoremap <C-S> <c-o>:w<CR>

" Scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 2, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 2, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 2, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 2, 2)<CR>

" Vim notes options:
let g:notes_directories = ['~/01-Synced/VimNotes'] 

" Folding
set foldmethod=syntax
set foldlevel=99
nnoremap <space> za 

" Toggle DeadKeys set (for accent marks):
so ~/dotfiles/deadkeys.vim
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>: call ToggleDeadKeys()<CR>a

" Source IPA shortcuts:
so ~/dotfiles/ipa.vim
nm <leader><leader>i :call ToggleIPA()<CR>
imap <leader><leader>i <esc>:call ToggleIPA()<CR>a

" Misc. global shortcuts
" Uppercase
inoremap <c-u> <Esc>vwU<Esc>i 
inoremap <Space><Space> <Esc>/<++><Enter>:noh<Enter>"_c4l

" Python Template Keybindings
autocmd FileType python inoremap ;d def(<++>):<Enter><++><Enter>return(<++>)<Esc>?f<Enter>:noh<Enter>a<Space>
autocmd FileType python inoremap ;c class :<Enter><Enter>def __init__(self):<Enter><++><Esc>3k0f::noh<Enter>i

" Markdown/website templates
autocmd FileType markdown inoremap ;h ---<ENTER>layout:<Space>post<ENTER>title:<Space><++><Enter>date:<Space><Esc>:put<Space>=strftime('%Y-%m-%d<Space>%H:%M:%S')<Enter>i<Bs><Esc>ocategory:<Space>blog<Esc>$a<Enter>---<Enter><Esc>3ggf<cw
autocmd FileType markdown inoremap <tab> <c-t>

" LaTeX Keybindings & settings
autocmd FileType tex inoremap ;ri \resumeSubheading<ENTER><Tab>{<++>}{<++>}<ENTER>{<++>}{<++>}<ENTER>\resumeItemListStart<ENTER><Tab>\resumeItem{}<ENTER>{<++>}<ENTER><Bs><Bs>\resumeItemListEnd<ENTER><Esc>6k/<++><Enter>:noh<Enter>"_c4l
let g:vimtex_view_method = 'zathura'

" Indentline settings
let g:indentLine_char = '▏'
autocmd FileType sass set tabstop=4
autocmd FileType sass set shiftwidth=4
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_folding = 'expr'

" vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" ragtag
let g:ragtag_global_maps = 1

" Keybindings that allow for visual movement
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:complete_method = "omnifunc"
"if !exists('g:deoplete#opmin#input_patterns')
"    let g:deoplete#omni#input_patterns = {}
"endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose |endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown,vue setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Vim-fake generators
source ~/dotfiles/fakeGen.vim

" Vim javascript options
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1

autocmd FileType html,css,javascript,vue,jsx,ts set softtabstop=2
autocmd FileType html,css,javascript,vue,jsx,ts set tabstop=2
autocmd FileType html,css,javascript,vue,jsx,ts set shiftwidth=2
let g:vue_disable_pre_processors=1

let g:user_emmet_settings = {
    \ 'javascript.jsx' : {
    \   'extends' : 'jsx',
    \},
\}
nmap <leader>ne :NERDTree<cr>

" Set Goyo mode automatically for md files
autocmd FileType markdown :Goyo

