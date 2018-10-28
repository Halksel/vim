"Don't Use CursolKey!
" vnoremap  <Up>     <nop>
" vnoremap  <Down>   <nop>
" vnoremap  <Left>   <nop>
" vnoremap  <Right>  <nop>
" inoremap  <Up>     <nop>
" inoremap  <Down>   <nop>
" inoremap  <Left>   <nop>
" inoremap  <Right>  <nop>
" noremap   <Up>     <nop>
" noremap   <Down>   <nop>
" noremap   <Left>   <nop>
" noremap   <Right>  <nop>

" CursolKey mappings
inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <UP>
inoremap <C-l> <Right>

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k

" Indent
nnoremap > >>
nnoremap < <<
" <TAB>: indent.
xnoremap <TAB> >
" <S-TAB>: unindent.
xnoremap <S-TAB> <

" Insert mode keymappings: "{{{
" <C-t>: insert tab.
inoremap <silent> jj <ESC>
"}}}

" Normal mode keymappings: "{{{
nnoremap cc ciw
nnoremap Y y$
nnoremap ; :
nnoremap : ;

"}}}
" Visual mode keymappings: "{{{
vnoremap wy iwy
" }}}
" [Space]: Other useful commands "{{{
" Smart space mapping.
nmap  <silent> <Space>   [Space]
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
nnoremap [Space]r :w<CR>:source $FILENAME<CR>

function Invert()
  let &background = &background ==# 'light' ? 'dark' : 'light'
endfunction
nnoremap [Space]cc :call Invert()<CR>
"}}}

" Toggle options. "{{{
function! ToggleOption(option_name) abort
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}

" Easily edit .vimrc and .gvimrc "{{{
  nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>

" Useful save mappings.
nnoremap <Leader><Leader> :<C-u>update<CR>

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
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press h on head, range fold close.
xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
noremap [Space]j zj
noremap [Space]k zk
noremap zu :<C-u>Unite outline:foldings<CR>
"}}}

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" for JSON
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

nnoremap <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
nnoremap <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
nnoremap <silent> [Tag]n :tabNext<CR>
" tn 次のタブ
nnoremap <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" for ale
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
" nmap <C-f> <Plug>(ale_fix)
nmap <C-s> <Plug>(ale_toggle)
