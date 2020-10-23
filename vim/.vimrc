
"構文ハイライト
syntax on
"アンダーライン設定
set cursorline
"マウス操作有効
"set mouse=a
"行番号表示
set number
"tab幅の指定
set tabstop=4
set shiftwidth=4
set expandtab
"検索時などに大文字小文字無視
set ignorecase
"検索時などに大文字ではじめたら大文字小文字無視しない
set smartcase
"検索文字をハイライト
set hlsearch
" screenを256色とする
set t_Co=256
" カラースキーマにhybridを設定
colorscheme hybrid
"colorscheme molokai

"--------------------------------------------------------------------------
" neobundle


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
 
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'szw/vim-tags'
:set statusline+=%{fugitive#statusline()} 
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'taketwo/vim-ros'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" neobundle
"--------------------------------------------------------------------------
" spaceをctrlの代わりに変更
let mapleader = "\<Space>"
" <Space>pと<Space>yでシステムのクリップボードにコピー＆ペーストする
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"<Space><Space>でビジュアルラインモードに切り替える
nmap <Leader><Leader> V

"貼り付けたテキストの末尾へ自動的に移動する
"pppppと押すだけで、複数行の貼り付けを繰り返し実行できます。
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
    
        

"----indent guide ---
" vim-indent-guides
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#111133 ctermbg=darkred
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222244 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
" vim-indent-guides
"----indent guide ---
" vimにcoffeeファイルタイプを認識させる

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" ctags 用設定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
" 拡張子で読み込みタグ変更
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
au BufNewFile,BufRead *.inc set tags+=$HOME/php.tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
