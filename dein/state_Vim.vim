let plugins = dein#load_cache_raw(['/Users/Hira/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_base_path = '/Users/Hira/.vim/dein'
let g:dein#_runtime_path = '/Users/Hira/.vim/dein/.dein'
let &runtimepath = '/Users/Hira/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/Hira/.vim/dein/.dein,/Users/Hira/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/Hira/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/runtime/pack/dist/opt/matchit,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/Hira/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimproc,/Users/Hira/.vim/dein/.dein/after'
filetype off
silent! nnoremap <unique><silent> <Plug>(caw :call dein#autoload#_on_map('<lt>Plug>(caw', 'caw.vim','n')<CR>
silent! xnoremap <unique><silent> <Plug>(caw :call dein#autoload#_on_map('<lt>Plug>(caw', 'caw.vim','x')<CR>
silent! onoremap <unique><silent> <Plug>(caw :call dein#autoload#_on_map('<lt>Plug>(caw', 'caw.vim','o')<CR>
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim', 'neco-vim', 'neco-syntax'])
