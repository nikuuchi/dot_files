" ===========================
"           .vimrc
" ===========================

" == setting ==
set nocompatible
syntax on
colorscheme elflord
set autoread

" == key config ==
nmap ; :
nnoremap t <C-w>
inoremap <C-g> <ESC>
nnoremap <C-c> :set expandtab<CR>
" == Tab and Indent ==

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

set autoindent
set smartindent
set cindent
set noexpandtab

" == Line number ==
set number
set backspace=indent,eol,start
set nobackup
set ruler
set list
set listchars=tab:>.,eol:$
hi SpecialKey        guibg=#222222 ctermfg=darkgrey
hi NonText            cterm=NONE

" == status settings ==
set laststatus=2
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P
highlight statusline   term=NONE cterm=NONE guifg=red ctermfg=white ctermbg=darkgray


" == unite.vim ==

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap b :Unite buffer<CR>
" ファイル一覧
noremap f :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" Overwrite settings.
endfunction
" 様々なショートカット
call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
call unite#set_substitute_pattern('file', '^;v', '~/.vim/')

" == gtags ==

" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nnoremap <C-g> :Gtags -g 
" このファイルの関数一覧
nnoremap <C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nnoremap <C-j> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>


" == neocomplcache ==
let g:neocomplcache_enable_at_startup = 1

" == zenoding.vim ==
helptags ~/.vim/doc

" == folding ==
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything
