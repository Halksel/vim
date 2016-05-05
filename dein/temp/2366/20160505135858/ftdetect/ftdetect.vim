" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
autocmd BufNewFile,BufRead *.toml set filetype=toml

" Rust uses Cargo.toml and Cargo.lock (both are toml files).
autocmd BufNewFile,BufRead Cargo.lock set filetype=toml
autocmd BufNewFile,BufRead ~/.cabal/config setlocal filetype=cabalconfig
autocmd BufNewFile,BufRead *.tpl setlocal filetype=heist
autocmd BufNewFile,BufRead *.hsc setlocal filetype=haskell
autocmd BufNewFile,BufRead *.jmacro setlocal filetype=jmacro
