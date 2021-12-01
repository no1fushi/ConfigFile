" set char
set encoding=utf-8
scriptencoding utf-8
set fenc=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" set
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set spell
set wildmenu
set history=5000
set backspace=indent,eol,start

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set list
set listchars=tab:¦_,trail:~,nbsp:~
hi SpecialKey ctermfg=darkmagenta
command I set list!

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" style
set number
set cursorline
set ruler
set showmatch
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

" Custom map
command Ss :split
command P set paste
command Np set nopaste
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap rep %s/before/after/g
cnoremap jc! !javac
cnoremap ja! !java
nnoremap <C-O> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap v $h
inoremap <C-t> <Esc><Left>"zx"zpa
inoremap jj <ESC>
" move
nnoremap j gj
nnoremap k gk
" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" tarm emacs
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Custom Leader
let mapleader = ","
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>vs :vs<CR>
nnoremap <Leader>ss :split<CR>
nnoremap <Leader>h ^
nnoremap <Leader>l $
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\	exe "normal! g'\"" |
	\ endif
endif

" Color
syntax on

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Shougo
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neomru.vim')

" Setting
call dein#add('tomasr/molokai')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('scrooloose/nerdtree')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')

" Search
call dein#add('thinca/vim-visualstar')
call dein#add('haya14busa/incsearch.vim')

" Gosh
call dein#add('aharisu/vim_goshrepl')
call dein#add('aharisu/vim-gdev')

" Ruby
call dein#add('tpope/vim-endwise')
call dein#add('szw/vim-tags')
call dein#add('marcus/rsense')

" HTML
call dein#add('mattn/emmet-vim')
call dein#add('othree/html5.vim')

" CSS
call dein#add('hail2u/vim-css3-syntax')

" JavaScript
call dein#add('jelera/vim-javascript-syntax')
call dein#add('jiangmiao/simple-javascript-indenter')

" JSON
call dein#add('elzr/vim-json')

" Git
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

" My
call dein#add('no1fushi/mysnippets')

call dein#end()
if dein#check_install()
  call dein#install()
endif
"---------------------------------------------------------
" plugins set

" molokai
colorscheme molokai
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/

set t_Co=256
syntax enable

" lightline
set laststatus=2
set showmode
set showcmd

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
cnoremap nt! NERDTree

" incsearch.vim
map / <Plug>(incsearch-forward)

" Rsense
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" gauche
cnoremap gosh GoshREPLWithBuffer

" emmet
let g:user_emmet_settings = {'variables': {'lang' : 'ja'}}

" vim-json
let g:vim_json_syntax_conceal = 0

" multiple-cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" vim-fugitive
set statusline+=%{fugitive#statusline()}
cnoremap gs! Gstatus
cnoremap ga! Gwrite
cnoremap gc! Gcommit -m
cnoremap gps! Git push
cnoremap gpl! Git pull
cnoremap gl! Git log
cnoremap gco! Git checkout
cnoremap gb! Git branch
cnoremap gbd! Git branch -d
cnoremap gr! Git reset
cnoremap grh! Git reset --hard
cnoremap gra! Git remote add origin

