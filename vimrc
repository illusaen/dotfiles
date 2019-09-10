if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

autocmd VimEnter *
      \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall | q
      \| endif

set t_Co=256
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

syntax on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set backspace=indent,eol,start
set number
set ttyfast
set wrap
set smartcase
set showmatch
set hlsearch
set fileformat=unix
set textwidth=79

filetype on
filetype indent on
autocmd FileType python setlocal ts=4 sts=4 sw=4
au! BufRead,BufNewFile *.py setfiletype python

map <C-n> :NERDTreeToggle<CR>

let g:tmux_navigator_save_on_switch = 1
