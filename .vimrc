call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
Plug 'easymotion/vim-easymotion'
Plug 'ycm-core/YouCompleteMe'
Plug 'ilyachur/cmake4vim'
Plug 'mihaifm/bufstop'

" switch vim to lisp ide
Plug 'wlangstroth/vim-racket'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'jpalardy/vim-slime'

" end of switch vim to lisp ide

" orgmode
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
" end of orgmode

" colorschemes
Plug 'jcherven/jummidark.vim'
Plug 'glepnir/oceanic-material'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'AlessandroYorba/Alduin'
Plug 'morhetz/gruvbox'
" end of colorschemes

" clang_format
Plug 'rhysd/vim-clang-format'

Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/c.vim'

call plug#end()


set guioptions -=m
set guioptions -=T
set guioptions -=L

set number
set expandtab
set tabstop=4
set et
set wrap
set ai
set cin
set ignorecase
set showmatch
set smarttab
set shiftwidth=4
set hlsearch
set incsearch
set nocompatible
set smartindent
set wildmenu
set wildmode=longest:full,full
set relativenumber
syntax on
colorscheme gruvbox

set bg=dark

set encoding=utf-8
set fileencoding=utf-8


autocmd BufRead,BufNewFile *hpp,*cpp set filetype=cpp.doxygen
autocmd BufRead,BufNewFile *h,*c set filetype=c.doxygen

autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_key_list_previous_completion=[]
let g:EasyMotion_smartcase = 1
let g:DoxygenToolkit_commentType = "C++"

"let g:BufstopSpeedKeys = ["<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>"]
"let g:BufstopLeader = ""
let g:BufstopAutoSpeedToggle = 1

map bn :Bufstop<CR>             " get a visual on the buffers
map ba :BufstopModeFast<CR>     " a command for quick switching
map <C-tab>   :BufstopBack<CR>
map <S-tab>   :BufstopForward<CR>
let g:BufstopAutoSpeedToggle = 1       " now I can press ,3,3,3 to cycle the last 3 buffers

let g:cmake_reload_after_save = 0
let g:cmake_cxx_compiler = 'g++'
let g:cmake_c_compiler = 'gcc'

let g:clang_format#style_options = {
    \ "BasedOnStyle" : "Google",
    \ "Standard" : "Latest"}
map <C-l> :ClangFormat<CR>

let maplocalleader = "\\"

let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

map <Tab> <Plug>(easymotion-prefix)
map <Leader>k <Plug>(easymotion-k)
map <Leader>j <Plug>(easymotion-j)

"nmap s <Plug>(easymotion-s2)
"nmap t <Plug>(easymotion-t2)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" map n <Plug>(easymotion-next)
" omap N <Plug>(easymotion-prev)
