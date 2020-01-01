set encoding=utf-8
scriptencoding utf-8

source ~/.vim/bundles.vim

augroup vimrc
	autocmd!
augroup END

filetype plugin indent on
set background=dark
colorscheme hybrid

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
	autocmd! BufNewFile,BufRead *.inc		setfiletype php
	autocmd! BufNewFile,BufRead *.xhtml		setfiletype html
	autocmd! BufNewFile,BufRead *.sql		setfiletype sql
	autocmd! BufNewFile,BufRead *.psql		setfiletype sql
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

	" " 保存時にerrormaker.vimでCUIの画面がぶれるので、いったん再描画する
	" autocmd QuickfixCmdPost make redraw!
	" " quickfixに対象が存在した場合に自動起動する用に設定
	" autocmd QuickfixCmdPost make if len(getqflist()) != 0 | copen | endif
	" " quickfixに対象が存在しなかった場合に自動で閉じるように設定
	" autocmd QuickfixCmdPost make if len(getqflist()) == 0 | cclose | endif
	" autocmd FileType php set makeprg=php\ -l\ %
	" autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
augroup END

syntax on

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_php_checkers=['php']
let g:syntastic_mode_map={
\ 'mode': 'passive',
\ 'active_filetypes': ['php', 'javascript', 'json','css','typescript'],
\ 'passive_filetypes': []
\}
" エラーが存在する場合はステータスラインに表示
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set guifont=Ricty\ Regular:h10

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

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
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:tsuquyomi_completion_case_sensitive = 1
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_completion_detail = 1

autocmd FileType typescript setlocal completeopt+=menu,preview,longest
autocmd FileType typescript nmap <C-h> :echo tsuquyomi#hint()<CR>

let g:tsuquyomi_disable_quickfix = 1

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:phpcd_php_cli_executable='/usr/local/bin/php'

let g:syntastic_typescript_tsc_args="--experimentalDecorators --target ES5"

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

