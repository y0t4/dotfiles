set nocompatible
scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomasr/molokai'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on
filetype indent on
syntax on

" vimshell
let g:vimshell_prompt=$USER."% "

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion=1

" snippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" color scheme
autocmd colorscheme * highlight Visual ctermbg=8
colorscheme molokai
let g:molokai_original=1

" tagbar
nmap <F8> :TagbarToggle<CR>

" nerdtree
nmap <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=1

" display
set showmatch
set cursorline
set wrap
set number
set showmode
set showcmd
set ruler

" status line
set statusline=%n:%<\ %f%a\ %m%r%h%w%y[%{&fenc!=''?&fenc:&enc}][%{&ff}]%=pos:%l,%c%V\ %obytes\ 0x%06.6B\ %03.3p%%

" tab line
set showtabline=2
set hidden

" new window
set nosplitbelow
set splitright

" indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" search
set hlsearch
set ignorecase
set incsearch
set matchpairs+=<:>
set matchtime=3
set report=0
set smartcase
set wrapscan

" insert
set backspace=start,eol,indent

" map
nmap <ESC><ESC> :nohlsearch<CR><ESC>
