"set char
set encoding=utf-8
scriptencoding utf-8
set fenc=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set ambiwidth


"set
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set spell
set wildmenu
set history=5000

"indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"style
set number
set cursorline
set ruler
set showmatch
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

"custom
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

"color
syntax on

"plugins
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"----------------------------------------------------------
"plugins
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
"----------------------------------------------------------
call neobundle#end()
NeoBundleCheck

filetype plugin indent on

"---------------------------------------------------------
"plugins set

" molokai
if neobundle#is_installed('molokai')
    colorscheme molokai
endif

set t_Co=256
syntax enable

"lightline
set laststatus=2
set showmode
set showcmd
set ruler 

