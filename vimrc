"---------------------------------------------------------------------------
" memo {{{
"---------------------------------------------------------------------------
" コマンドの定義：(!をつけて上書き可能にすべき)
" command! A B

" optionを変数のように使う
" &option
" let &option = "test"

" 配列
" let s:array = []
" for s:i in s:array
"     ～
" end for

" join(s:array, ",")
" let s:array = split(&runtimepath, ",")
"}}}

"autocmd 初期化
augroup MyAutoCmd
  autocmd!
augroup END

"---------------------------------------------------------------------
" neobundle.vim {{{
"---------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" プラグインのインストール先を指定
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-scripts/postmail.vim'
NeoBundle 'vim-scripts/svn-diff.vim'
NeoBundle 'ruby-matchit'         " ruby で % を使った移動に対応
NeoBundle 'h1mesuke/vim-alignta' " 縦軸の整形
NeoBundle 'The-NERD-Commenter'   " コメントトグル
" $ sudo easy_install markdown
NeoBundle 'kakkyz81/evervim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc.vim'   " 遅延評価ライブラリ
" $ cd ~/.vim/bundle/vimproc.vim
" $ make -f make_mac.mak
NeoBundle 'kien/ctrlp.vim'       " ファイルセレクタ

" 起動時にチェック
NeoBundleCheck
"}}}

"---------------------------------------------------------------------
" neocomplcache.vim {{{
"---------------------------------------------------------------------
" 起動時に有効
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで、大文字小文字を無視して補完
let g:neocomplcache_enable_smart_case = 1
" スネークケースの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 2文字から補完候補に出す
let g:neocomplcache_min_syntax_length = 2
" 補完候補を出すときに、自動的に一番上の候補を選択
let g:neocomplcache_enable_auto_select = 1

" tabで選択
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"

" vim のオムニ補完を有効化
autocmd MyAutoCmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" rubyのオムニ補完を読むようにする
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd MyAutoCmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"}}}

"---------------------------------------------------------------------
" w3m.vim {{{
"---------------------------------------------------------------------
let g:w3m#external_browser = 'open -a Firefox'
" 編集できるようにする
au FileType w3m set modifiable

" 選択行がURLの場合、,w で ブラウザでopen
" via : http://d.hatena.ne.jp/shunsuk/20110508/1304865150
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map ,w :call HandleURI()<CR>
"}}}

"---------------------------------------------------------------------
" vim-ref {{{
"---------------------------------------------------------------------
" Refe で、Ref refe と同様にする
command! -nargs=* Refe Ref refe <args>
"}}}

"---------------------------------------------------------------------
" The-NERD-Commenter {{{
"---------------------------------------------------------------------
let NERDSpaceDelims = 1
nmap ,c<Space> <Plug>NERDCommenterToggle
vmap ,c<Space> <Plug>NERDCommenterToggle
"}}}

"---------------------------------------------------------------------
" quickrun {{{
"---------------------------------------------------------------------
nmap <F5> <plug>(quickrun)
let g:quickrun_config   = {'*': {'split': '%{winheight(0)/5}'}} " 横分割にする
let g:quickrun_config._ = {'runner' : 'vimproc'}                " vimproc対応

" rspec 対応
let g:quickrun_config['ruby.rspec'] = {'command': "spec"}
augroup RSpec
  autocmd MyAutoCmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd MyAutoCmd BufWritePost,FileWritePost *_spec.rb QuickRun
augroup END
"}}}

"---------------------------------------------------------------------
" evervim {{{
"---------------------------------------------------------------------
map ,e :EvervimNotebookList<CR>
"}}}

"---------------------------------------------------------------------
" basic {{{
"---------------------------------------------------------------------
syntax on
filetype on
filetype indent on
filetype plugin on

" 行番号を表示
set number

" ルーラーを表示
set ruler

" タイトルを表示
set title

" 常にステータス行を表示
set laststatus=2

" コマンドラインの高さ
set cmdheight=2

" コマンドをステータス行に表示
set showcmd

" 履歴
set history=1000

"tabの代わりに空白を使う
set expandtab

"tabが対応する空白の数
set tabstop=2

"インデントの幅
set shiftwidth=2

"新しい行を作るときに高度な自動インデントを行う
set cindent

"カラースキーム
"colorscheme wombat
"set background=dark

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<,trail:_

"バックスペースでindentを無視 & 改行を越えてバックスペースを許可
set backspace=indent,eol

"入力補完時に、辞書ファイルも読み込む
set complete=.,w,b,u,t,i,k

"共有のクリップボードを使用する
set clipboard=unnamed
"非guivimで、ビジュアルモードで選択した領域をクリップボードに格納
set clipboard+=autoselect

"カーソルを行頭/末尾で止めない
set whichwrap=b,s,h,l,<,>,[,]

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"swapファイルをまとめて置く場所(DropBox対策)
set swapfile
set directory=~/.vimswap

"backupファイルをまとめて置く場所(DropBox対策)
set backup
set backupdir=~/.vimbackup

"コマンド補完強化
set wildmenu

"補完をzsh風に
set wildmode=longest,list

"矩形選択で自由に移動
set virtualedit=block

"折返しない
set nowrap

" esc押した時に音を出さない
set visualbell
"}}}

"---------------------------------------------------------------------
" 検索関係 {{{
"---------------------------------------------------------------------
"インクリメンタルサーチを行う
set incsearch

"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

"検索結果をハイライト
set hlsearch

"ハイライト消去
nmap <c-j><c-j> :nohlsearch<Return><ESC>

nnoremap n nzz
nnoremap N Nzz

"カーソル位置の単語検索
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"ビジュアルモードで選択されている文字列を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"}}}

"---------------------------------------------------------------------
" keymap {{{
"---------------------------------------------------------------------
"カレントディレクトリを出力
cmap <c-x> <c-r>=expand('%:p:h')<Return>/
"ファイル名(フルパス)を出力
cmap <c-z> <c-r>=expand('%:p')<Return>

"tabキーでバッファ移動
nnoremap <tab> :bn<Return>
nnoremap <s-tab> :bp<Return>

" 表示行単位で移動(wrapの改行を無視)
noremap j gjzz
noremap k gkzz
vnoremap j gjzz
vnoremap k gk

" Shift-w で前の単語
noremap <s-w> b
" Shift-u でredo
noremap <s-u> <c-r>
" mark
nnoremap ,m :<C-u>marks<Return>
" registers
nnoremap ,r :<C-u>registers<Return>

" 行結合時に、空白を挟まない
nnoremap J gJ
"}}}

"---------------------------------------------------------------------
" ステータスライン {{{
"---------------------------------------------------------------------
set statusline=　
"set statusline+=[%n]\  " バッファ番号
set statusline+=%f\     " ファイル名
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'} " 文字コード
set statusline+=%y      " ファイルタイプ
"set statusline+=%r      " 読み取り専用フラグ
"set statusline+=%h      " ヘルプバッファ
"set statusline+=%w      " プレビューウィンドウ
"set statusline+=%m      " バッファ状態[+]とか

set statusline+=%=      " 区切り

"set statusline+=\ %{strftime('%c')}  " 時間
"set statusline+=%4l/%4L%4p%%   " どこにいるか
set statusline+=%4l/%4L   " どこにいるか
"set statusline+=\ %3c    " 列
set statusline+=\ %4B    " 文字コード
"set statusline+=%<       " 折り返しの指定

"}}}

"---------------------------------------------------------------------
" EXコマンド {{{
"---------------------------------------------------------------------
" 文字コード変換
command! -bang -nargs=? Utf8
\ edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis
\ edit<bang> ++enc=sjis <args>

" grep に cw(Quickfixを表示)を追加
au QuickfixCmdPost vimgrep cw
"}}}

"---------------------------------------------------------------------
" ファンクションキー {{{
"---------------------------------------------------------------------
"nnoremap <F2> :Unite buffer file file_mru<CR>
" nnoremap <F2> :FufBuffer<CR>
" nnoremap <F3> :FufFile<CR>
" nnoremap <F4> :FufMruFile<CR>

"<F5>はコード実行用

"}}}

"---------------------------------------------------------------------
" ファイル毎の設定 {{{
"---------------------------------------------------------------------
augroup diff
  autocmd MyAutoCmd Filetype diff setlocal encoding=utf-8
augroup END

augroup vimrc
  autocmd MyAutoCmd FileType gitcommit DiffGitCached | only | split | buffer 1 | syntax on
augroup END

" .vimperatorrc もFiletype:vimとみなす
autocmd MyAutoCmd BufNewFile,BufRead .vimperatorrc setfiletype vim
autocmd MyAutoCmd BufNewFile,BufRead private setfiletype vim

" ファイルタイプ毎の折りたたみ設定
autocmd MyAutoCmd Filetype vim setlocal foldmethod=marker
autocmd MyAutoCmd Filetype ruby setlocal foldmethod=syntax
autocmd MyAutoCmd Filetype ruby setlocal foldlevel=2
"}}}

source ~/.vim/private

"---------------------------------------------------------------------
" 何故かhighlightが末尾にないと効かない {{{
"---------------------------------------------------------------------
"全角スペースを強調
highlight! zenkakuda ctermbg=grey ctermfg=grey guibg=black
if &encoding ==# 'utf-8'
	match zenkakuda /　/
else
	" win32のコンソールvimはsjisで設定ファイルを読むので、
	" sjisの全角スペースの文字コードを指定してやる
	match zenkakuda /\%u8140/
endif
"}}}

