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
NeoBundle 'vim-scripts/svn-diff.vim'
NeoBundle 'h1mesuke/vim-alignta'     " 縦軸の整形
NeoBundle 'The-NERD-Commenter'       " コメントトグル
NeoBundle 'tpope/vim-rails'          " まずは、:AT でテストコードに移動することを覚える
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rhysd/vim-textobj-ruby'

" 起動時にチェック
NeoBundleCheck
"}}}

source $VIMRUNTIME/macros/matchit.vim "ruby の do/end を % ジャンプできるようにする

"---------------------------------------------------------------------
" 補完 {{{
"---------------------------------------------------------------------
" vim のオムニ補完を有効化
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

"---------------------------------------------------------------------
"   neocomplcache {{{
"---------------------------------------------------------------------
let g:neocomplcache_enable_at_startup  = 1 " 起動時に neocomplcache を有効化
let g:neocomplcache_enable_smart_case  = 1 " 大文字を入力するまで、大文字/小文字を無視して補完
let g:neocomplcache_min_syntax_length  = 3 " 3文字以上の単語を補完候補としてキャッシュ
let g:neocomplcache_enable_auto_select = 1 " 最初の候補を選択している状態にする

" tabで選択
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" 全てのバッファを検索候補に
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" キーワードと見なす正規表現を設定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
" \h: [A-Za-z_] \w: [0-9A-Za-z_] refs help regexp
let g:neocomplcache_keyword_patterns.default = '\h\w*'
" ruby のデフォルトの neocomplcache_keyword_patterns では、File:: の後の補完が想定した感じにならなかった
let g:neocomplcache_keyword_patterns.ruby    = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" インサートモードに入った時に現在のバッファのキャッシュを更新したい
" * 間違えて入力した単語がキャッシュされるのがやだ
autocmd InsertEnter * NeoComplCacheCachingBuffer

"  }}}
"}}}

"---------------------------------------------------------------------
" The-NERD-Commenter {{{
"---------------------------------------------------------------------
let NERDSpaceDelims = 1
nmap ,c<Space> <Plug>NERDCommenterToggle
vmap ,c<Space> <Plug>NERDCommenterToggle
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
" 相対行番号を有効にする
" set relativenumber

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
" 単語の差し替えをcwpでやりたいので、一旦コメントアウト
" set clipboard+=autoselect

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

" モードラインを有効にする
set modeline

" コマンドラインウィンドウの幅
set cmdwinheight=20
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

"検索時に結果が中央に来るようにする
nnoremap n nzz
nnoremap N Nzz
"* は、単語ではなく、文字列として検索
nnoremap * g*zz
nnoremap # #zz

"ビジュアルモードで選択されている文字列を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"検索時に very magic とする
" set verymagic ってないのね...
nnoremap /  /\v

" s*でカーソル下のキーワードを置換
nnoremap <expr> s* ':%s/\<' . expand('<cword>') . '\>/'
vnoremap <expr> s* ':s/\<' . expand('<cword>') . '\>/'
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

" Shift-u でredo
noremap <s-u> <c-r>
" mark
nnoremap ,m :<C-u>marks<Return>
" registers
nnoremap ,r :<C-u>registers<Return>

" 行結合時に、空白を挟まない
nnoremap J gJ

" コマンドライン移動
" s-left, c-left がうまく動作しなかったので
cnoremap <tab><Left> <S-Left>
cnoremap <tab><Right> <S-Right>
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
command! -bang -nargs=? Euc
\ edit<bang> ++enc=euc-jp <args>

command! CopyRelativePath
\ let @*=join(remove( split( expand( '%:p' ), "/" ), len( split( getcwd(), "/" ) ), -1 ), "/") | echo "copied"

" grep に cw(Quickfixを表示)を追加
au QuickfixCmdPost vimgrep cw
"}}}

"---------------------------------------------------------------------
" ファンクションキー {{{
"---------------------------------------------------------------------
" nnoremap <F2> :NERDTreeToggle<CR>
" nnoremap <F2> :Unite buffer file file_mru<CR>
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
  " .vimperatorrc もFiletype:vimとみなす
  autocmd MyAutoCmd BufNewFile,BufRead .vimperatorrc setfiletype vim
  autocmd MyAutoCmd BufNewFile,BufRead private setfiletype vim
augroup END

augroup erb
  autocmd MyAutoCmd BufNewFile,BufRead *.erb setfiletype eruby.html
augroup END

" ファイルタイプ毎の折りたたみ設定
autocmd MyAutoCmd Filetype vim setlocal foldmethod=marker
autocmd MyAutoCmd Filetype ruby setlocal foldmethod=syntax
autocmd MyAutoCmd Filetype ruby setlocal foldlevel=999
"}}}

source ~/.vim/private

" tmpディレクトリでは、バックアップファイルを作らない
" via : Mac OS X で cron を使う(EDITOR=vim) - yuyarinの日記 http://d.hatena.ne.jp/yuyarin/20100225/1267084794
set backupskip=/tmp/*,/private/tmp/*

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

