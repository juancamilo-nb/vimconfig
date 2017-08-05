set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bonsaiben/bootstrap-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'vim-syntastic/syntastic'

" Python
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'

" HTML
Plugin 'tpope/vim-ragtag'
Plugin 'rstacruz/sparkup'

" Javascript frameworks
Plugin 'burnettk/vim-angular'
Plugin 'leafgarland/typescript-vim'

" Appearance
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lsdr/monokai'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Buffer Management
Plugin 'Soares/butane.vim'

" Latex
Plugin 'lervag/vim-latex'

" Git
Plugin 'tpope/vim-fugitive'


Plugin 'juancamilo-nb/vim-cdproject'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" colors
set t_Co=256
set completeopt=menu,preview,longest
highlight Pmenu ctermfg=black ctermbg=white

" nerd tree
map <C-n> :NERDTreeTabsToggle<CR>
map <leader>r :NERDTreeFind<cr>

" line number
set nu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix

" Indentation
set autoindent
set cindent
set smartindent
set copyindent

" No line wrapping
set nowrap

" Syntax highlighting
syntax on

set omnifunc=csscomplete#CompleteCSS

if has('gui_running')
  set background=dark
  colorscheme monokai
  let g:airline_theme = 'solarized'
  let g:nerdtree_tabs_open_on_gui_startup=0
  let macvim_skip_cmd_opt_movement = 1
else
  let g:colors_name = "monokai"
  let g:airline_theme = 'murmur'
endif

if has("autocmd")
  filetype indent on
endif

" Show status bar
set ls=2

" Show title in console title bar
set title

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Buffers remap
noremap <leader>bd :Bclose<CR>
noremap <leader>bl :ls<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bt :b#<CR>
noremap <leader>bx :Bclose!<CR>
noremap <leader>bh :hide<CR>

" No backups
set nobackup 
set nowritebackup
set noswapfile

if has("gui_running")
  set guioptions-=m
"  set guioptions-=T
  set guioptions-=rL
endif

set hidden
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
noremap <leader>bs :SyntasticToggleMode<CR>
