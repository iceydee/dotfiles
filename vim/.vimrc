set nocompatible

syntax enable

"====[ Vundle ]====
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'dougireton/vim-chef'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'hashivim/vim-terraform'
Plugin 'markcornick/vim-vagrant'
Plugin 'luochen1990/rainbow'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'

call vundle#end()

"====[ Basic Config ]====
filetype plugin indent on

set nofoldenable    " disable folding
set noerrorbells    " don't beep
set novisualbell

set synmaxcol=200

set nobackup
set noswapfile

set smartindent
set autoindent
set nowrap
set modelines=0

set title
set titleold=
set nomore

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected

set viminfo=h,'50,<10000,s1000,/1000,:1000

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings

set updatecount=10                  "Save buffer every 10 chars typed

set scrolloff=4                     "Scroll when 2 lines from top/bottom

set ruler "show the cursor position all the time

set showcmd "display incomplete commands
set cursorline
set number

set incsearch   " do incremental searching

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

"====[ Easy moves between tabs ]====
nmap <silent> <Leader>e :tabn<CR>
nmap <silent> <Leader>q :tabp<CR>

"====[ Window splits ]====
nmap <silent> <Leader>w :wincmd k<CR>
nmap <silent> <Leader>s :wincmd j<CR>
nmap <silent> <Leader>a :wincmd h<CR>
nmap <silent> <Leader>d :wincmd l<CR>

"====[ Remaps ]====
nnoremap <Space> <PageDown>
nmap <Leader>nn :so %<CR>

" Indent/outdent current block...
nmap %% $>i}``
nmap $$ $<i}``

nmap :Wq :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :WQ :wq
nmap :Q  :q
nmap :W  :w

nmap :te :tabe
nmap :Te :tabe
nmap :TE :tabe
nmap :E :e
nmap :Vsp :vsp
nmap :Sp :sp
nmap :yanks :Yanks

nmap :amke :make
nmap :amek :make


nnoremap j gj
nnoremap k gk

"====[ Mouse ]====
if has('mouse')
  set mouse=a
endif

"====[ Use persistent undo ]====
if has('persistent_undo')
    set undodir=$HOME/tmp/.VIM_UNDO_FILES
    set undolevels=5000
    set undofile
endif

"====[ Toggle visibility of naughty characters ]====
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END

"====[ Set up smarter search behaviour ]=======================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used
set hlsearch        "Highlight all matches

" ================ Completion =======================
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=bin/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=.git,.gitkeep
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**

"=====[ Tab handling ]======================================
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

"=====[ Project specific Tab handling ]===================================
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4 sts=4
au BufNewFile,BufRead *.sh setlocal noet ts=2 sw=2
au BufNewFile,BufRead *.R  setlocal et ts=2 sw=2
au BufNewFile,BufRead *.jade setlocal et ts=2 sw=2
au BufNewFile,BufRead *.ml setlocal et ts=2 sw=2
au BufNewFile,BufRead *.rb setlocal et ts=2 sw=2

"=====[ Make Visual modes work better ]==================
"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x

" When shifting, retain selection over multiple shifts...
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
    set nosmartindent
    if mode() ==# "V"
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction


"====[ Plugins ]====
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-n>"

nmap :mcf :MultipleCursorsFind

nnoremap <leader>gg :GitGutterToggle<CR>

let g:syntastic_check_on_open=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:rainbow_active = 1

"====[ CtrlP ]===============
:nmap <leader>; :CtrlPBuffer<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_switch_buffer = 0
:let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"====[ Multi Cursor ]===============
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"====[ NERD Tree ]============
map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
