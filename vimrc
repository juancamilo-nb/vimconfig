set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'msanders/snipmate.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lsdr/monokai'
Plugin 'lervag/vim-latex'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'juancamilo-nb/vim-cdproject'
Plugin 'Soares/butane.vim'
Plugin 'burnettk/vim-angular'




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


augroup encrypted
  au!
 
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile
 
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
 
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
 
  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
