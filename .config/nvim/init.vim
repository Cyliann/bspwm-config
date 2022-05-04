source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vim-markdown.vim

call plug#begin('~/.local/share/nvim/plugged')
Plug 'L04DB4L4NC3R/texgroff.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
call plug#end()

"General settings
set autoindent smartindent expandtab spell spelllang=en_us,pl wildmenu wildmode=longest:full,full

"Key-bindings
let mapleader=" "
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>n :Explore<CR>

nnoremap Q <nop>
nnoremap <Up> gk
nnoremap <Down> gj

"Status Line
set statusline=
set statusline+=%#NonText#
set statusline+=%=
set statusline+=\ %f
set statusline+=\ 
set statusline+=%#CursorLineNr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#IncSearch#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Color settings
colorscheme wal


" Make vim-pandoc-syntax work as standalone plugin
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END


"Goyo Settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


