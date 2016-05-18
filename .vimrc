"===========================================================
" Vundle config:

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"let path=~/.vim/bundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

"Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-commentary'
Plugin 'rust-lang/rust.vim'
"Plugin 'klen/python-mode'
Plugin 'sukima/xmledit'
Plugin 'dcharbon/vim-flatbuffers'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'fencview.vim'
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'file://D:/develop/Vim/local/fencview'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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

" Vundle config end.

"===========================================================
" Original _vimrc:

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

" Original _vimrc end.

"===========================================================
" My set begin

" autoload _vimrc
autocmd! bufwritepost $MYVIMRC source %

" filetype set
set softtabstop=4 | set shiftwidth=4 | set expandtab
au BufRead,BufNewFile *.md set filetype=markdown

" cursor style
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" custom options
color torte    " ron, blue
set guifont=monaco:h11,NSimSun:h11
set number
set sidescroll=1
set nobackup
set hlsearch
set incsearch
set autoindent

set ignorecase
set smartcase
set guioptions+=m

" undofiles
set undodir=~/.vim/undodir
set undofile

" status line
set statusline=%-30.60(%f%m%(\ [%R%H%W]%)\ [%{&ff}%(/%{&fenc}%)%(/%Y%)]%)\ [CHAR=%b,0x%04B]%=\ [%l/%L,%c%V]%5P
set laststatus=2

" Press v in quickfix window to preview
au FileType qf :nnoremap <buffer> v <Enter>zz:wincmd p<Enter>
"set cul


"===========================================================
" Plugins config:

"-------------------------------------------------
" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"-------------------------------------------------
" FencView
let g:fencview_checklines=100
let g:fencview_autodetect=0
"let g:fencview_auto_patterns='*.txt,*.cue,*.ini,*.bat,*.c,*.cpp,*.cxx,*.h,*.hpp,*.py,*.pyw,*.htm{l\=}'

"-------------------------------------------------
" ctrlp.vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'

"-------------------------------------------------
" pymode
"let g:pymode_rope_completion_bind = '<C-\>'


"-------------------------------------------------
"Auto Highlight current word
set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'MatchParen' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
"-------------------------------------------------

