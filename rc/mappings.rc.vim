" Visual mode keymappings: "{{{
" <TAB>: indent.
xnoremap <TAB> >
" <S-TAB>: unindent.
xnoremap <S-TAB> <

" Indent
nnoremap > >>
nnoremap < <<


" Insert mode keymappings: "{{{
" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>
"}}}
" [Space]: Other useful commands "{{{
" Smart space mapping.
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

" Toggle relativenumber.
nnoremap <silent> [Space].
  \ :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> [Space]m
  \ :<C-u>call ToggleOption('paste')<CR>:set mouse=<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
  \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
  \ :<C-u>call ToggleOption('cursorline')<CR>
" Set autoread.
nnoremap [Space]ar
  \ :<C-u>setlocal autoread<CR>
" Set spell check.
nnoremap [Space]p
  \ :<C-u>call ToggleOption('spell')<CR>
  \:set spelllang=en_us<CR>
  \:set spelllang+=cjk<CR>
nnoremap [Space]w
  \ :<C-u>call ToggleOption('wrap')<CR>
"}}}

" Easily edit .vimrc and .gvimrc "{{{
  nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>

" Useful save mappings.
nnoremap <Leader><Leader> :<C-u>update<CR>

" Toggle options. "{{{
function! ToggleOption(option_name) abort
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}


" Disable Ex-mode.
  nnoremap Q  q

" Disable ZZ.
nnoremap ZZ  <Nop>

" Auto escape / and ? in search command.
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" Redraw.
nnoremap <silent> <C-l>    :<C-u>redraw!<CR>

" Folding."{{{
" If press h on head, fold close.
"nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press h on head, range fold close.
"xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
noremap [Space]j zj
noremap [Space]k zk
noremap zu :<C-u>Unite outline:foldings<CR>
noremap zz za
"}}}

" Clear highlight.
nnoremap <ESC><ESC> :nohlsearch<CR>:match<CR>
"}}}

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)
" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)
