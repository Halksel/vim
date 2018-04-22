if dein#tap('neocomplete.vim') && has('lua') "{{{
let g:loaded_deoplete = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto = 1
execute 'source ~/.vim/rc/plugins/neocomplete.rc.vim'
endif "}}}

"setting for NERDTree
execute 'source ~/.vim/rc/plugins/NERDTree.rc.vim'

"setting for air-line
execute 'source ~/.vim/rc/plugins/air-line.rc.vim'

"setting for vim-fugitive
execute 'source ~/.vim/rc/plugins/vim-fugitive.rc.vim'

"setting for ale
execute 'source ~/.vim/rc/plugins/ale.rc.vim'

"clang_complete
let g:clang_use_library   = 1
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
let g:clang_user_options  = '2>/dev/null || exit 0"'
let g:neocomplcache_max_list=1000
let g:clang_complete_copen = 1
let g:clang_user_options = '-std=c++14 -stdlib=libc++'

"setting for denite
if dein#tap('denite.vim') "{{{
  execute 'source ~/.vim/rc/plugins/denite.rc.vim'
endif "}}}


if dein#tap('vim-quickrun') "{{{
  nmap <silent> <Leader>r <Plug>(quickrun)
  " vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
  let g:quickrun_config = {
      \ '_' : {
          \ 'runner' : 'vimproc',
          \ 'runner/vimproc/updatetime' : 40,
          \ 'outputter' : 'error',
          \ 'outputter/error/success' : 'buffer',
          \ 'outputter/error/error'   : 'quickfix',
          \ 'outputter/buffer/split' : ':botright 8sp',
      \ }
  \}

" 実行時に前回の表示内容をクローズ&保存してから実行
  let g:quickrun_no_default_key_mappings = 1
  nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
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

" for supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

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
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

"let g:instant_markdown_slow = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1

" let g:previm_open_cmd = 'open -a Firefox'
