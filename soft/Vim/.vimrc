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
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
	
	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"color
syntax on
