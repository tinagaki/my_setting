""---------- NeoBundle Start --------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 't9md/vim-textmanip'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/savevers.vim'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"ttファイル用プラグイン
NeoBundle "petdance/vim-perl"

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck
"" ----------------NeoBundle End-------------------
""---------------------通常設定----------------------------------
colorscheme molokai
set t_Co=256
"ctags用設定
" 拡張子で読み込みタグ変更
au BufNewFile,BufRead *.pm set tags+=$HOME/.tags/tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
"ctags用設定 END
syntax on
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nolist
""set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set history=50
set virtualedit=block
set wildmenu
" ファイルタイプの自動検出
set filetype=on
set backspace=indent,eol,start
"検索時のハイライト
set hlsearch
"" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
"前回編集した箇所に移動する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"--------savevers.vim--------------
set backup
set patchmode=.clean
set backupdir=~/.vim/backup
let savevers_types = "*"
let versdiff_no_resize=1
let savevers_dirs = &backupdir
"
nmap <silent> <F5> :VersDiff -<cr>
nmap <silent> <F6> :VersDiff +<cr>
nmap <silent> <F8> :VersDiff -c<cr>
"--------savevers.vim END--------------
"--------vim perl START END--------------
"au BufNewFile,BufRead *.tt2 call s:AdjustTT2Type()
"au BufNewFile,BufRead *.tt setf tt2html
"autocmd BufNewFile,BufRead *.tt setf tt2
"func! s:AdjustTT2Type()
"    if ( getline(1) . getline(2) . getline(3) =~ '<\chtml'
"              && getline(1) . getline(2) . getline(3) !~ '<[%?]' )
"       || getline(1) =~ '<!DOCTYPE HTML'
"        setf tt2html
"    else
"        setf tt2
"    endif
"endfunc

"To define START_TAG and END_TAG you like, you can set any pair of tags to 'b:tt2_syn_tags':
"ASP"
":let b:tt2_syn_tags = '<% %>'
"PHP"
":let b:tt2_syn_tags = '<? ?>'
"TT2 and HTML"
":let b:tt2_syn_tags = '\[% %] <!-- -->'
"--------vim perl END--------------
