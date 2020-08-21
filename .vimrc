" Vundle Settings/Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'scrooloose/nerdtree' " Self Explained
"Plugin 'vim-airline/vim-airline' " For Bottom Bar
"Plugin 'sjl/gundo.vim' " For Undo Tree
"Plugin 'vim-airline/vim-airline-themes' " Themes for airline
"Plugin 'jreybert/vimagit'
"Plugin 'idanarye/vim-vebugger'
"Plugin 'Shougo/vimproc.vim'
" Plugin 'vim-syntastic/syntastic'
"Plugin 'neovimhaskell/haskell-vim'
Plugin 'lervag/vimtex'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'ajh17/VimCompletesMe'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" setting Leader
let mapleader = ","
" Plugins {{{
"
" Here are the options for various programs
"
" NERDTree {{{
nnoremap <leader>tr :NERDTreeToggle<cr>
" }}}
" Syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" VimTex {{{
let g:vimtex_view_general_viewer = 'evince'
" }}}
" Gundo {{{
nnoremap <leader>tu :GundoToggle<cr>
" }}}
" ALE {{{

let g:ale_linters = {'c': [], 'cpp': []}

" }}}
" }}}
" Vimrc {{{
" Setting to include anything in local vimrc
set exrc
set secure

" This edits .vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" sources the .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
" UI Setings {{{
"
" Settings for the UI
"
" Colors {{{
" colorscheme badwolf	" awesome colorscheme
syntax enable		" enable syntax coloring
set background=dark
colorscheme badwolf
" }}}
" UI Settings {{{
set tabstop=4
set softtabstop=4	" number of spaces in tab when editing
set shiftwidth=4

" UI settings
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set mouse=a

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}o]
set laststatus=2		" Keeps the status line on even in single windows
" }}}
" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> za
" }}}
" }}}
" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" User Ctrl rather than Ctrl+W to move between splits
"nnoremap <C-J> <C-W>j
"nnoremap <C-H> <C-W>h
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l

" }}}
" Usefull Stuff {{{
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap <leader>s :mksession!<CR>
" }}}
" Function Definitions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>tn :call ToggleNumber()<CR>

function! s:InsertNoteImage(myParam)
    exe ":silent !mkdir " . expand("%:p:h") . "/images"
	exe ":silent !maim -s " . expand("%:p:h") . "/images/" . expand('%:t:r') . "-" .	a:myParam . ".png"
	exe ":redraw!"
	exe ":normal! i" . "<img src=\"images/" . expand('%:t:r') . "-" . a:myParam . ".png\" alt=\"" . a:myParam . "\" >"
    echo "Screenshotted to : " . expand("%:p:h") . "/images/" . expand('%:t:r') . "-" . a:myParam . ".png"
endfunc


command! -nargs=1 Screen call s:InsertNoteImage(<f-args>)


"  }}}
" FileType Preferences {{{
" Java {{{
autocmd FileType java call Java_config()
  function Java_config()
	match ErrorMsg '\%>80v.\+'
  endfunction
" }}}
" Verilog {{{
autocmd FileType verilog call Verilog_config()
  function Verilog_config()
	  match ErrorMsg `\%>80v.\+`
  endfunction
" }}}
" Markdown {{{
autocmd FileType markdown call Markdown_config()
  function Markdown_config()
    setlocal spell
	setlocal spelllang=en
"	let b:vcm_tab_complete = "omni"
"	let b:vcm_omni_pattern = ""
	setlocal tabstop=3
	setlocal softtabstop=0
	setlocal expandtab
	setlocal shiftwidth=3
	setlocal smarttab
  endfunction
  " }}}
" {{{ Assembly
autocmd FileType asm call Assembly_config()
    function Assembly_config()
        setlocal tabstop=4
        setlocal shiftwidth=4
        setlocal expandtab
	endfunc
" }}}
" CS {{{
autocmd FileType cs call CS_config()
	function CS_config()
		setlocal tabstop=4
		setlocal expandtab
		setlocal shiftwidth=4
		setlocal smarttab
	endfunction
" }}}
" C {{{
autocmd FileType c,cpp call C_config()
	function C_config()
		setlocal tabstop=4
		setlocal expandtab
		setlocal shiftwidth=4
		setlocal smarttab
	endfunction
" }}}
syntax spell toplevel
set modelines=1

" vim:foldmethod=marker:foldlevel=0
