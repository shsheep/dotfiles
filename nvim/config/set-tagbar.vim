autocmd VimEnter * Tagbar

let g:tagbar_sort = 0
let g:tagbar_width = 22
let g:tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
let g:Tlist_Ctags_Cmd = "/opt/homebrew/bin/ctags"

nmap <F5> :Tagbar<CR>:Tagbar<CR>
imap <F5> <ESC><F5>i
