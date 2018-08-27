set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'vim-syntastic/syntastic'
Plugin 'lifepillar/vim-mucomplete'

" Python
Plugin 'davidhalter/jedi-vim'

" HTML
Plugin 'rstacruz/sparkup'

" Appearance
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lsdr/monokai'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Buffer Management
Plugin 'Soares/butane.vim'

" Latex
Plugin 'lervag/vim-latex'

Plugin 'jceb/vim-orgmode'
Plugin 'juancamilo-nb/vim-cdproject'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" colors
set t_Co=256
" set completeopt=menu,preview,longest
highlight Pmenu ctermfg=black ctermbg=white

" nerd tree
map <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" line number
set nu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix

syntax on

" Indentation
set autoindent
set cindent
set smartindent
set copyindent

" No line wrapping
set nowrap

set omnifunc=csscomplete#CompleteCSS

if has('gui_running')
  set background=dark
  colorscheme monokai
  let g:airline_theme = 'luna'
  let macvim_skip_cmd_opt_movement = 1
else
  let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline_theme = 'minimalist'
  let g:colors_name = "solarized"
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

set backspace=indent,eol,start

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
noremap <leader>bs :SyntasticToggleMode<CR>

" imap <c-j> <plug>(MUcompleteFwd)
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1
set belloff+=ctrlg

let g:UltiSnipsExpandTrigger="<c-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
