set encoding=utf-8
scriptencoding utf-8

augroup vimrc
    autocmd!
augroup END

filetype plugin indent on

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>[ gT
nnoremap <Leader>] gt

nnoremap <Leader>l  :ls<CR>
nnoremap <Leader>1  :b 1<CR>
nnoremap <Leader>2  :b 2<CR>
nnoremap <Leader>3  :b 3<CR>
nnoremap <Leader>4  :b 4<CR>
nnoremap <Leader>5  :b 5<CR>
nnoremap <Leader>6  :b 6<CR>
nnoremap <Leader>7  :b 7<CR>
nnoremap <Leader>8  :b 8<CR>
nnoremap <Leader>9  :b 9<CR>

" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x

" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

set fileformats=unix,dos,mac
set backspace=indent,eol,start

let g:NERDTreeShowBookmarks=1
nnoremap <silent> <F2> :NERDTree<CR>

set visualbell t_vb=
set noerrorbells
set mouse=a
set ttymouse=xterm2
set nobackup
set writebackup
set history=10000
set ignorecase
set smartcase
set wrapscan
set noincsearch
set scrolloff=5
set number
set noruler
set list
set listchars=tab:\|\.,eol:$
set showcmd
set laststatus=2
set showmatch
set hlsearch
set wildmode=longest,full
set wildmenu
set cursorline
set ambiwidth=single
set nobomb
set title
set t_Co=256
set belloff=all
set undofile
set undodir=$HOME/tmp/vim
set textwidth=0
set nowrap
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932,iso-2022-jp
set directory=$HOME/tmp/vim
set nofsync
set ttyfast
set hidden
set shortmess+=I

augroup filetypedetect
    autocmd! BufNewFile,BufRead *.xhtml setfiletype html
    autocmd! BufNewFile,BufRead *.sql   setfiletype sql
    autocmd! BufNewFile,BufRead *.psql  setfiletype sql
    autocmd! BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
    autocmd! BufNewFile,BufRead *.ejs set filetype=ejs
augroup END

augroup fileTypeIndent
    autocmd!
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

augroup vimrc
    " カーソル位置を保存
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/snippets/'

autocmd BufWritePost *.snip,*.snippets
    \ call neosnippet#variables#set_snippets({})

" plugin manager ---------------------------------------------
if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif
" ------------------------------------------------------------

set background=dark
syntax on
colorscheme hybrid

" ------------------------------------------------------------
let g:lsp_settings_servers_dir = $HOME . "/tmp/vim-lsp"
let g:lsp_diagnostics_echo_cursor = 1

augroup LspSetting
    autocmd!
    autocmd FileType typescript call s:lsp_setting()
    autocmd FileType javascript call s:lsp_setting()
    autocmd FileType php call s:lsp_setting()
augroup END

function! s:lsp_setting() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> gd :<C-u>LspDefinition<CR>
  nnoremap <buffer> gD :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> <C-h> :<C-u>LspHover<CR>
  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
  nnoremap <buffer> gR :<C-u>LspRename<CR>
  nnoremap <buffer> gL :<C-u>LspDocumentDiagnostics<CR>
endfunction
" ------------------------------------------------------------
