"---------------------------------------------------------------------------
" Encoding:
"
" The automatic recognition of the character code.

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.

if has('vim_starting') && &encoding !=# 'utf-8'
    set encoding=utf-8
endif

" Default fileformat.
set fileformat=unix

