set number
set relativenumber

set expandtab
set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4

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

" copy to system clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction
vnoremap <silent> <C-c> y:call ClipboardYank()<cr>
vnoremap <silent> <C-x> d:call ClipboardYank()<cr>

" parentheses handling
inoremap { {}<Esc>i<CR><Esc>O<Tab>
inoremap [ []<Esc>i
inoremap ( ()<Esc>i

colo desert
