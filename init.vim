"""""""""""
" GENERAL "
"""""""""""
syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

""""""""""""""""""""""
" BOOTSTRAP VIM-PLUG "
""""""""""""""""""""""
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !clear
  execute "!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  source ~/.local/share/nvim/site/autoload/plug.vim
endif

"""""""""""""""""""
" HERE BE PLUGINS "
"""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'benekastah/neomake'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'

Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent', {'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim',           {'for': 'haskell'}
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}

" Plug 'bitc/vim-hdevtools',            {'for': 'haskell'}
" Plug 'Twinside/vim-hoogle',           {'for': 'haskell'}

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'morhetz/gruvbox'

call plug#end()

"""""""""""""""
" Keybindings "
"""""""""""""""
let mapleader=' '

nnoremap <leader>es :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>rs :so ~/.config/nvim/init.vim<CR>

noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

noremap <c-s> :w<CR>
nnoremap <leader>s :w<CR>

nnoremap <leader>pi :PlugInstall<CR>

nnoremap <leader>q :q!<CR>

"""""""""""
" Theming "
"""""""""""
set background=dark
colorscheme gruvbox

"""""""""""
" Haskell "
"""""""""""
autocmd! BufWritePost * Neomake

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

map <silent> git :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> gtt :GhcModType<CR>
map <silent> gtc :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
