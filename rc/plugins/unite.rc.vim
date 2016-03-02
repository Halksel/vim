"---------------------------------------------------------------------------
" unite.vim
"

let g:unite_enable_auto_select = 0

" For unite-menu.
let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.enc = {
  \     'description' : 'Open with a specific character code again.',
  \ }


let g:unite_source_menu_menus.enc.command_candidates = [
  \       ['utf8', 'Utf8'],
  \       ['iso2022jp', 'Iso2022jp'],
  \       ['cp932', 'Cp932'],
  \       ['euc', 'Euc'],
  \       ['utf16', 'Utf16'],
  \       ['utf16-be', 'Utf16be'],
  \       ['jis', 'Jis'],
  \       ['sjis', 'Sjis'],
  \       ['unicode', 'Unicode'],
  \     ]

let g:unite_source_menu_menus.fenc = {
  \     'description' : 'Change file fenc option.',
  \ }
let g:unite_source_menu_menus.fenc.command_candidates = [
  \       ['utf8', 'WUtf8'],
  \       ['iso2022jp', 'WIso2022jp'],
  \       ['cp932', 'WCp932'],
  \       ['euc', 'WEuc'],
  \       ['utf16', 'WUtf16'],
  \       ['utf16-be', 'WUtf16be'],
  \       ['jis', 'WJis'],
  \       ['sjis', 'WSjis'],
  \       ['unicode', 'WUnicode'],
  \     ]

let g:unite_source_menu_menus.ff = {
  \     'description' : 'Change file format option.',
  \ }
let g:unite_source_menu_menus.ff.command_candidates = {
  \       'unix'   : 'WUnix',
  \       'dos'    : 'WDos',
  \       'mac'    : 'WMac',
  \     }
let g:unite_source_menu_menus.unite = {
  \     'description' : 'Start unite sources',
  \ }
let g:unite_source_menu_menus.unite.command_candidates = {
  \       'history'    : 'Unite history/command',
  \       'quickfix'   : 'Unite qflist -no-quit',
  \       'resume'     : 'Unite -buffer-name=resume resume',
  \       'directory'  : 'Unite -buffer-name=files '.
  \       '-default-action=lcd directory_mru',
  \       'mapping'    : 'Unite mapping',
  \       'message'    : 'Unite output:message',
  \       'scriptnames': 'Unite output:scriptnames',
  \     }

let g:unite_source_menu_menus.zsh = {
  \     'description' : 'Edit zsh files',
  \ }
let g:unite_source_menu_menus.zsh.file_candidates = [
  \       ['zshenv'    , '~/.zshenv'],
  \       ['zshrc'     , '~/.zshrc'],
  \       ['zplug'     , '~/.zplug'],
  \     ]

" For unite-alias.
let g:unite_source_alias_aliases = {}
let g:unite_source_alias_aliases.test = {
  \ 'source' : 'file_rec',
  \ 'args'   : '~/',
  \ }
let g:unite_source_alias_aliases.line_migemo = 'line'
let g:unite_source_alias_aliases.calc = 'kawaii-calc'
let g:unite_source_alias_aliases.l = 'launcher'
let g:unite_source_alias_aliases.kill = 'process'
let g:unite_source_alias_aliases.message = {
  \ 'source' : 'output',
  \ 'args'   : 'message',
  \ }
let g:unite_source_alias_aliases.mes = {
  \ 'source' : 'output',
  \ 'args'   : 'message',
  \ }
let g:unite_source_alias_aliases.scriptnames = {
  \ 'source' : 'output',
  \ 'args'   : 'scriptnames',
  \ }

nnoremap <silent> [Space]n  :UniteNext<CR>
nnoremap <silent> [Space]p  :UnitePrevious<C-Right>
