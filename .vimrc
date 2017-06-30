" Add ~/.vimrc {{{
" function! s:source_rc(path) abort
"   execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
" endfunction
"
" call s:source_rc('../.vimrc')
" }}}

" ~/.vim/rc/.vimrc
" my .vimrc is custumizing Shougo's .vimrc.
" https://github.com/Shougo/shougo-s-github/tree/master/vim

if &compatible
  set nocompatible
endif

function! s:source_rc(path) abort
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

filetype off
filetype plugin indent off

set path +=~/.vim/rc

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
"Setting vim ColorScheme
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette
set t_Co=256
colorscheme iceberg

set autochdir
set directory=$HOME/.vim/tmp "スワップファイル用のディレクトリを指定する
set backupdir=~/.vim/tmp
set mouse=a
set hidden "変更中のファイルでも、保存しないで他のファイルを表示する
set number "行番号を表示する
set cindent
let loaded_matchparen = 1
set clipboard+=autoselect
set tabstop=2 "Tabをスペース2つに設定
set expandtab "Tabを半角スペースで設定
set shiftwidth=2 "vimにより生成されるファイルのtabを2つに設定
set smarttab "新しい行を作った時に高度な自動インデントを行う
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止めない
set magic
set autoindent smartindent
set cursorline
set diffopt=vertical
set backspace=indent,eol,start
set laststatus=2
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"""autocmd

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END
"
" "Keymapping -normal
noremap <Tab> >>
noremap \<C-i> <C-i>
noremap <S-Tab> <<
nnoremap <leader>ht :GhcModType<CR>
nnoremap <leader>hh :GhcModTypeClear<CR>
nnoremap <C-K> <Plug>(caw:i:toggle)
nnoremap <F1> :%y+<CR>
nnoremap <F2> :<C-u>.tabedit ~/Documents/codes/Competition/Snipet/Snipet.cpp<CR>GVggyZZpggdd44Go
nnoremap <F3> :<C-u>.tabedit ~/Documents/codes/Competition/Snipet/Templete.cpp<CR>
nnoremap <F4> :<C-u>.tabedit ~/Documents/codes/Competition/Snipet/Snipet.cpp<CR>
" nnoremap <F5> :<C-u>.tabedit $MYVIMRC<CR>
nnoremap <F5> :call previm#refresh()<CR>
nnoremap = GVgg=
nnoremap / /\v

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction


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

" dein
if 1
  "  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
  let s:dein_dir = expand('~/.vim/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim'
      s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml_path = expand('~/.vim/rc/dein.toml')
    let s:toml_lazy_path = expand('~/.vim/rc/deinlazy.toml')
    call dein#load_toml(s:toml_path, {'lazy': 0})
    call dein#load_toml(s:toml_lazy_path, {'lazy' : 1})
    call dein#end()
    call dein#save_state()
  endif
  call s:source_rc('plugins.rc.vim')
  let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'

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
"   filetype on
  filetype plugin indent on
endif

"setting for haskell

set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
      \ 'ctagsbin'  : 'hasktags',
      \ 'ctagsargs' : '-x -c -o-',
      \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
      \ ],
      \ 'sro'        : '.',
      \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
      \ },
      \ 'scope2kind' : {
          \ 'module' : 'm',
          \ 'class'  : 'c',
          \ 'data'   : 'd',
          \ 'type'   : 't'
      \ }
\ }
autocmd BufReadPost * :colorscheme iceberg
" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
