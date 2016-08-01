if dein#tap('neocomplete.vim') && has('lua') "{{{
let g:loaded_deoplete = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto = 1
execute 'source ~/.vim/rc/plugins/neocomplete.rc.vim'
endif "}}}

"clang_complete
let g:clang_use_library   = 1
let g:clang_library_path  = '/usr/share/clang'
let g:clang_user_options  = '2>/dev/null || exit 0"'
let g:neocomplcache_max_list=1000
let g:clang_complete_copen = 1
let g:clang_user_options = '-std=c++11 -stdlib=libc++'

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

" Plugin key-mappings.
" imap <C-q>     <Plug>(neosnippet_expand_or_jump)
" smap <C-q>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-q>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:zeropos:toggle)
vmap \c <Plug>(caw:zeropos:toggle)
" \C でコメントアウトの解除
nmap \C <Plug>(caw:zeropos:uncomment)
vmap \C <Plug>(caw:zeropos:uncomment)
