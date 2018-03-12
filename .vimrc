"------------------------------------------------------------------------------
"Plugins
"------------------------------------------------------------------------------

if &compatible
  set nocompatible               " Be iMproved
endif
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
Plug 'jamshedVesuna/vim-markdown-preview'
Plug 'xolox/vim-misc'
Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'mattn/emmet-vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-vinegar'
Plug '~/workspace/open-source/vim-vinegar'
Plug 'rhysd/vim-grammarous'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tikhomirov/vim-glsl'
Plug 'mxw/vim-jsx'

Plug 'ryanoasis/vim-devicons'

call plug#end()

"------------------------------------------------------------------------------
"Settings
"------------------------------------------------------------------------------

set autoindent
set smartindent
set backspace=indent,eol,start
set ignorecase
set incsearch
set hlsearch
set smartcase
set laststatus=2
set autoread
set history=1000
set splitright "open splits in way that makes sense
set splitbelow 
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set nobackup
set nowb
set noswapfile
set hidden
set vb
set foldmethod=indent
set foldlevel=99
" set completeopt+=noinsert
set nonumber

set ttyfast

set re=1 "force old regex engine to deal with ruby slowness

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" return to last position after editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"------------------------------------------------------------------------------
"remap
"------------------------------------------------------------------------------

"
" 
" something new

nnoremap j gj
nnoremap k gk

let mapleader=","
let maplocalleader=","

inoremap jk <esc>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap <space> /
nnoremap <leader>n :nohlsearch<cr>
nnoremap <leader>sv :source ~/.vimrc <cr>
nnoremap <leader>vv :vs ~/.vimrc <cr>
nnoremap <leader>vh :sp ~/.vimrc <cr>

command! Tvimrc tabe ~/.vimrc

nnoremap \ :Ag<SPACE>


inoremap<C-h> <C-o>80a-<esc>

nnoremap <C-b> :Buffers<cr>

inoremap <silent><expr> <C-j> "\<C-n>"
inoremap <silent><expr> <C-k> "\<C-p>"

command! Etodo e ~/Dropbox/org/todo.md
command! Vtodo vs ~/Dropbox/org/todo.md
command! Stodo sp ~/Dropbox/org/todo.md

command! Ework e ~/Dropbox/org/working-on.md
command! Vwork vs ~/Dropbox/org/working-on.md
command! Swork sp ~/Dropbox/org/working-on.md

command! Eorg e ~/Dropbox/org
command! Vorg vs ~/Dropbox/org
command! Sorg sp ~/Dropbox/org

command! Ein e ~/Dropbox/org/inbox.md
command! Sin sp ~/Dropbox/org/inbox.md
command! Vin vs ~/Dropbox/org/inbox.md

command! Buffers call fzf#run(fzf#wrap({'source': map(range(1, bufnr('$')), 'bufname(v:val)')}))

nnoremap <leader>d "=strftime("%c")<CR>P
inoremap <leader>d <C-R>=strftime("%c")<CR> 

nnoremap <leader>w I[ ] : 
nnoremap <leader>W o[ ] : 

inoremap <leader>w [ ] : 

nnoremap <leader>c I&<esc>^f[lrxA - <C-R>=strftime("%c")<CR><esc>^x

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nnoremap s *


command! MakeTags silent !ctags -R --exclude=/git --exclude=node_modules .

nnoremap <C-p> :Files<CR> 
nnoremap <C-t> :Tags<cr>

tnoremap <C-f> <C-\><C-n>
tnoremap <C-jk> <C-\><C-n>

tnoremap <C-h> <left>
tnoremap <C-j> <down>
tnoremap <C-k> <up>
tnoremap <C-l> <right>

command! W w




"------------------------------------------------------------------------------
"ui
"------------------------------------------------------------------------------

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 

set guicursor=n-v-c:block,i-ci-ve:ver30
set colorcolumn=79

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" colorscheme solarized
set background=dark
set wildmenu

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set splitright
set splitbelow
set so=7
set lazyredraw 
set guioptions-=r 
set guioptions-=R
set guioptions-=L
set guioptions-=l
set encoding=utf-8
" set cursorline
set nolist
set listchars=trail:.,eol:¬

set clipboard=unnamed
set noshowmode

highlight LineNr ctermfg=darkgray ctermbg=black

"------------------------------------------------------------------------------
"plugin config
"------------------------------------------------------------------------------

highlight clear SignColumn
highlight clear VertSplit

let g:bufExplorerDisableDefaultKeyMapping=1
let g:slime_target = "tmux"
let g:rspec_command = "SlimeSend1 rspec {spec}" 

let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

nnoremap <leader>b :BufExplorer<CR>

let g:bufExplorerDisableDefaultKeyMapping=1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {
        \'ruby': [],
        \ 'javascript': ['eslint'],
        \}
let g:lightline = { 'colorscheme': 'seoul256' }

let NERDShowHidden=1

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" autocmd BufRead,BufNewFile *.vue setlocal filetype=javascript

autocmd BufEnter * ALEDisable

let vim_markdown_preview_hotkey='<C-m>'

" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"   \  'javascript' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}

let g:jsx_ext_required = 0
