" MacVim Kaoriyaで読み込むPythonの指定。
set pythondll=/usr/local/Cellar/python/2.7.11/Frameworks/Python.framework/Versions/2.7/Python

" 表示関係
colorscheme molokai
syntax on
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark
set number " 行数の表示
set title " 編集ファイルを常に表示
"set ruler " カーソルの位置を表示
set autoindent " インデントがそろうように自動的にスペースを入れる
"set cindent
"set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"set tabstop=8 shiftwidth=4 softtabstop=4
set expandtab "タブをスペースに置き換える
set smarttab
"set tabstop=4 shiftwidth=4 softtabstop=0
"set tabstop=4 shiftwidth=4
"set list " 不可視文字の可視化
set wrap " 長いテキストの折り返し
set textwidth=0 " 自動的に改行が入るのを無効化
set colorcolumn=80 " その代わり80文字目にラインを入れる
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set laststatus=2 " 画面最下部のステータス行を常に表示。
set cursorline " カーソル行の色の変更。

" 編集関係
"set virtualedit=all " カーソルを文字が存在しない部分でも動けるようにする
set showmatch " 対応する括弧などをハイライト表示する
"set matchtime=3 " 対応括弧のハイライト表示を3秒にする
"set paste " コピーしたテキストをペーストするときのオートインデント無効
" 括弧を自動補完、改造版
" inoremap {{ {}<LEFT>
" inoremap [[ []<LEFT>
" inoremap (( ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" inoremap << <><LEFT>
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start " バックスペースでなんでも消せるようにする
" クリップボードの有効化。
set clipboard+=unnamed

" 検索関係
set hlsearch " 検索マッチテキストをハイライト
set infercase " 補完の際に、大文字小文字を区別しない。
" set nohlsearch " ハイライトを一時的に辞める場合。
set wrapscan " ファイル末尾まで進んだら、ファイル先頭に戻って再検索。
set ignorecase " 大文字/小文字の区別なく検索する。
set smartcase " 大文字の場合は普通の検索(大文字小文字を無視しない)
set incsearch " インクリメンタルサーチを行う。
set wildmenu " コマンドモードでの補完モード。
set wildmode=list:full " 補完モードの表示方法の指定。
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll " 無視されるファイルパターン。
"検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz

" キーバインド
noremap <S-h> ^
noremap <S-l> $
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap ,p "*p
inoremap <silent> jj <ESC>

" 編集中のファイルを実行する系
" http://qiita.com/smison/items/58a18b2bb27f2eff2f2a
" autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

" Python関係
autocmd FileType python setlocal completeopt-=preview

" lilypond用
set runtimepath+=/applications/LilyPond.app/contents/resources/share/lilypond/current/vim/

" javascript
" au FileType javascript call JavaScriptFold()

set nocompatible
"filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    " call neobundle#rc(expand('~/.vim/bundle/'))
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" JavaScriptの補完機能。
"NeoBundle 'marijnh/tern_for_vim', {
"    \ 'build': {
"    \   'others': 'npm install'
"    \}}

NeoBundle 'Align'
" Pythonの補完機能。
" NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "rev" : 'dev',
      \ "autoload": {
      \ "filetypes": [ "python", "python3", "djangohtml"]}}

"NeoBundle 'git://github.com/kevinw/pyflakes-vim.git'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
" バッファ一覧
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ディレクトリ一覧
nnoremap <silent> ,d :<C-u>Unite directory<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    "ctrl+sで縦に分割して開く(split)
    nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    "ctrl+vで横に分割して開く(vsplit)
    nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    "ctrl+oでその場所に開く(open)
    nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" 関数やクラス、メソッドのアウトラインの表示。
NeoBundle 'Shougo/unite-outline'
nnoremap <silent> ,o :<C-u>Unite outline<CR>
" ヤンクの履歴
NeoBundle 'Shougo/neoyank.vim'
nnoremap <silent> ,y :<C-u>Unite history/yank <CR>

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" 編集中のファイルの実行。
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" Pythonの文法のチェッカー。
" FIXME: これを利用しようとすると、jedi-vimとの相性が悪く、エラーが出てしまう。
" NeoBundle 'andviro/flake8-vim'

NeoBundle 'hynek/vim-python-pep8-indent'

" テキストオブジェクトの拡張。
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
" インデントレベルを操作可能。
NeoBundle 'kana/vim-textobj-indent'

" HTML関係。
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'

" JavaScript
NeoBundle 'pangloss/vim-javascript'
" JavaScriptの補完機能。
NeoBundle 'marijnh/tern_for_vim'

" neocomplete.vimのインストールと設定。
NeoBundle 'Shougo/neocomplete.vim'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" neocomplete.vimの設定終わり。


NeoBundle 'nathanaelkane/vim-indent-guides'
call neobundle#end()
" vim-indent-guidesの設定。
let g:indent_guides_enable_on_vim_startup=1 "vim立ち上げ時に自動的にvim-indent-guidesをオンにする
let g:indent_guides_auto_colors = 0 "autoにするとよく見えなかったので自動的に色付けするのはストップ
let g:indent_guides_color_change_percent = 10 "色の変化の幅（？）。パーセンテージらしい
" 奇数段のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black guibg=black ctermbg=1
" 偶数段のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey guibg=darkgrey ctermbg=2
let g:indent_guides_guide_size = 1 "インデントの色付け幅




filetype plugin indent on
