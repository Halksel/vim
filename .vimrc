" my .vimrc is copying Shougo's .vimrc.
" https://github.com/Shougo/shougo-s-github/tree/master/vim

if &compatible
    set nocompatible
  endif

function! s:source_rc(path) abort
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

filetype off

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'
" Release keymappings for plug-in.
nnoremap ;  <Nop>
xnoremap ;  <Nop>
nnoremap m  <Nop>
xnoremap m  <Nop>
nnoremap ,  <Nop>
xnoremap ,  <Nop>

syntax on

set autochdir
set directory=$HOME/.vim/tmp "スワップファイル用のディレクトリを指定する
set backupdir=~/.vim/tmp
set mouse=a
set hidden "変更中のファイルでも、保存しないで他のファイルを表示する
set number "行番号を表示する
set cindent
let loaded_matchparen = 1
set clipboard+=autoselect
set pastetoggle=<F6>
set tabstop=2 "Tabをスペース2つに設定
set expandtab "Tabを半角スペースで設定
set shiftwidth=2 "vimにより生成されるファイルのtabを2つに設定
set smarttab "新しい行を作った時に高度な自動インデントを行う
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止めない
set magic
set autoindent smartindent

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"Keymapping -normal
noremap <F5> :<C-u>.tabedit $MYVIMRC<CR>
noremap <F4> :<C-u>.tabedit ~/Documents/codes/AOJ/Snipet.cpp<CR>
noremap <Tab> >>
noremap \<C-i> <C-i>
noremap <S-Tab> <<
nnoremap <silent> <leader>ht :GhcModType<CR>
nnoremap ff :<C-u>SnowdropEchoTypeof<CR>
nnoremap <Esc><Esc> :<C-u>call Chengehlsearch()<CR>
nnoremap fc :<C-u>call Chengefoldenable()<CR>
nnoremap <C-K> <Plug>(caw:i:toggle)
nnoremap <F1> :%y<CR>
nnoremap <F2> :<C-u>.tabedit ~/Documents/codes/AOJ/Snipet.cpp<CR>GVggyZZpggdd61Go
nnoremap <F3> GVgg=
nnoremap / /\v

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

let $VIM_CPP_STDLIB = "/opt/local/include/gcc49/c++"
augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path=/usr/include,/usr/local/include,/opt/local/include/gcc49/c++
augroup END

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""
"https://github.com/koara-local/dotvim/blob/master/vimrc
set nofoldenable
set foldcolumn=1 " 左側に折りたたみガイド表示
set foldmethod=indent " 折畳の判別
set foldtext=Mopp_fold() " 折りたたみ時の表示設定
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo " fold内に移動すれば自動で開く

function! Mopp_fold()
  let line = ' ' . substitutegetline(v:foldstart), '^\s*', '', '')
  for i in range(&shiftwidth * v:foldlevel - 2)
    let line = '-' . line
  endfor
  let line = '+' . line

  let tail = printf('[ %2d Lines Lv%02d ] --- ',
  (v:foldend - v:foldstart + 1), v:foldlevel)

  let space_size = (winwidth(0) - &foldcolumn
  - strdisplaywidth(line . tail) - 1) -
  ((&number) ? max([&numberwidth,
  len(line('$'))]) : 0)

  return printf('%s%' . space_size .
  'S%s', line, '', tail)
endfunction

let g:snowdrop#libclang_directory = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"


" dein

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

let s:toml_path = '~/.vim/rc/dein.toml'
let s:toml_lazy_path = '~/.vim/rc/deinlazy.toml'
if dein#load_cache([expand('<sfile>'), s:toml_path, s:toml_lazy_path])
  call dein#load_toml(s:toml_path, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_path, {'lazy' : 1})


  call dein#save_cache()
endif
call s:source_rc('plugins.rc.vim')

call dein#end()

if dein#check_install()
  " Installation check.
  call dein#install()
endif

"---------------------------------------------------------------------------
"" Encoding:
"

call s:source_rc('encoding.rc.vim')

"---------------------------------------------------------------------------
"" Search:
"

" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase

" Enable incremental search.
set incsearch
" Don't highlight search result.
set nohlsearch

" Searches wrap around the end of the file.
set wrapscan
"---------------------------------------------------------------------------
"" FileType:
"

call s:source_rc('filetype.rc.vim')

""---------------------------------------------------------------------------
" Mappings:
" "

call s:source_rc('mappings.rc.vim')
filetype on
