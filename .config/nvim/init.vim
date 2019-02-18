set number
set relativenumber

set expandtab
set nowrap

set tabstop=2
set shiftwidth=2
set softtabstop=2

filetype plugin on

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Enable for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Completion Sources
Plug 'ncm2/ncm2-path'
" Current Buffer
Plug 'ncm2/ncm2-bufword'
" JavaScript 
" Plug 'ncm2/ncm2-tern'
" Go
Plug 'ncm2/ncm2-go'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim' }
" Rust
Plug 'rust-lang/rust.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Discord rich presence
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Completion Manager mappings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>\<Esc>\a" : "\<Tab>"
inoremap <expr> <A-j> pumvisible() ? "\<C-n>" : "\<A-j>"
inoremap <expr> <A-k> pumvisible() ? "\<C-p>" : "\<A-k>"

" Scroll without moving cursor
noremap <expr> <A-j> "\<C-e>"
noremap <expr> <A-k> "\<C-y>"

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> <C-c> y:call ClipboardYank()<cr>
vnoremap <silent> <C-x> d:call ClipboardYank()<cr>
nnoremap <silent> <C-V> :call ClipboardPaste()<cr>p

colo desert
