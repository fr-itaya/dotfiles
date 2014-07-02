"行番号表示
set nocompatible
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdtree'
filetype plugin indent on
NeoBundleCheck
autocmd VimEnter * NERDTree
set number
"インデントをSpace2つに
set tabstop=2
"オートインデント有効
set autoindent
"オートインデント時のスペースを4つに
set expandtab
set shiftwidth=4
"検索がファイル末尾まで行った場合、ファイル先頭から再び検索する
set wrapscan
"文字エンコーディングはUTF-8
set encoding=UTF-8
"カーソルキー無効
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
"vim256色表示のカラースキーム導入"
NeoBundle 'wombat256.vim'
:colorscheme wombat256mod
"スニペット導入"
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet-snippets'
"フロントエンドコーディング系のプラグイン導入"
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/livestyle-vim'
NeoBundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'
NeoBundle 'cakebaker/scss-syntax.vim'
"quickrun"
NeoBundle 'thinca/vim-quickrun'
"powerline"
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

"scssハイライト"
au BufRead,BufNewFile *.scss set filetype=sass

"Emmetvim"
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \ 'html' : {
  \   'filters' : 'html',
  \ },
  \ 'css' : {
  \   'filters' : 'fc',
  \ },
  \ 'php' : {
  \   'extends' : 'html',
  \   'filters' : 'html',
  \ },
  \}
augroup EmmetVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END
"neosnippet"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"neocomplcache"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
