if v:progname =~? "evim"
  finish
endif

source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set nocompatible              " be iMproved, required
filetype off                  " required
set nu!			      " mostrar num das linhas
map q :quit<CR>		
map <C-w> :w<CR>	
nmap <F2> :%!astyle --mode=c -A1 -s2 -xb -xc -xj -xf -f -p -D -k3 -xd -xW -xV -L -p -xg -P -H -y -w -c -U -S<CR>
nmap <F3> :%!astyle --mode=c -A7 -t -xb -xc -xj -xf -f -p -D -k3 -xW -xV -L -p -xg -P -H -y -w -c -U -S<CR>
map <F4> :make<CR>
set autoindent		      " auto indentar
set incsearch		      " mostra opções da pesquisa
set wildmenu		
set laststatus=2	      " destaca a barra de status
set confirm		      " menu de confirmação
set mouse=a
set title
let g:airline_powerline_fonts = 1
set t_Co=256
set completefunc=emoji#complete
set t_RV=
set nobackup
set nowritebackup

autocmd VimEnter * colorscheme  af
autocmd VimEnter * AirlineTheme powerlineish

" iniciar nerdtree ao abrir o vim
" autocmd VimEnter * NERDTree

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'kien/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/terminus'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'neoclide/coc.nvim'
" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on  
