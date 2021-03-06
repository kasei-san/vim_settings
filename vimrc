"autocmd 初期化
augroup MyAutoCmd
  autocmd!
augroup END

" 256色対応
set t_Co=256
colorscheme elflord

"---------------------------------------------------------------------
" neobundle.vim {{{
"---------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" プラグインのインストール先を指定
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-scripts/svn-diff.vim' " commit 時に差分を出してくれる
NeoBundle 'junegunn/vim-easy-align'  " 縦軸の整形
NeoBundle 'The-NERD-Commenter'       " コメントトグル
NeoBundle 'Shougo/neocomplete.vim'   " 自動補完
NeoBundle 'tpope/vim-surround'       " テキストオブジェクトを囲っている文字列をいじれる
NeoBundle 'kana/vim-textobj-user'    " 自作のテキストオブジェクトを作れる
NeoBundle 'rhysd/vim-textobj-ruby'   " ruby 用のテキストオブジェクトを追加
NeoBundle 'kana/vim-altr'            " 任意のファイルをトグルして開く
NeoBundle 'koron/codic-vim'          " http://codic.jp/
NeoBundle 'kannokanno/previm'        " http://kannokanno.hatenablog.com/entry/2013/06/11/225806
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
"：Gstatus    新しい窓を作ってgit statusを表示
"：Gwrite     現在開いているソースをgit add
"：Gread      現在開いているソースの直前のコミット時のソースを表示
"：Gmove      destination/path    現在開いているソースをgit mvする
"：Gremove    現在開いているソースをgit rmする
"：Gcommit    git commit
"：Gblame     現在のソースをgit blame。vimが色づけしてくれる
"：Gdiff      現在のソースの変更点をvimdiffで表示 

NeoBundle 'kana/vim-smartword'
nmap w   <Plug>(smartword-w)
nmap b   <Plug>(smartword-b)
nmap e   <Plug>(smartword-e)

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-ref'

"---------------------------------------------------------------------
" unite {{{
"---------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'Shougo/neomru.vim'

" めんどいので全部探す
nnoremap <silent> ,u :<C-u>UniteWithBufferDir -buffer-name=files file buffer file_mru<CR>
" バッファ
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
" カレントディレクトリ以下のファイルを検索
nnoremap <silent> ,d :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルを検索
nnoremap <silent> ,m :<C-u>Unite file_mru
" レジスタ
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register


"}}}

"---------------------------------------------------------------------
" colorscheme {{{
"---------------------------------------------------------------------
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'cocopon/iceberg.vim'

" 起動時にチェック
NeoBundleCheck
"}}}

"}}}

"---------------------------------------------------------------------
" lightline.vim {{{
"---------------------------------------------------------------------
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode'],
        \     ['fileformat', 'fileencoding'],
        \     ['filename']
        \   ],
        \   'right': [
        \     ['charvaluehex']
        \   ]
        \ },
        \ 'inactive': {
        \   'left': [
        \     ['filename']
        \   ],
        \   'right': []
        \ },
        \ 'component_function': {
        \   'filename'     : 'MyFilename',
        \   'fileformat'   : 'MyFileformat',
        \   'filetype'     : 'MyFiletype',
        \   'fileencoding' : 'MyFileencoding',
        \   'mode'         : 'MyMode'
        \ },
        \ 'subseparator': {'left': '|', 'right': ''},
        \ }

function! MyFilename()
  return ('' != expand('%:f') ? expand('%:f') : '[No Name]')
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"}}}

source $VIMRUNTIME/macros/matchit.vim "ruby の do/end を % ジャンプできるようにする

"---------------------------------------------------------------------
" 補完 {{{
"---------------------------------------------------------------------
" vim のオムニ補完を有効化(軽量化の為、試験的にコメントアウト)
" autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd MyAutoCmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd MyAutoCmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
" autocmd MyAutoCmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

" 起動時に neocomplete を有効化
let g:neocomplete#enable_at_startup = 1
" 大文字を入力するまで、大文字/小文字を無視して補完
let g:neocomplete#enable_smart_case = 1
 " n文字以上の単語を補完候補としてキャッシュ
let g:neocomplete#sources#syntax#min_keyword_length = 4
" 補完が止まった際に、スキップする長さを短くする
let g:neocomplete#skip_auto_completion_time = '0.2'
" 補完開始文字数
let g:neocomplete#auto_completion_start_length = 2
" 最初の候補を選択している状態にする
let g:neocomplete#enable_auto_select = 1
" キャッシュしないファイル
let g:neocomplete#sources#buffer#disabled_pattern = '\.log|\.csv|\.tsv'

" デフォルト: ['file', 'tag', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
let g:neocomplete#sources = {
  \ '_' : ['vim', 'include', 'buffer', 'file/include']
  \ }

" tabで選択
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" 全てのバッファを検索候補に
let g:neocomplete#same_filetype_lists = {}
let g:neocomplete#same_filetype_lists._ = '_'

" キーワードと見なす正規表現を設定
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
" \h: [A-Za-z_] \w: [0-9A-Za-z_] refs help regexp
let g:neocomplete#keyword_patterns.default = '\h\w*'
" ruby のデフォルトの neocomplete#keyword_patterns では、File:: の後の補完が想定した感じにならなかった
let g:neocomplete#keyword_patterns.ruby = '\h\w*'

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

" 2バイト文字有効
set ambiwidth=double

" 括弧のハイライトを消す(括弧が複雑だと重くなる)
let loaded_matchparen = 1

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

" ウィンドウ移動
nnoremap <C-w><Right> <C-w>l
nnoremap <C-w><Left> <C-w>h
nnoremap <C-w><up> <C-w>k
nnoremap <C-w><Down> <C-w>j

" gvimでバックスラッシュが打てない件
inoremap ¥ \

"inoremap Y y$

" インクリメントを単純に
nnoremap + <C-a>
nnoremap - <C-x>

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
\ let @*=join(remove( split( expand( '%:p' ), "/" ), len( split( getcwd(), "/" ) ), -1 ), "/") | echo "copied: ". @*

command! CopyFullPath
\ let @*=expand( '%:p' ) | echo "copied: ". @*

" grep に cw(Quickfixを表示)を追加
au QuickfixCmdPost vimgrep cw

" ref : http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

command! -nargs=* DashRuby !open dash://ruby:'<args>'

command! -nargs=1 Refe Ref refe <args>

"}}}

"---------------------------------------------------------------------
" unite {{{
"---------------------------------------------------------------------
" The prefix key.
 
" unite.vim keymap
nnoremap <silent> ,u :<C-u>Unite<CR>
nnoremap <silent> ,b :<C-u>Unite<Space>buffer   -quick-match -no-split<CR>
nnoremap <silent> ,m :<C-u>Unite<Space>file_mru -no-split<CR>
nnoremap <silent> ,f :<C-u>Unite<Space>file_rec -no-split<CR>

command! UniteColorScheme
\ Unite colorscheme -auto-preview

command! UniteFont
\ Unite font -auto-preview

"Unite file_rec : カレントディレクトリ以下のファイル全て
"Unite file_mru : 最近開いたファイル
"Unite buffer : バッファ
"Unite grep:. : カレントディレクトリ以下をgrep

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" 50行表示
let g:unite_winheight = 50

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <tab> <Down>
  imap <buffer> <s-tab> <Up>
endfunction
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
  autocmd MyAutoCmd BufNewFile,BufRead *.erb setfiletype=eruby
augroup END

" ファイルタイプ毎の折りたたみ設定
autocmd MyAutoCmd Filetype vim setlocal foldmethod=marker
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
match zenkakuda /　/
"}}}

" :A で、テストと実装切り替え
call altr#define('lib/%.rb', 'spec/lib/%_spec.rb')
call altr#define('app/model/%.rb', 'spec/model/%_spec.rb')
call altr#define('app/controller/%.rb', 'spec/controller/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
command! A call altr#forward()

" つくりかけ
command! Issue call Issue_list()
" vim_junk にある、issue_* を一覧表示したい
function! Issue_list()
  let issue_files = split(glob($HOME . "/Dropbox/dotfiles/vim_junk/issue_*"), "\n")
  let issues = {}
  for file in issue_files
    let issues[readfile(file, '', 1)[0]] = file
  endfor

  " バッファ作成
  let bufname = '__ISSUES__'
  execute 'botright 10new ' . bufname

  setlocal modifiable
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nowrap
  setlocal nobuflisted
  setlocal filetype=issues
  setlocal winfixheight

  nnoremap <buffer> <silent> q :close<CR>

  for [title, file] in items(issues)
    echo  split(title, '/')[-1]
    "call append(0, split(title, '/')[-1])
  endfor
  " 行末を削除
  execute 'delete _'
endfunction

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin で発動します）
augroup BinaryXXD
        autocmd!
        autocmd BufReadPre  *.bin let &binary =1
        autocmd BufReadPost * if &binary | silent %!xxd -g 1
        autocmd BufReadPost * set ft=xxd | endif
        autocmd BufWritePre * if &binary | %!xxd -r
        autocmd BufWritePre * endif
        autocmd BufWritePost * if &binary | silent %!xxd -g 1
        autocmd BufWritePost * set nomod | endif
augroup END

"---------------------------------------------------------------------
" previm #{{{
" ref: https://github.com/kannokanno/previm
"---------------------------------------------------------------------
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a firefox'
"}}}

"---------------------------------------------------------------------
" junk file."{{{
" ref: http://vim-users.jp/2010/11/hack181/
"---------------------------------------------------------------------
command! -nargs=? Junk call s:open_junk_file(<f-args>)

function! s:open_junk_file(...)
  if !isdirectory(s:Junk_dir())
    call mkdir(s:Junk_dir(), 'p')
  endif

  if a:0 >= 1
    let l:filename = a:1
    execute 'edit '.s:Junk_dir().filename
  else
    let l:timestr = strftime('%Y-%m-%d_%H:%M')
    let l:filename = timestr.'.md'
    execute 'edit '.s:Junk_dir().filename
  endif

  if filename =~ '.md$'
    call setline(1, '#'.filename)
    execute 'PrevimOpen'
  end
endfunction

function! s:Junk_dir()
  return $HOME . "/Dropbox/dotfiles/vim_junk/"
endfunction

command! -nargs=0 Junks call s:Junk_list()
function! s:Junk_list()
  let l:files = split(glob(s:Junk_dir()."*"), "\n")

  " バッファ作成
  let bufname = '__JUNKFILES__'
  only
  execute 'vertical leftabove 20new'.bufname

  setlocal modifiable
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nowrap
  setlocal nobuflisted
  setlocal filetype=issues
  setlocal winfixheight

  nnoremap <buffer> <silent> q :close<CR>

  for file in files
    call append(0, file)
  endfor
endfunction

command! -nargs=0 JunkDir call s:open_junk_dir()
function! s:open_junk_dir()
  execute 'edit ' . $home . '/dropbox/dotfiles/vim_junk/'
endfunction

command! -nargs=1 JunkGrep call s:junk_grep(<f-args>)
function! s:junk_grep(pattern)
  execute 'vim /'. a:pattern . '/ '. $HOME . '/DropBox/dotFiles/vim_junk/*'
endfunction

" }}}
