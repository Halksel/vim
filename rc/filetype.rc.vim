"---------------------------------------------------------------------------
" FileType:
"

" Enable smart indent.
set autoindent smartindent
" Vim
let g:vimsyntax_noerror = 1

"""  mips
au BufNewFile,BufRead *.asm setfiletype mips

"""  cpp
let $VIM_CPP_STDLIB = "/opt/local/include/gcc49/c++"
let $VIM_BOOST_LIB = "~/Downloads/boost_1_58_0"
function s:cpp()
  " BOOST_PP_XXX 等のハイライトを行う
  setlocal path +=$VIM_BOOST_LIB,$VIM_CPP_STDLIB
  syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
  highlight link boost_pp cppStatement
  let g:neocomplete#sources#include#paths = $VIM_CPP_STDLIB
endfunction

augroup vimrc-cpp
  autocmd!
  autocmd FileType cpp call s:cpp()
augroup END

augroup vimrc-set_filetype_cpp
  autocmd!
  " $CPP_STDLIB よりも下の階層のファイルが開かれて
  " filetype が設定されていない場合に filetype=cpp を設定する
  autocmd BufReadPost $VIM_CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END
""" Haskell
augroup vimrc-haskell-sort-import
    autocmd!
      autocmd BufWritePre *.hs HaskellSortImport
augroup END
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

function s:markdown()
  inoremap \ \\
endfunction

augroup vimrc-markdown
  autocmd!
  autocmd FileType markdown call s:markdown()
augroup END
