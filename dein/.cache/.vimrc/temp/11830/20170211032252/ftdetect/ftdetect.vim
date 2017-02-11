" Rust uses several TOML config files that are not named with .toml.
autocmd BufNewFile,BufRead *.toml,Cargo.lock,.cargo/config set filetype=toml
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
autocmd BufNewFile,BufRead ~/.cabal/config setlocal filetype=cabalconfig
autocmd BufNewFile,BufRead *.tpl setlocal filetype=heist
autocmd BufNewFile,BufRead *.hsc setlocal filetype=haskell
autocmd BufNewFile,BufRead *.jmacro setlocal filetype=jmacro
