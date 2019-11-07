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

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

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
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap ss split
cnoremap rep %s/before/after/g
cnoremap jc !javac
cnoremap ja !java
cnoremap p set paste
cnoremap np set nopaste
nnoremap <C-O> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Custom Leader
let mapleader = ","
nnoremap <Leader>w :w<CR>
nnoremap <Leader>vs :vs<CR>
nnoremap <Leader>ss :ss<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Color
syntax on

" Plugins
:let g:neobundle_default_git_protocol='https'
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
		if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
			echo "install NeoBundle..."
			:call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"----------------------------------------------------------
" set
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/neocomplete.vim'

" snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'no1fushi/mysnippets'

" Search
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'haya14busa/incsearch.vim'

" gosh
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'
NeoBundle 'Shougo/vimproc.vim'

" Ruby
NeoBundle 'tpope/vim-endwise'
NeoBundle 'szw/vim-tags'
NeoBundle 'marcus/rsense'

" HTML
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'

" CSS
NeoBundle 'hail2u/vim-css3-syntax'

" JavaScript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'

" Git

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

"----------------------------------------------------------
call neobundle#end()
NeoBundleCheck

filetype plugin indent on

"---------------------------------------------------------
" plugins set

" molokai
if neobundle#is_installed('molokai')
	colorscheme molokai
endif

set t_Co=256
syntax enable

" lightline
set laststatus=2
set showmode
set showcmd

" NERDTree
if neobundle#is_installed('nerdtree')
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	cnoremap nt NERDTree
endif

" incsearch.vim
if neobundle#is_installed('incsearch.vim')
	map / <Plug>(incsearch-forward)
endif

" Rsense
if neobundle#is_installed('rsense')
	let g:rsenseHome = '/usr/local/lib/rsense-0.3'
	let g:rsenseUseOmniFunc = 1
endif

" gauche
if neobundle#is_installed('vim_goshrepl')
	cnoremap gosh GoshREPLWithBuffer
endif

" emmet
if neobundle#is_installed('emmet')
	let g:user_emmet_settings = {'variables': {'lang' : 'ja'}}
endif

" neocomplete
if neobundle#is_installed('neocomplete.vim')
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#max_list = 50
	let g:neocomplete#max_keyword_width = 80
	let g:neocomplete#enable_ignore_case = 1
	highlight Pmenu ctermbg=6
	highlight PmenuSel ctermbg=3
	highlight PMenuSbar ctermbg=0
endif

" snippet
if neobundle#is_installed('neosnippet')
	imap <C-k>	<Plug>(neosnippet_expand_or_jump)
	smap <C-k>	<Plug>(neosnippet_expand_or_jump)
	xmap <C-k>	<Plug>(neosnippet_expand_target)
	if has('conceal')
		set conceallevel=2 concealcursor=niv
	endif
	let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/bundle/mysnippets/snippets/'
endif

" multiple-cursors
if neobundle#is_installed('vim-multiple-cursors')
	let g:multi_cursor_use_default_mapping = 0
	let g:multi_cursor_start_word_key      = '<C-n>'
	let g:multi_cursor_select_all_word_key = '<A-n>'
	let g:multi_cursor_start_key           = 'g<C-n>'
	let g:multi_cursor_select_all_key      = 'g<A-n>'
	let g:multi_cursor_next_key            = '<C-n>'
	let g:multi_cursor_prev_key            = '<C-p>'
	let g:multi_cursor_skip_key            = '<C-x>'
	let g:multi_cursor_quit_key            = '<Esc>'
endif

" vim-gitgutter
if neobundle#is_installed('vim-multiple-cursors')
	cnoremap gs Gstatus
	cnoremap ga Gwrite
	cnoremap gc Gcommit
endif

