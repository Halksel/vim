if dein#tap('neocomplete.vim') && has('lua') "{{{
let g:loaded_deoplete = 1
let g:neocomplete#enable_at_startup = 1
execute 'source ~/.vim/rc/plugins/neocomplete.rc.vim'
endif "}}}

if dein#tap('unite.vim') "{{{
nnoremap    [unite]   <Nop>
xnoremap    [unite]   <Nop>
nmap    ;u [unite]
xmap    ;u [unite]

nnoremap <silent> ;b
\ :<C-u>Unite -buffer-name=build`tabpagenr()` -no-quit build<CR>
nnoremap <silent> ;t
\ :<C-u>Unite -buffer-name=test`tabpagenr()` -no-quit build::test<CR>
nnoremap <silent> ;o
\ :<C-u>Unite outline -no-start-insert -resume<CR>
nnoremap <silent> ;t
\ :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
xnoremap <silent> ;r
\ d:<C-u>Unite -buffer-name=register
\ -default-action=append register history/yank<CR>
nnoremap <silent> <C-k>
\ :<C-u>Unite change jump<CR>
nnoremap <silent> ;g
\ :<C-u>Unite grep -buffer-name=grep`tabpagenr()`
\ -auto-preview -no-split -no-empty -resume<CR>
nnoremap <silent> ;r
\ :<C-u>Unite -buffer-name=register
\ -default-action=append register history/yank<CR>
nnoremap <silent> ;;
\ :<C-u>Unite -start-insert command history/command<CR>

" Execute help.
nnoremap <silent> <C-h>  :<C-u>Unite -buffer-name=help help<CR>

" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
endif "}}}

execute 'source ~/.vim/rc/plugins/unite.rc.vim'

if dein#tap('vim-quickrun') "{{{
nmap <silent> <Leader>r <Plug>(quickrun)
  endif "}}}
