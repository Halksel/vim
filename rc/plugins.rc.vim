if dein#tap('neocomplete.vim') && has('lua') "{{{
let g:loaded_deoplete = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto = 1
execute 'source ~/.vim/rc/plugins/neocomplete.rc.vim'
endif "}}}

execute 'source ~/.vim/rc/plugins/NERDTree.rc.vim'

"clang_complete
let g:clang_use_library   = 1
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
let g:clang_user_options  = '2>/dev/null || exit 0"'
let g:neocomplcache_max_list=1000
let g:clang_complete_copen = 1
let g:clang_user_options = '-std=c++14 -stdlib=libc++'

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
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-d> <Plug>(neosnippet_expand_or_jump)
smap <C-d> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
"\ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
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

" for vim2hs
let g:haskell_conceal = 0

" for diffchar
let g:DiffUpdate = 1

"" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

"let g:instant_markdown_slow = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1

" let g:previm_open_cmd = 'open -a Firefox'
