set nocompatible
scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomasr/molokai'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload' : {'filetypes' : ['markdown'] }}
NeoBundleLazy 'kannokanno/previm',       {'autoload' : {'filetypes' : ['markdown'] }}
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck

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
augroup MyColorScheme
  autocmd!
  autocmd ColorScheme * highlight Visual ctermbg=8
  autocmd ColorScheme * highlight Comment ctermfg=57
augroup END
colorscheme molokai
let g:molokai_original=1

" tagbar
nmap <F8> :TagbarToggle<CR>

" nerdtree
nmap <F9> :NERDTreeToggle<CR>
augroup MyNerdTree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
let g:NERDTreeShowHidden=1

" for markdown
augroup MyMarkdown
  autocmd!
  autocmd BufRead,BufNewFile *.{md,mkd} set filetype=markdown
augroup END
let g:vim_markdown_folding_disabled=1
" NOTE: 以下の設定を行う場合pluginのソースを若干いじる必要があります。
let g:vim_markdown_auto_increase_indent_disabled=1
let g:vim_markdown_indent_width=2

" for quickrun
let g:quickrun_config = {
  \   "_" : {
  \       "runner" : "vimproc",
  \       "outputter/buffer/split" : ":botright 8sp",
  \       "outputter/buffer/close_on_empty" : 1
  \   },
  \}

" display
set showmatch
set cursorline
set wrap
set number
set showmode
set showcmd
set ruler

" status line
set laststatus=2
highlight StatusLineNC ctermfg=black ctermbg=black
set statusline=%n:%<\ %f%a\ %m%r%h%w%y[%{&fenc!=''?&fenc:&enc}][%{&ff}]%{fugitive#statusline()}%=pos:%l,%c%V\ %obytes\ 0x%06.6B\ %03.3p%%

" tab line
set showtabline=2
set hidden

" new window
set nosplitbelow
set splitright
set diffopt=vertical

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
cnoremap <expr> /
      \ getcmdtype() == '/' ? '\/' : '/'

" insert
set backspace=start,eol,indent

" map
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" visualization of tab, ZENKAKUspace, etc...
set list
set listchars=tab:»\ ,trail:_,precedes:«,extends:»
highlight ZenkakuSpace cterm=underline ctermbg=white ctermfg=blue
augroup MyZenkakuSpace
  autocmd!
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

" ctags
set tags=tags
